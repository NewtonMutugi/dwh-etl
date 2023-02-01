IF OBJECT_ID(N'[NDWH].[dbo].[FactHTSClientTracing]', N'U') IS NOT NULL 
	DROP TABLE [NDWH].[dbo].[FactHTSClientTracing];

BEGIN

    with MFL_partner_agency_combination as (
        select 
            distinct MFL_Code,
            SDP,
            SDP_Agency collate Latin1_General_CI_AS as Agency
        from ODS.dbo.All_EMRSites 
    ),
    source_data as (
        select
            SiteCode,
            PatientPk,
            TracingType,
            cast(TracingDate as date) as TracingDate,
            TracingOutcome
    from ODS.dbo.HTS_ClientTracing
    )
    select 
        Factkey = IDENTITY(INT, 1, 1),
        patient.PatientKey,
        facility.FacilityKey,
        partner.PartnerKey,
        agency.AgencyKey,
        tracing.DateKey as TracingDateKey,
        source_data.TracingType,
        source_data.TracingOutcome,
        cast(getdate() as date) as LoadDate
    into NDWH.dbo.FactHTSClientTracing
    from source_data
    left join NDWH.dbo.DimPatient as patient on patient.PatientPK = convert(nvarchar(64), hashbytes('SHA2_256', cast(source_data.PatientPK as nvarchar(36))), 2)
        and patient.SiteCode = source_data.SiteCode
    left join NDWH.dbo.DimFacility as facility on facility.MFLCode = source_data.SiteCode
    left join MFL_partner_agency_combination on MFL_partner_agency_combination.MFL_Code = source_data.SiteCode
    left join NDWH.dbo.DimPartner as partner on partner.PartnerName = MFL_partner_agency_combination.SDP
    left join NDWH.dbo.DimAgency as agency on agency.AgencyName = MFL_partner_agency_combination.Agency
    left join NDWH.dbo.DimDate as tracing on tracing.Date = source_data.TracingDate;

    alter table NDWH.dbo.FactHTSClientTracing add primary key(FactKey);

END