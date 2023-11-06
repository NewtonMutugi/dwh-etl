BEGIN
    WITH ct_patient_source
         AS (SELECT DISTINCT patients.patientidhash,
                             patients.patientpkhash,
                             patients.patientid,
                             patients.patientpk,
                             patients.sitecode,
                             gender,
                             Cast(dob AS DATE)
                                AS DOB,
                             maritalstatus,
                             nupihash,
                             patienttype,
                             patientsource,
                             baselines.ewho
                                AS EnrollmentWHOKey,
                             Cast(Format(COALESCE(ewhodate, '1900-01-01'),
                                  'yyyyMMdd') AS
                                  INT) AS
                             DateEnrollmentWHOKey,
                             bwho
                                AS BaseLineWHOKey,
                             Cast(Format(COALESCE(bwhodate, '1900-01-01'),
                                  'yyyyMMdd') AS
                                  INT) AS
                             DateBaselineWHOKey,
                             CASE
                               WHEN outcomes.artoutcome = 'V' THEN 1
                               ELSE 0
                             END
                                AS IsTXCurr,
                             Cast(Getdate() AS DATE)
                                AS LoadDate
             FROM   ods.dbo.ct_patient AS patients
                    LEFT JOIN ods.dbo.ct_patientbaselines AS baselines
                           ON patients.patientpkhash = baselines.patientpkhash
                              AND patients.sitecode = baselines.sitecode
                    LEFT JOIN ods.dbo.intermediate_artoutcomes AS outcomes
                           ON outcomes.patientpkhash = patients.patientpkhash
                              AND outcomes.sitecode = patients.sitecode
            where patients.voided = 0
            ),
         hts_patient_source
         AS (SELECT DISTINCT htsnumberhash,
                             patientpkhash,
                             patientpk,
                             sitecode,
                             Cast(dob AS DATE) AS DOB,
                             gender,
                             maritalstatus,
                             nupihash
             FROM   ods.dbo.hts_clients AS clients
            where voided =0
            ),
         prep_patient_source
         AS (SELECT DISTINCT patientpkhash,
                             patientpk,
                             prepnumber,
                             sitecode,
                             prepenrollmentdate,
                             sex,
                             dateofbirth,
                             clienttype,
                             maritalstatus
             FROM   ods.dbo.prep_patient),
         pmtct_patient_source
         AS (SELECT DISTINCT patientpkhash,
                             patientpk,
                             sitecode,
                             dob,
                             gender,
                             nupihash,
                             patientmnchidhash,
                             maritalstatus,
                             Cast(Format(firstenrollmentatmnch, 'yyyyMMdd') AS
                                  INT)
                             AS
                             FirstEnrollmentAtMnchDateKey
             FROM   ods.dbo.mnch_patient),
         combined_data_ct_hts
         AS (SELECT COALESCE(ct_patient_source.patientpkhash,
                    hts_patient_source.patientpkhash) AS
                    PatientPKHash,
                    COALESCE(ct_patient_source.sitecode,
                    hts_patient_source.sitecode)
                       AS SiteCode,
                    COALESCE(ct_patient_source.nupihash,
                    hts_patient_source.nupihash)
                       AS NUPI,
                    COALESCE(ct_patient_source.dob, hts_patient_source.dob)
                       AS DOB,
                    COALESCE(ct_patient_source.maritalstatus,
                    hts_patient_source.maritalstatus) AS
                    MaritalStatus,
                    COALESCE(ct_patient_source.gender,
                    hts_patient_source.gender)
                       AS Gender,
                    ct_patient_source.patientidhash,
                    ct_patient_source.patienttype
                       AS ClientType,
                    ct_patient_source.patientsource,
                    ct_patient_source.enrollmentwhokey,
                    ct_patient_source.dateenrollmentwhokey,
                    ct_patient_source.baselinewhokey,
                    ct_patient_source.datebaselinewhokey,
                    ct_patient_source.istxcurr,
                    hts_patient_source.htsnumberhash,
                    Cast(Getdate() AS DATE)
                       AS LoadDate
             FROM   ct_patient_source
                    FULL JOIN hts_patient_source
                           ON hts_patient_source.patientpkhash =
                              ct_patient_source.patientpkhash
                              AND ct_patient_source.sitecode =
                                  hts_patient_source.sitecode),
         combined_data_ct_hts_prep
         AS (SELECT COALESCE(combined_data_ct_hts.patientpkhash,
                    prep_patient_source.patientpkhash)
                       AS PatientPKHash,
                    COALESCE(combined_data_ct_hts.sitecode,
                    prep_patient_source.sitecode)
                       AS
                    SiteCode,
                    combined_data_ct_hts.nupi
                       AS NUPI,
                    COALESCE(combined_data_ct_hts.dob,
                    prep_patient_source.dateofbirth)
                       AS DOB,
                    COALESCE(combined_data_ct_hts.maritalstatus,
                    prep_patient_source.maritalstatus)
                                                 AS MaritalStatus,
                    COALESCE(combined_data_ct_hts.gender,
                    prep_patient_source.sex)
                       AS Gender,
                    combined_data_ct_hts.patientidhash,
                    COALESCE(combined_data_ct_hts.clienttype,
                       prep_patient_source.clienttype) AS
                    ClientType,
                    combined_data_ct_hts.patientsource,
                    combined_data_ct_hts.enrollmentwhokey,
                    combined_data_ct_hts.dateenrollmentwhokey,
                    combined_data_ct_hts.baselinewhokey,
                    combined_data_ct_hts.datebaselinewhokey,
                    combined_data_ct_hts.istxcurr,
                    combined_data_ct_hts.htsnumberhash,
                    prep_patient_source.prepnumber,
                    Cast(Format(prep_patient_source.prepenrollmentdate,
                         'yyyyMMdd')
                         AS
                         INT)
                       AS
                    PrepEnrollmentDateKey
             FROM   combined_data_ct_hts
                    FULL JOIN prep_patient_source
                           ON combined_data_ct_hts.patientpkhash =
                              prep_patient_source.patientpkhash
                              AND prep_patient_source.sitecode =
                                  combined_data_ct_hts.sitecode),
         combined_data_ct_hts_prep_pmtct
         AS (SELECT COALESCE(combined_data_ct_hts_prep.patientpkhash,
                               pmtct_patient_source.patientpkhash)
                       AS PatientPKHash,
                    COALESCE(combined_data_ct_hts_prep.sitecode,
                    pmtct_patient_source.sitecode) AS
                    SiteCode,
                    COALESCE(combined_data_ct_hts_prep.nupi,
                    pmtct_patient_source.nupihash)
                       AS Nupi,
                    COALESCE(combined_data_ct_hts_prep.dob,
                    pmtct_patient_source.dob)
                       AS DOB,
                    COALESCE(combined_data_ct_hts_prep.maritalstatus,
                    pmtct_patient_source.maritalstatus)
                       AS MaritalStatus,
                    COALESCE(combined_data_ct_hts_prep.gender,
                    pmtct_patient_source.gender)
                       AS
                    Gender,
                    combined_data_ct_hts_prep.patientidhash,
                    combined_data_ct_hts_prep.clienttype,
                    combined_data_ct_hts_prep.patientsource,
                    combined_data_ct_hts_prep.enrollmentwhokey,
                    combined_data_ct_hts_prep.dateenrollmentwhokey,
                    combined_data_ct_hts_prep.baselinewhokey,
                    combined_data_ct_hts_prep.datebaselinewhokey,
                    combined_data_ct_hts_prep.istxcurr,
                    combined_data_ct_hts_prep.htsnumberhash,
                    combined_data_ct_hts_prep.prepenrollmentdatekey,
                    combined_data_ct_hts_prep.prepnumber,
                    pmtct_patient_source.patientmnchidhash,
                    pmtct_patient_source.firstenrollmentatmnchdatekey,
                    Cast(Getdate() AS DATE)
                       AS LoadDate
             FROM   combined_data_ct_hts_prep
                    FULL JOIN pmtct_patient_source
                           ON combined_data_ct_hts_prep.patientpkhash =
                              pmtct_patient_source.patientpkhash
                              AND combined_data_ct_hts_prep.sitecode =
                                  pmtct_patient_source.sitecode)
    MERGE [NDWH].[DBO].[dimpatient] AS a
    using (SELECT combined_data_ct_hts_prep_pmtct.patientidhash,
                  combined_data_ct_hts_prep_pmtct.patientpkhash,
                  combined_data_ct_hts_prep_pmtct.htsnumberhash,
                  combined_data_ct_hts_prep_pmtct.prepnumber,
                  combined_data_ct_hts_prep_pmtct.sitecode,
                  combined_data_ct_hts_prep_pmtct.nupi,
                  combined_data_ct_hts_prep_pmtct.dob,
                  combined_data_ct_hts_prep_pmtct.maritalstatus,
                  CASE
                    WHEN combined_data_ct_hts_prep_pmtct.gender = 'M' THEN
                    'Male'
                    WHEN combined_data_ct_hts_prep_pmtct.gender = 'F' THEN
                    'Female'
                    ELSE combined_data_ct_hts_prep_pmtct.gender
                  END AS Gender,
                  combined_data_ct_hts_prep_pmtct.clienttype,
                  combined_data_ct_hts_prep_pmtct.patientsource,
                  combined_data_ct_hts_prep_pmtct.enrollmentwhokey,
                  combined_data_ct_hts_prep_pmtct.datebaselinewhokey,
                  combined_data_ct_hts_prep_pmtct.baselinewhokey,
                  combined_data_ct_hts_prep_pmtct.prepenrollmentdatekey,
                  combined_data_ct_hts_prep_pmtct.istxcurr,
                  combined_data_ct_hts_prep_pmtct.patientmnchidhash,
                  combined_data_ct_hts_prep_pmtct.firstenrollmentatmnchdatekey,
                  combined_data_ct_hts_prep_pmtct.loaddate
           FROM   combined_data_ct_hts_prep_pmtct) AS b
    ON ( a.sitecode = b.sitecode
         AND a.patientpkhash = b.patientpkhash
        )
    WHEN NOT matched THEN
      INSERT(patientidhash,
             patientpkhash,
             htsnumberhash,
             prepnumber,
             sitecode,
             nupi,
             dob,
             maritalstatus,
             gender,
             clienttype,
             patientsource,
             enrollmentwhokey,
             datebaselinewhokey,
             baselinewhokey,PrepEnrollmentDateKey,
             istxcurr,
             loaddate)
      VALUES(patientidhash,
             patientpkhash,
             htsnumberhash,
             prepnumber,
             sitecode,
             nupi,
             dob,
             maritalstatus,
             gender,
             clienttype,
             patientsource,
             enrollmentwhokey,
             datebaselinewhokey,
             baselinewhokey,PrepEnrollmentDateKey,
             istxcurr,
             loaddate)
    WHEN matched THEN
      UPDATE SET a.maritalstatus = b.maritalstatus,
                 a.clienttype		= b.clienttype,
                 a.patientsource	= b.patientsource,
				 a.patientidhash   = b.patientidhash,
                 a.nupi				= b.nupi,
                 a.dob				= b.dob,
                 a.gender			= b.gender,
                 a.prepnumber		= b.prepnumber,
				 a.IsTxcur          = b.IsTxcur,
				 a.enrollmentwhokey  =b.enrollmentwhokey,
				 a.baselinewhokey  =b.baselinewhokey,
				 a.PrepEnrollmentDateKey = b.PrepEnrollmentDateKey;
END 