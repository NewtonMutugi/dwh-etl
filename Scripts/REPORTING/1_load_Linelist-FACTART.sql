IF OBJECT_ID(N'[REPORTING].[dbo].[Linelist_FACTART]', N'U') IS NOT NULL 
	DROP TABLE [REPORTING].[dbo].[Linelist_FACTART];
BEGIN

with ncd_indicators as (
    select 
        PatientKey,
        Hypertension as HasHypertension,
        ScreenedBPLastVisit,
        IsBPControlledAtLastVisit,
        Diabetes as HasDiabetes,
        ScreenedDiabetes,
        IsDiabetesControlledAtLastTest
    from NDWH.dbo.FactNCD
)
Select distinct 
    pat.PatientIDHash,
    pat.PatientPKHash,
    pat.Gender,
    pat.DOB,
    pat.MaritalStatus,
    pat.Nupi,
    pat.PatientSource,
    pat.ClientType,
    pat.SiteCode,
    fac.FacilityName,
    fac.County,
    fac.SubCounty,
    partner.PartnerName,
    agency.AgencyName,
    age.age,
    age.DATIMAgeGroup as AgeGroup,
    startdate.Date as StartARTDate,
    CurrentRegimen,
    CurrentRegimenline,
    StartRegimen,
    StartRegimenLine,
    AgeAtEnrol,
    AgeAtARTStart,
    TimetoARTDiagnosis,
    TimetoARTEnrollment,
    PregnantARTStart,
    PregnantAtEnrol,
    LastVisitDate,
    NextAppointmentDate,
    StartARTAtThisfacility,
    PreviousARTStartDate,
    PreviousARTRegimen,
    case 
        when outcome.ARTOutcome is null then 'Others'
        else outcome.ARTOutcomeDescription
    end as ARTOutcomeDescription,
    vl.EligibleVL as Eligible4VL,
    vl.HasValidVL,
    vl.ValidVLSup,
    vl.LastVL,
    lastVL.Date as LastVLDate,
    vl.ValidVLResult,
    vl.ValidVLResultCategory1 as ValidVLResultCategory1,
    vl.ValidVLResultCategory2 as ValidVLResultCategory2,
    vl.HighViremia,
    vl.LowViremia,
    pat.ISTxCurr,
	dif.DifferentiatedCare,
    coalesce(ncd.HasHypertension, 0) as HasHypertension, 
    coalesce(ncd.ScreenedBPLastVisit, 0) as ScreenedBPLastVisit,
    coalesce(ncd.IsBPControlledAtLastVisit, 0) as IsBPControlledAtLastVisit,
    coalesce(ncd.HasDiabetes, 0) as HasDiabetes,
    coalesce(ncd.ScreenedDiabetes, 0) as ScreenedDiabetes,
    coalesce(ncd.IsDiabetesControlledAtLastTest, 0) as IsDiabetesControlledAtLastTest,
    CD4.LastCD4,
    CD4.LastCD4Percentage,
    WhoStage,
    Case When WhoStage in (3,4) OR Age<5 
    OR (Age >= 15 AND CONVERT(FLOAT, CD4.LastCD4) < 200)
    Then 1 Else 0 End as AHD,
    CASE WHEN startdate.Date > DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE()) - 1, 0) OR  WhoStage IN (3, 4) Or Try_cast (LastVL as float) >=200.00 Then 1 ELSE 0 END AS EligibleCD4,
    cast(getdate() as date) as LoadDate
INTO [REPORTING].[dbo].[Linelist_FACTART]
from  NDWH.dbo.FACTART As ART 
left join NDWH.dbo.DimPatient pat on pat.PatientKey = ART.PatientKey
left join NDWH.dbo.DimPartner partner on partner.PartnerKey = ART.PartnerKey
left join NDWH.dbo.DimAgency agency on agency.AgencyKey = ART.AgencyKey
left join NDWH.dbo.DimFacility fac on fac.FacilityKey = ART.FacilityKey
left join NDWH.dbo.DimAgeGroup age on age.AgeGroupKey = ART.AgeGroupKey
left join NDWH.dbo.DimDate startdate on startdate.DateKey = ART.StartARTDateKey
left join NDWH.dbo.DimARTOutcome as outcome on outcome.ARTOutcomeKey=ART.ARTOutcomeKey
left join NDWH.dbo.FactViralLoads as vl on vl.PatientKey = ART.PatientKey
left join NDWH.dbo.FactLatestObs as obs on obs.PatientKey = ART.PatientKey
left join NDWH.dbo.DimDifferentiatedCare as dif on dif.DifferentiatedCareKey = obs.DifferentiatedCareKey
left join NDWH.dbo.DimDate as lastVL on lastVL.DateKey =  vl.LastVLDateKey
left join ncd_indicators as ncd on ncd.PatientKey = ART.PatientKey
left join NDWH.dbo.FactCD4 as CD4 on CD4.PatientKey= ART.PatientKey
WHERE ART.ARTOutcomeKey IS NOT NULL;
END



