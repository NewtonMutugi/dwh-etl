IF EXISTS(SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'REPORTING.[dbo].[AggregatePrepCascade]') AND type in (N'U')) 
TRUNCATE TABLE REPORTING.[dbo].[AggregatePrepCascade]
GO

INSERT INTO REPORTING.dbo.AggregatePrepCascade
		(MFLCode,
		FacilityName, 
		County,
		SubCounty,
		PartnerName, 
		AgencyName, 
		Gender, 
		AgeGroup,
		EligiblePrep,
		Screened,
        VisitMonth,
		VisitYear,
		StartedPrep,
		tested
		)

SELECT DISTINCT 
		MFLCode,		
		f.FacilityName,
		County,
		SubCounty,
		p.PartnerName,
		a.AgencyName,
		Gender,
		age.DATIMAgeGroup as AgeGroup,
		Sum(EligiblePrep) As EligiblePrep,
		sum(ScreenedPrep) As Screened,
		visit.month VisitMonth, 
        Visit.year VisitYear,
        Count (distinct (concat(PrepNumber,PatientPKHash,MFLCode))) As StartedPrep,
		sum(case when Refil1DiffInDays is not null then 1 else 0 end) tested
		

FROM NDWH.dbo.FactPrep prep

LEFT join NDWH.dbo.DimFacility f on f.FacilityKey = prep.FacilityKey
LEFT JOIN NDWH.dbo.DimAgency a on a.AgencyKey = prep.AgencyKey
LEFT JOIN NDWH.dbo.DimPatient pat on pat.PatientKey = prep.PatientKey
LEFT join NDWH.dbo.DimAgeGroup age on age.AgeGroupKey=prep.AgeGroupKey
LEFT JOIN NDWH.dbo.DimPartner p on p.PartnerKey = prep.PartnerKey
LEFT JOIN NDWH.dbo.DimDate visit ON visit.DateKey = prep.VisitDateKey COLLATE Latin1_General_CI_AS
LEFT JOIN NDWH.dbo.DimDate enrol ON enrol.DateKey = PrepEnrollmentDateKey 
LEFT JOIN NDWH.dbo.DimDate test ON test.DateKey = DateTestMonth1Key 



GROUP BY  MFLCode,		
		f.FacilityName,
		County,
		SubCounty,
		p.PartnerName,
		a.AgencyName,
		Gender,
		age.DATIMAgeGroup,
		visit.Month,
		visit.Year
		