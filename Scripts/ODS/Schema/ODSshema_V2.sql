USE [ODS]
GO
/****** Object:  Table [dbo].[ALL_EMRSites]    Script Date: 10/13/2022 9:03:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALL_EMRSites](
	[MFL_Code] [varchar](50) NULL,
	[Facility Name] [varchar](250) NULL,
	[County] [varchar](50) NULL,
	[SubCounty] [varchar](50) NULL,
	[Owner] [varchar](50) NULL,
	[Latitude] [varchar](50) NULL,
	[Longitude] [varchar](50) NULL,
	[SDP] [varchar](250) NULL,
	[SDP Agency] [varchar](50) NULL,
	[Implementation] [varchar](50) NULL,
	[EMR] [varchar](50) NULL,
	[EMR Status] [varchar](50) NULL,
	[HTS Use] [varchar](50) NULL,
	[HTS Deployment] [varchar](50) NULL,
	[HTS Status] [varchar](50) NULL,
	[IL Status] [varchar](50) NULL,
	[Registration IE] [varchar](50) NULL,
	[Phamarmacy IE] [varchar](50) NULL,
	[mlab] [varchar](50) NULL,
	[Ushauri] [varchar](50) NULL,
	[Nishauri] [varchar](50) NULL,
	[Appointment Management IE] [varchar](50) NULL,
	[OVC] [varchar](50) NULL,
	[OTZ] [varchar](50) NULL,
	[PrEP] [varchar](50) NULL,
	[3PM] [varchar](50) NULL,
	[AIR] [varchar](50) NULL,
	[KP] [varchar](50) NULL,
	[MCH] [varchar](50) NULL,
	[TB] [varchar](50) NULL,
	[Lab Manifest] [varchar](50) NULL,
	[Comments] [varchar](250) NULL,
	[Project] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CT_AdverseEvent_Log]    Script Date: 10/13/2022 9:03:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_AdverseEvent_Log](
	[SiteCode] [nvarchar](10) NULL,
	[MaxAdverseEventStartDate] [date] NULL,
	[LoadStartDateTime] [datetime] NULL,
	[LoadEndDateTime] [datetime] NULL,
	[LoadCount] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CT_AdverseEvents]    Script Date: 10/13/2022 9:03:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_AdverseEvents](
	[PatientID] [varchar](100) NULL,
	[Patientpk] [varchar](50) NULL,
	[SiteCode] [varchar](50) NULL,
	[AdverseEvent] [varchar](100) NULL,
	[AdverseEventStartDate] [date] NULL,
	[AdverseEventEndDate] [date] NULL,
	[Severity] [varchar](100) NULL,
	[VisitDate] [date] NULL,
	[EMR] [varchar](50) NULL,
	[Project] [varchar](50) NULL,
	[AdverseEventCause] [varchar](50) NULL,
	[AdverseEventRegimen] [varchar](50) NULL,
	[AdverseEventActionTaken] [varchar](50) NULL,
	[AdverseEventClinicalOutcome] [varchar](50) NULL,
	[dateimported] [date] NULL,
	[AdverseEventIsPregnant] [bit] NULL,
	[CKV] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CT_AllergiesChronicIllness]    Script Date: 10/13/2022 9:03:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_AllergiesChronicIllness](
	[PatientID] [nvarchar](100) NULL,
	[PatientPK] [int] NOT NULL,
	[FacilityID] [int] NULL,
	[SiteCode] [int] NOT NULL,
	[FacilityName] [nvarchar](150) NULL,
	[SatelliteName] [int] NULL,
	[VisitID] [int] NULL,
	[VisitDate] [datetime] NULL,
	[Emr] [nvarchar](100) NULL,
	[Project] [nvarchar](100) NULL,
	[ChronicIllness] [nvarchar](150) NULL,
	[ChronicOnsetDate] [datetime2](7) NULL,
	[knownAllergies] [nvarchar](150) NULL,
	[AllergyCausativeAgent] [nvarchar](150) NULL,
	[AllergicReaction] [nvarchar](150) NULL,
	[AllergySeverity] [nvarchar](150) NULL,
	[AllergyOnsetDate] [datetime2](7) NULL,
	[Skin] [nvarchar](150) NULL,
	[Eyes] [nvarchar](150) NULL,
	[ENT] [nvarchar](150) NULL,
	[Chest] [nvarchar](150) NULL,
	[CVS] [nvarchar](150) NULL,
	[Abdomen] [nvarchar](150) NULL,
	[CNS] [nvarchar](150) NULL,
	[Genitourinary] [nvarchar](150) NULL,
	[DateImported] [datetime] NOT NULL,
	[CKV] [nvarchar](122) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CT_AllergiesChronicIllness_Log]    Script Date: 10/13/2022 9:03:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_AllergiesChronicIllness_Log](
	[SiteCode] [nvarchar](10) NULL,
	[MaxVisitDate] [date] NULL,
	[LoadStartDateTime] [datetime] NULL,
	[LoadEndDateTime] [datetime] NULL,
	[LoadCount] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CT_ARTPatient_Log]    Script Date: 10/13/2022 9:03:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_ARTPatient_Log](
	[SiteCode] [nvarchar](10) NULL,
	[MaxLastVisitDate] [date] NULL,
	[LoadStartDateTime] [datetime] NULL,
	[LoadEndDateTime] [datetime] NULL,
	[LoadCount] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CT_ARTPatients]    Script Date: 10/13/2022 9:03:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_ARTPatients](
	[PatientPK] [varchar](250) NULL,
	[PatientID] [varchar](250) NULL,
	[DOB] [date] NULL,
	[AgeEnrollment] [float] NULL,
	[AgeARTStart] [float] NULL,
	[AgeLastVisit] [float] NULL,
	[SiteCode] [varchar](250) NULL,
	[FacilityName] [varchar](250) NULL,
	[RegistrationDate] [date] NULL,
	[PatientSource] [varchar](255) NULL,
	[Gender] [varchar](250) NULL,
	[StartARTDate] [date] NULL,
	[PreviousARTStartDate] [date] NULL,
	[PreviousARTRegimen] [varchar](250) NULL,
	[StartARTAtThisFacility] [date] NULL,
	[StartRegimen] [varchar](250) NULL,
	[StartRegimenLine] [varchar](250) NULL,
	[LastARTDate] [date] NULL,
	[LastRegimen] [varchar](250) NULL,
	[LastRegimenLine] [varchar](250) NULL,
	[Duration] [varchar](250) NULL,
	[ExpectedReturn] [date] NULL,
	[Provider] [varchar](250) NULL,
	[LastVisit] [date] NULL,
	[ExitReason] [varchar](250) NULL,
	[ExitDate] [date] NULL,
	[Emr] [varchar](100) NULL,
	[Project] [varchar](100) NULL,
	[PreviousARTRegimen_Orig] [varchar](50) NULL,
	[StartRegimen_Orig] [varchar](50) NULL,
	[LastRegimen_Orig] [varchar](50) NULL,
	[DateImported] [date] NULL,
	[CKV] [varchar](150) NULL,
	[PreviousARTUse] [nvarchar](150) NULL,
	[PreviousARTPurpose] [nvarchar](150) NULL,
	[DateLastUsed] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CT_LopatientStatus_Log]    Script Date: 10/13/2022 9:03:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_LopatientStatus_Log](
	[SiteCode] [nvarchar](10) NULL,
	[MaxExitDate] [date] NULL,
	[LoadStartDateTime] [datetime] NULL,
	[LoadEndDateTime] [datetime] NULL,
	[LoadCount] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CT_Patient]    Script Date: 10/13/2022 9:03:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_Patient](
	[PatientID] [nvarchar](50) NULL,
	[PatientPK] [int] NULL,
	[SiteCode] [varchar](50) NULL,
	[FacilityName] [varchar](50) NULL,
	[Gender] [varchar](250) NULL,
	[DOB] [datetime2](7) NULL,
	[RegistrationDate] [date] NULL,
	[RegistrationAtCCC] [date] NULL,
	[RegistrationAtPMTCT] [date] NULL,
	[RegistrationAtTBClinic] [date] NULL,
	[PatientSource] [varchar](250) NULL,
	[Region] [varchar](250) NULL,
	[District] [varchar](250) NULL,
	[Village] [varchar](250) NULL,
	[ContactRelation] [varchar](250) NULL,
	[LastVisit] [date] NULL,
	[MaritalStatus] [varchar](250) NULL,
	[EducationLevel] [varchar](250) NULL,
	[DateConfirmedHIVPositive] [date] NULL,
	[PreviousARTExposure] [varchar](250) NULL,
	[PreviousARTStartDate] [date] NULL,
	[Emr] [varchar](100) NULL,
	[Project] [varchar](100) NULL,
	[DateImported] [date] NULL,
	[PKV] [varchar](250) NULL,
	[PatientUID] [uniqueidentifier] NULL,
	[RegistrationYear] [int] NULL,
	[MPIPKV] [varchar](250) NULL,
	[Orphan] [varchar](250) NULL,
	[Inschool] [varchar](250) NULL,
	[PatientType] [varchar](250) NULL,
	[PopulationType] [varchar](250) NULL,
	[KeyPopulationType] [varchar](250) NULL,
	[PatientResidentCounty] [varchar](250) NULL,
	[PatientResidentSubCounty] [varchar](250) NULL,
	[PatientResidentLocation] [varchar](250) NULL,
	[PatientResidentSubLocation] [varchar](250) NULL,
	[PatientResidentWard] [varchar](250) NULL,
	[PatientResidentVillage] [varchar](250) NULL,
	[TransferInDate] [date] NULL,
	[Occupation] [nvarchar](150) NULL,
	[NUPI] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CT_PatientLabs_Log]    Script Date: 10/13/2022 9:03:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_PatientLabs_Log](
	[SiteCode] [nvarchar](10) NULL,
	[MaxOrderedbyDate] [date] NULL,
	[LoadStartDateTime] [datetime] NULL,
	[LoadEndDateTime] [datetime] NULL,
	[LoadCount] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CT_PatientPharmacy]    Script Date: 10/13/2022 9:03:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_PatientPharmacy](
	[PatientID] [varchar](50) NULL,
	[SiteCode] [varchar](255) NULL,
	[FacilityName] [varchar](255) NULL,
	[PatientPK] [varchar](50) NULL,
	[VisitID] [varchar](50) NULL,
	[Drug] [varchar](250) NULL,
	[DispenseDate] [date] NULL,
	[Duration] [varchar](50) NULL,
	[ExpectedReturn] [date] NULL,
	[TreatmentType] [varchar](250) NULL,
	[PeriodTaken] [varchar](50) NULL,
	[ProphylaxisType] [varchar](50) NULL,
	[Emr] [varchar](100) NULL,
	[Project] [varchar](100) NULL,
	[DateImported] [date] NULL,
	[CKV] [varchar](150) NULL,
	[PatientUID] [uniqueidentifier] NULL,
	[DeletedFlag] [bit] NULL,
	[RegimenLine] [varchar](250) NULL,
	[RegimenChangedSwitched] [nvarchar](150) NULL,
	[RegimenChangeSwitchReason] [nvarchar](150) NULL,
	[StopRegimenReason] [nvarchar](150) NULL,
	[StopRegimenDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CT_PatientPharmacy_Old]    Script Date: 10/13/2022 9:03:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_PatientPharmacy_Old](
	[PatientID] [varchar](50) NULL,
	[SiteCode] [varchar](255) NULL,
	[FacilityName] [varchar](255) NULL,
	[PatientPK] [varchar](50) NULL,
	[VisitID] [varchar](50) NULL,
	[Drug] [varchar](250) NULL,
	[DispenseDate] [date] NULL,
	[Duration] [varchar](50) NULL,
	[ExpectedReturn] [date] NULL,
	[TreatmentType] [varchar](250) NULL,
	[PeriodTaken] [varchar](50) NULL,
	[ProphylaxisType] [varchar](50) NULL,
	[Emr] [varchar](100) NULL,
	[Project] [varchar](100) NULL,
	[DateImported] [date] NULL,
	[PKV] [varchar](250) NULL,
	[PatientUID] [uniqueidentifier] NULL,
	[DeletedFlag] [bit] NULL,
	[RegimenLine] [varchar](250) NULL,
	[RegimenChangedSwitched] [nvarchar](150) NULL,
	[RegimenChangeSwitchReason] [nvarchar](150) NULL,
	[StopRegimenReason] [nvarchar](150) NULL,
	[StopRegimenDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CT_PatientStatus]    Script Date: 10/13/2022 9:03:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_PatientStatus](
	[PatientID] [varchar](50) NULL,
	[SiteCode] [varchar](50) NOT NULL,
	[FacilityName] [varchar](250) NULL,
	[ExitDescription] [varchar](250) NULL,
	[ExitDate] [date] NULL,
	[ExitReason] [varchar](250) NULL,
	[PatientPK] [varchar](50) NOT NULL,
	[Emr] [varchar](100) NULL,
	[Project] [varchar](100) NULL,
	[DateImported] [date] NULL,
	[CKV] [varchar](250) NULL,
	[PatientUID] [uniqueidentifier] NULL,
	[TOVerified] [nvarchar](150) NULL,
	[TOVerifiedDate] [datetime] NULL,
	[ReEnrollmentDate] [datetime] NULL,
	[ReasonForDeath] [varchar](150) NULL,
	[SpecificDeathReason] [varchar](150) NULL,
	[DeathDate] [date] NULL,
	[EffectiveDiscontinuationDate] [datetime2](7) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CT_PatientStatus_Old]    Script Date: 10/13/2022 9:03:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_PatientStatus_Old](
	[PatientID] [varchar](50) NULL,
	[SiteCode] [varchar](50) NOT NULL,
	[FacilityName] [varchar](250) NULL,
	[ExitDescription] [varchar](250) NULL,
	[ExitDate] [date] NULL,
	[ExitReason] [varchar](250) NULL,
	[PatientPK] [varchar](50) NOT NULL,
	[Emr] [varchar](100) NULL,
	[Project] [varchar](100) NULL,
	[DateImported] [date] NULL,
	[PKV] [varchar](250) NULL,
	[PatientUID] [uniqueidentifier] NULL,
	[TOVerified] [nvarchar](150) NULL,
	[TOVerifiedDate] [datetime] NULL,
	[ReEnrollmentDate] [datetime] NULL,
	[ReasonForDeath] [varchar](150) NULL,
	[SpecificDeathReason] [varchar](150) NULL,
	[DeathDate] [date] NULL,
	[EffectiveDiscontinuationDate] [datetime2](7) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CT_PatientsWABWHOCD4]    Script Date: 10/13/2022 9:03:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_PatientsWABWHOCD4](
	[PatientID] [varchar](50) NULL,
	[FacilityID] [varchar](50) NULL,
	[SiteCode] [varchar](50) NULL,
	[bCD4] [float] NULL,
	[bCD4Date] [date] NULL,
	[bWHO] [varchar](50) NULL,
	[bWHODate] [date] NULL,
	[eCD4] [float] NULL,
	[eCD4Date] [date] NULL,
	[eWHO] [varchar](50) NULL,
	[eWHODate] [date] NULL,
	[lastWHO] [varchar](50) NULL,
	[lastWHODate] [date] NULL,
	[lastCD4] [float] NULL,
	[lastCD4Date] [date] NULL,
	[m12CD4] [float] NULL,
	[m12CD4Date] [date] NULL,
	[m6CD4] [float] NULL,
	[m6CD4Date] [date] NULL,
	[PatientPK] [varchar](50) NULL,
	[Emr] [varchar](50) NULL,
	[Project] [varchar](50) NULL,
	[CD4atEnrollment] [float] NULL,
	[CD4atEnrollment_Date] [date] NULL,
	[CD4BeforeARTStart] [float] NULL,
	[CD4BeforeARTStart_Date] [date] NULL,
	[LastCD4AfterARTStart] [float] NULL,
	[LastCD4AfterARTStart_Date] [date] NULL,
	[CD4atEnrollmentPercent] [float] NULL,
	[CD4atEnrollmentPercent_Date] [date] NULL,
	[CD4BeforeARTStartPercent] [float] NULL,
	[CD4BeforeARTStartPercent_Date] [date] NULL,
	[LastCD4AfterARTStartPercent] [float] NULL,
	[LastCD4AfterARTStartPercent_Date] [date] NULL,
	[6MonthCD4] [float] NULL,
	[6MonthCD4_Date] [date] NULL,
	[12MonthCD4] [float] NULL,
	[12MonthCD4_Date] [date] NULL,
	[6MonthCD4Percent] [float] NULL,
	[6MonthCD4Percent_Date] [date] NULL,
	[12MonthCD4Percent] [float] NULL,
	[12MonthCD4Percent_Date] [date] NULL,
	[FirstCD4AfterARTStart] [float] NULL,
	[FirstCD4AfterARTStart_Date] [date] NULL,
	[FirtsCD4AfterARTStartPercent] [float] NULL,
	[FirtsCD4AfterARTStartPercent_date] [date] NULL,
	[DateImported] [date] NULL,
	[6MonthVL] [varchar](50) NULL,
	[6MonthVlDate] [date] NULL,
	[12MonthVL] [varchar](50) NULL,
	[12MonthVLDate] [date] NULL,
	[LstickBaselineCD4] [float] NULL,
	[LstickBaselineCD4_Date] [date] NULL,
	[CKV] [varchar](250) NULL,
	[18MonthVL] [varchar](50) NULL,
	[18MonthVlDate] [date] NULL,
	[24MonthVL] [varchar](50) NULL,
	[24MonthVLDate] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CT_PatientsWABWHOCD4_Log]    Script Date: 10/13/2022 9:03:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_PatientsWABWHOCD4_Log](
	[SiteCode] [nvarchar](10) NULL,
	[MaxbCD4Date] [date] NULL,
	[LoadStartDateTime] [datetime] NULL,
	[LoadEndDateTime] [datetime] NULL,
	[LoadCount] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CT_PatientVisits]    Script Date: 10/13/2022 9:03:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_PatientVisits](
	[PatientID] [varchar](50) NULL,
	[FacilityName] [varchar](150) NULL,
	[SiteCode] [varchar](50) NULL,
	[PatientPK] [varchar](50) NULL,
	[VisitID] [varchar](50) NULL,
	[VisitDate] [date] NULL,
	[SERVICE] [varchar](150) NULL,
	[VisitType] [varchar](150) NULL,
	[WHOStage] [varchar](150) NULL,
	[WABStage] [varchar](150) NULL,
	[Pregnant] [varchar](150) NULL,
	[LMP] [varchar](150) NULL,
	[EDD] [varchar](150) NULL,
	[Height] [varchar](150) NULL,
	[Weight] [varchar](150) NULL,
	[BP] [varchar](150) NULL,
	[OI] [varchar](150) NULL,
	[OIDate] [date] NULL,
	[Adherence] [varchar](150) NULL,
	[AdherenceCategory] [varchar](150) NULL,
	[FamilyPlanningMethod] [varchar](150) NULL,
	[PwP] [varchar](150) NULL,
	[GestationAge] [varchar](150) NULL,
	[NextAppointmentDate] [date] NULL,
	[SubstitutionFirstlineReg] [varchar](100) NULL,
	[SubstitutionFirstLineRegReason] [varchar](150) NULL,
	[SubstitutionSecondLineReg] [varchar](100) NULL,
	[SubstitutionSecondLineRegReason] [varchar](150) NULL,
	[SecondLineRegChange] [varchar](100) NULL,
	[SecondLineRegChangeReason] [varchar](150) NULL,
	[Emr] [varchar](100) NULL,
	[Project] [varchar](100) NULL,
	[DateImported] [date] NULL,
	[CKV] [varchar](150) NULL,
	[DeletedFlag] [bit] NULL,
	[DifferentiatedCare] [nvarchar](150) NULL,
	[StabilityAssessment] [nvarchar](150) NULL,
	[KeyPopulationType] [nvarchar](150) NULL,
	[PopulationType] [nvarchar](150) NULL,
	[VisitBy] [nvarchar](150) NULL,
	[Temp] [decimal](18, 2) NULL,
	[PulseRate] [int] NULL,
	[RespiratoryRate] [int] NULL,
	[OxygenSaturation] [decimal](18, 2) NULL,
	[Muac] [int] NULL,
	[NutritionalStatus] [nvarchar](150) NULL,
	[EverHadMenses] [nvarchar](150) NULL,
	[Breastfeeding] [nvarchar](150) NULL,
	[Menopausal] [nvarchar](150) NULL,
	[NoFPReason] [nvarchar](150) NULL,
	[ProphylaxisUsed] [nvarchar](150) NULL,
	[CTXAdherence] [nvarchar](150) NULL,
	[CurrentRegimen] [nvarchar](150) NULL,
	[HCWConcern] [nvarchar](150) NULL,
	[TCAReason] [nvarchar](150) NULL,
	[ClinicalNotes] [nvarchar](150) NULL,
	[GeneralExamination] [nvarchar](150) NULL,
	[SystemExamination] [nvarchar](150) NULL,
	[Skin] [nvarchar](150) NULL,
	[Eyes] [nvarchar](150) NULL,
	[ENT] [nvarchar](150) NULL,
	[Chest] [nvarchar](150) NULL,
	[CVS] [nvarchar](150) NULL,
	[Abdomen] [nvarchar](150) NULL,
	[CNS] [nvarchar](150) NULL,
	[Genitourinary] [nvarchar](150) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CT_PatientVisits_Old]    Script Date: 10/13/2022 9:03:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_PatientVisits_Old](
	[PatientID] [nvarchar](50) NULL,
	[FacilityName] [nvarchar](250) NULL,
	[SiteCode] [nvarchar](50) NULL,
	[PatientPK] [nvarchar](50) NULL,
	[VisitID] [nvarchar](50) NULL,
	[VisitDate] [date] NULL,
	[SERVICE] [nvarchar](250) NULL,
	[VisitType] [nvarchar](250) NULL,
	[WHOStage] [nvarchar](150) NULL,
	[WABStage] [nvarchar](250) NULL,
	[Pregnant] [nvarchar](250) NULL,
	[LMP] [nvarchar](150) NULL,
	[EDD] [nvarchar](150) NULL,
	[Height] [nvarchar](150) NULL,
	[Weight] [nvarchar](150) NULL,
	[BP] [nvarchar](250) NULL,
	[OI] [nvarchar](250) NULL,
	[OIDate] [date] NULL,
	[Adherence] [nvarchar](250) NULL,
	[AdherenceCategory] [nvarchar](250) NULL,
	[FamilyPlanningMethod] [nvarchar](250) NULL,
	[PwP] [nvarchar](250) NULL,
	[GestationAge] [nvarchar](150) NULL,
	[NextAppointmentDate] [date] NULL,
	[SubstitutionFirstlineReg] [nvarchar](100) NULL,
	[SubstitutionFirstLineRegReason] [nvarchar](250) NULL,
	[SubstitutionSecondLineReg] [nvarchar](100) NULL,
	[SubstitutionSecondLineRegReason] [nvarchar](250) NULL,
	[SecondLineRegChange] [nvarchar](100) NULL,
	[SecondLineRegChangeReason] [nvarchar](250) NULL,
	[Emr] [nvarchar](100) NULL,
	[Project] [nvarchar](100) NULL,
	[DateImported] [date] NULL,
	[PKV] [nvarchar](250) NULL,
	[PatientUID] [uniqueidentifier] NULL,
	[DeletedFlag] [bit] NULL,
	[DifferentiatedCare] [nvarchar](250) NULL,
	[StabilityAssessment] [nvarchar](250) NULL,
	[KeyPopulationType] [nvarchar](250) NULL,
	[PopulationType] [nvarchar](250) NULL,
	[VisitBy] [nvarchar](150) NULL,
	[Temp] [decimal](18, 2) NULL,
	[PulseRate] [int] NULL,
	[RespiratoryRate] [int] NULL,
	[OxygenSaturation] [decimal](18, 2) NULL,
	[Muac] [int] NULL,
	[NutritionalStatus] [nvarchar](150) NULL,
	[EverHadMenses] [nvarchar](150) NULL,
	[Breastfeeding] [nvarchar](150) NULL,
	[Menopausal] [nvarchar](150) NULL,
	[NoFPReason] [nvarchar](150) NULL,
	[ProphylaxisUsed] [nvarchar](150) NULL,
	[CTXAdherence] [nvarchar](150) NULL,
	[CurrentRegimen] [nvarchar](150) NULL,
	[HCWConcern] [nvarchar](150) NULL,
	[TCAReason] [nvarchar](150) NULL,
	[ClinicalNotes] [nvarchar](150) NULL,
	[GeneralExamination] [nvarchar](150) NULL,
	[SystemExamination] [nvarchar](150) NULL,
	[Skin] [nvarchar](150) NULL,
	[Eyes] [nvarchar](150) NULL,
	[ENT] [nvarchar](150) NULL,
	[Chest] [nvarchar](150) NULL,
	[CVS] [nvarchar](150) NULL,
	[Abdomen] [nvarchar](150) NULL,
	[CNS] [nvarchar](150) NULL,
	[Genitourinary] [nvarchar](150) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CT_PharmacyVisit_Log]    Script Date: 10/13/2022 9:03:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_PharmacyVisit_Log](
	[SiteCode] [nvarchar](10) NULL,
	[MaxDispenseDate] [date] NULL,
	[LoadStartDateTime] [datetime] NULL,
	[LoadEndDateTime] [datetime] NULL,
	[LoadCount] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CT_Visit_Log]    Script Date: 10/13/2022 9:03:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_Visit_Log](
	[SiteCode] [nvarchar](10) NULL,
	[MaxVisitDate] [date] NULL,
	[LoadStartDateTime] [datetime] NULL,
	[LoadEndDateTime] [datetime] NULL,
	[LoadCount] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[Load_CT_AdverseEvents_Optimized]    Script Date: 10/13/2022 9:03:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Load_CT_AdverseEvents_Optimized] 
AS 
	BEGIN
	       DECLARE @MaxAdverseEventStartDate_Hist			DATETIME,
				   @AdverseEventStartDate					DATETIME
				
		SELECT @MaxAdverseEventStartDate_Hist =  MAX(MaxAdverseEventStartDate) FROM [ODS].[dbo].[CT_AdverseEvent_Log]  (NoLock)
		SELECT @AdverseEventStartDate = MAX(AdverseEventStartDate) FROM [DWAPICentral].[dbo].PatientAdverseEventExtract	WITH (NOLOCK) 
		
		IF (SELECT COUNT(1) FROM [ODS].[dbo].[CT_AdverseEvent_Log](NoLock) WHERE MaxAdverseEventStartDate = @AdverseEventStartDate) > 0
		RETURN

			ELSE
				BEGIN
					
					INSERT INTO  [ODS].[dbo].[CT_AdverseEvent_Log](MaxAdverseEventStartDate,LoadStartDateTime)
					VALUES(@AdverseEventStartDate,GETDATE())

					INSERT INTO [ODS].[dbo].[CT_AdverseEvents](PatientID,Patientpk,SiteCode,AdverseEvent,AdverseEventStartDate,AdverseEventEndDate,Severity,VisitDate,EMR,Project,AdverseEventCause,AdverseEventRegimen,AdverseEventActionTaken,AdverseEventClinicalOutcome,dateimported,AdverseEventIsPregnant,CKV)
					SELECT 
							P.[PatientCccNumber] AS PatientID, 
							P.[PatientPID] AS PatientPK,
							F.Name AS FacilityName, 
							F.Code AS SiteCode,
							[AdverseEvent], [AdverseEventStartDate], [AdverseEventEndDate], 
							CASE [Severity]
								WHEN '1' THEN 'Mild'
								WHEN '2' THEN 'Moderate'
								WHEN '3' THEN 'Severe' 
								ELSE [Severity] 
							END AS [Severity] , 
							[VisitDate], 
							PA.[EMR], PA.[Project], [AdverseEventCause], [AdverseEventRegimen],
							[AdverseEventActionTaken],[AdverseEventClinicalOutcome], [AdverseEventIsPregnant], 
							LTRIM(RTRIM(STR(F.Code)))+'-'+LTRIM(RTRIM(P.[PatientCccNumber])) +'-'+LTRIM(RTRIM(STR(P.[PatientPID]))) AS CKV

					FROM [DWAPICentral].[dbo].[PatientExtract](NoLock) P 
					INNER JOIN [DWAPICentral].[dbo].PatientAdverseEventExtract(NoLock) PA ON PA.[PatientId]= P.ID AND PA.Voided=0
					INNER JOIN [DWAPICentral].[dbo].[Facility](NoLock) F ON P.[FacilityId] = F.Id AND F.Voided=0
					WHERE AdverseEventStartDate > @MaxAdverseEventStartDate_Hist
					

					UPDATE [ODS].[dbo].[CT_AdverseEvent_Log]
					SET LoadEndDateTime = GETDATE()
					WHERE MaxAdverseEventStartDate = @AdverseEventStartDate;

			END
			---Remove any duplicate from [NDWH_DB].[dbo].[DimPatient]
			;WITH CTE AS   
				(  
					SELECT [PatientPK],[SiteCode],ROW_NUMBER() 
					OVER (PARTITION BY [PatientPK],[SiteCode]
					ORDER BY [PatientPK],[SiteCode]) AS dump_ 
					FROM [ODS].[dbo].[CT_AdverseEvents] 
					)  
			
			DELETE FROM CTE WHERE dump_ >1;

			
	END


GO
/****** Object:  StoredProcedure [dbo].[Load_CT_All_EMRSites]    Script Date: 10/13/2022 9:03:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Load_CT_All_EMRSites]    
AS 
	BEGIN
	       ---- Refresh [ODS].[dbo].[ALL_EMRSites]
			MERGE [ODS].[dbo].[ALL_EMRSites] AS a
				USING(SELECT  [MFL_Code] MFL_Code
							  ,[Facility Name] Facility_Name
							  ,[County] County
							  ,[SubCounty]   SubCounty
							  ,[Owner]   Owner
							  ,[Latitude]   Latitude
							  ,[Longitude]   Longitude
							  ,[SDP]   SDP
							  ,[SDP Agency]   SDP_Agency
							  ,[Implementation]   Implementation
							  ,[EMR]   EMR
							  ,[EMR Status]   EMR_Status
							  ,[HTS Use]   HTS_Use
							  ,[HTS Deployment]   HTS_Deployment
							  ,[HTS Status]   HTS_Status
							  ,[IL Status]   IL_Status
							  ,[Registration IE]   Registration_IE
							  ,[Phamarmacy IE]   Phamarmacy_IE
							  ,[mlab]   mlab
							  ,[Ushauri]   Ushauri
							  ,[Nishauri]   Nishauri
							  ,[Appointment Management IE]   Appointment_Management_IE
							  ,[OVC]   OVC
							  ,[OTZ]   OTZ
							  ,[PrEP]   PrEP
							  ,[3PM]   _3PM
							  ,[AIR]   AIR
							  ,[KP]   KP
							  ,[MCH]   MCH
							  ,[TB]   TB
							  ,[Lab Manifest]   Lab_Manifest
							  ,[Comments]   Comments
							  ,[Project]   Project

						  FROM [197.248.44.225].[HIS_Implementation].[DBO].[ALL_EMRSites] ) AS b 
						ON(a.[MFL_Code] COLLATE SQL_Latin1_General_CP1_CI_AS = b.[MFL_Code] COLLATE SQL_Latin1_General_CP1_CI_AS
								)
			--WHEN MATCHED THEN
			--UPDATE SET 
			--a.FacilityName = B.FacilityName
			WHEN NOT MATCHED THEN 
			INSERT(MFL_Code,[Facility Name],County,SubCounty,[Owner],Latitude,Longitude,SDP,[SDP Agency],Implementation,EMR,[EMR Status],[HTS Use],[HTS Deployment],[HTS Status],[IL Status],[Registration IE],[Phamarmacy IE],mlab,Ushauri,Nishauri,[Appointment Management IE],OVC,OTZ,PrEP,[3PM],AIR,KP,MCH,TB,[Lab Manifest],[Comments],[Project]) 
			VALUES(MFL_Code,Facility_Name,County,SubCounty,[Owner],Latitude,Longitude,SDP,SDP_Agency,Implementation,EMR
			,EMR_Status,HTS_Use,HTS_Deployment,HTS_Status,IL_Status,Registration_IE,Phamarmacy_IE,mlab,Ushauri,Nishauri,Appointment_Management_IE,OVC,OTZ,PrEP,_3PM,AIR,KP,MCH,TB,Lab_Manifest,[Comments],[Project]);
			
			---Remove any duplicate from [NDWH_DB].[dbo].[DimPatient]
			--WITH CTE AS   
			--	(  
			--		SELECT [PatientID],[PatientPK],[SiteCode],ROW_NUMBER() 
			--		OVER (PARTITION BY [PatientID],[PatientPK],[SiteCode] 
			--		ORDER BY [PatientID],[PatientPK],[SiteCode]) AS dump_ 
			--		FROM [ODS].[dbo].[ALL_EMRSites]
			--		)  
			
			--DELETE FROM CTE WHERE dump_ >1;

END


GO
/****** Object:  StoredProcedure [dbo].[Load_CT_AllergiesChronicIllness_Optimized]    Script Date: 10/13/2022 9:03:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Load_CT_AllergiesChronicIllness_Optimized]  
AS 
	BEGIN
	       DECLARE @MaxVisitDate_Hist			DATETIME,
				   @VisitDate					DATETIME
				
		SELECT @MaxVisitDate_Hist =  MAX(MaxVisitDate) FROM [ODS].[dbo].[CT_AllergiesChronicIllness_Log]  (NoLock)
		SELECT @VisitDate = MAX(VisitDate) FROM [DWAPICentral].[dbo].[AllergiesChronicIllnessExtract] WITH (NOLOCK) 
		
		IF (SELECT COUNT(1) FROM [ODS].[dbo].[CT_AllergiesChronicIllness_Log](NoLock) WHERE MaxVisitDate = @VisitDate) > 0
		RETURN

			ELSE
				BEGIN
					
					INSERT INTO  [ODS].[dbo].[CT_AllergiesChronicIllness_Log](MaxVisitDate,LoadStartDateTime)
					VALUES(@VisitDate,GETDATE())

					INSERT INTO [ODS].[dbo].[CT_AllergiesChronicIllness](PatientID,PatientPK,SiteCode,FacilityName,VisitID,VisitDate,Emr,Project,
					ChronicIllness,ChronicOnsetDate,knownAllergies,AllergyCausativeAgent,AllergicReaction,AllergySeverity,
					AllergyOnsetDate,Skin,Eyes,ENT,Chest,CVS,Abdomen,CNS,Genitourinary,DateImported,CKV)
					SELECT
						P.[PatientCccNumber] AS PatientID,P.[PatientPID] AS PatientPK,F.Code AS SiteCode,
						F.Name AS FacilityName,ACI.[VisitId] AS VisitID,ACI.[VisitDate] AS VisitDate, P.[Emr] AS Emr,
						CASE
							P.[Project]
							WHEN 'I-TECH' THEN 'Kenya HMIS II'
							WHEN 'HMIS' THEN 'Kenya HMIS II'
							ELSE P.[Project]
						END AS Project,
						ACI.[ChronicIllness] AS ChronicIllness,ACI.[ChronicOnsetDate] AS ChronicOnsetDate,ACI.[knownAllergies] AS knownAllergies,
						ACI.[AllergyCausativeAgent] AS AllergyCausativeAgent,ACI.[AllergicReaction] AS AllergicReaction,ACI.[AllergySeverity] AS AllergySeverity,
						ACI.[AllergyOnsetDate] AS AllergyOnsetDate,ACI.[Skin] AS Skin,ACI.[Eyes] AS Eyes,ACI.[ENT] AS ENT,ACI.[Chest] AS Chest,ACI.[CVS] AS CVS,
						ACI.[Abdomen] AS Abdomen,ACI.[CNS] AS CNS,ACI.[Genitourinary] AS Genitourinary,GETDATE() AS DateImported,
						LTRIM(RTRIM(STR(F.Code))) + '-' + LTRIM(RTRIM(P.[PatientCccNumber])) + '-' + LTRIM(RTRIM(STR(P.[PatientPID]))) AS PKV
					FROM [DWAPICentral].[dbo].[PatientExtract](NoLock) P
					INNER JOIN [DWAPICentral].[dbo].[AllergiesChronicIllnessExtract](NoLock) ACI ON ACI.[PatientId] = P.ID AND ACI.Voided = 0
					INNER JOIN [DWAPICentral].[dbo].[Facility](NoLock) F ON P.[FacilityId] = F.Id AND F.Voided = 0
					WHERE P.gender != 'Unknown' and VisitDate > @MaxVisitDate_Hist					

					UPDATE [ODS].[dbo].[CT_AllergiesChronicIllness_Log]
					SET LoadEndDateTime = GETDATE()
					WHERE MaxVisitDate = @VisitDate;

			END
			---Remove any duplicate from [NDWH_DB].[dbo].[DimPatient]
			;WITH CTE AS   
				(  
					SELECT [PatientPK],[SiteCode],VisitDate,ROW_NUMBER() 
					OVER (PARTITION BY [PatientPK],[SiteCode],VisitDate
					ORDER BY [PatientPK],[SiteCode],VisitDate) AS dump_ 
					FROM [ODS].[dbo].[CT_AllergiesChronicIllness]
					)  
			
			DELETE FROM CTE WHERE dump_ >1;

			
	END


GO
/****** Object:  StoredProcedure [dbo].[Load_CT_ARTPatients_Old]    Script Date: 10/13/2022 9:03:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Load_CT_ARTPatients_Old]  
AS 
	BEGIN
	       ---- Refresh [ODS].[dbo].[CT_ARTPatients]
			MERGE [ODS].[dbo].[CT_ARTPatients] AS a
				USING(SELECT  P.[PatientCccNumber] AS PatientID, P.[PatientPID] AS PatientPK,F.Name AS FacilityName, F.Code AS SiteCode,PA.[AgeEnrollment] AgeEnrollment
					  ,PA.[AgeARTStart] AgeARTStart,PA.[AgeLastVisit] AgeLastVisit,PA.[RegistrationDate] RegistrationDate,PA.[PatientSource] PatientSource
					  ,PA.[StartARTDate] StartARTDate,PA.[PreviousARTStartDate] PreviousARTStartDate,PA.[PreviousARTRegimen] PreviousARTRegimen,PA.[StartARTAtThisFacility] StartARTAtThisFacility
					  ,PA.[StartRegimen] StartRegimen,PA.[StartRegimenLine] StartRegimenLine,PA.[LastARTDate] LastARTDate,PA.[LastRegimen] LastRegimen
					  ,PA.[LastRegimenLine] LastRegimenLine,PA.[Duration] Duration,PA.[ExpectedReturn] ExpectedReturn,PA.[LastVisit] LastVisit
					  ,PA.[ExitReason] ExitReason,PA.[ExitDate] ExitDate,P.[Emr] Emr
					  ,CASE P.[Project] 
								WHEN 'I-TECH' THEN 'Kenya HMIS II' 
								WHEN 'HMIS' THEN 'Kenya HMIS II'
							ELSE P.[Project] 
					   END AS [Project] 
					  --,PA.[PatientId]
					  ,PA.[Voided] Voided
					  ,PA.[Processed] Processed
					  ,PA.[DOB] DOB
					  ,PA.[Gender] Gender
					  ,PA.[Provider] [Provider]
					  ,PA.[Created] Created
					  ,LTRIM(RTRIM(STR(F.Code)))+'-'+LTRIM(RTRIM(P.[PatientCccNumber])) +'-'+LTRIM(RTRIM(STR(P.[PatientPID]))) AS PKV
					  , NULL AS [PatientUID]
					  ,PA.[PreviousARTUse] PreviousARTUse
					  ,PA.[PreviousARTPurpose] PreviousARTPurpose
					  ,PA.[DateLastUsed] DateLastUsed

					FROM [DWAPICentral].[dbo].[PatientExtract] P with(NoLock) 
					INNER JOIN [DWAPICentral].[dbo].[PatientArtExtract] PA with(NoLock) ON PA.[PatientId]= P.ID AND PA.Voided=0
					INNER JOIN [DWAPICentral].[dbo].[Facility] F with(NoLock)  ON P.[FacilityId] = F.Id AND F.Voided=0 
					--INNER JOIN FacilityManifest_MaxDateRecieved(NoLock) a ON F.Code = a.SiteCode
					---LEFT JOIN All_Staging_2016_2.dbo.stg_Patients TPat ON TPat.PKV=LTRIM(RTRIM(STR(F.Code)))+'-'+LTRIM(RTRIM(P.[PatientCccNumber]))+'-'+LTRIM(RTRIM(STR(P.[PatientPID])))
					--GROUP BY  F.Name , YEAR([StartARTDate])
					WHERE p.gender!='Unknown' ) AS b 
						ON(a.PatientID COLLATE SQL_Latin1_General_CP1_CI_AS = b.PatientID COLLATE SQL_Latin1_General_CP1_CI_AS
						and a.PatientPK  = b.PatientPK 
						and a.SiteCode = b.SiteCode)  ----add more checks to uniquely Identify a ARTPatient
						----lastArtDate,Duration,ExpectedReturn,LastRegimen,LastRegimenLine all the possible columns
			--WHEN MATCHED THEN
			--UPDATE SET 
			--a.FacilityName = B.FacilityName
			WHEN NOT MATCHED THEN 
			INSERT(PatientPK,PatientID,DOB,AgeEnrollment,AgeARTStart,AgeLastVisit,SiteCode,FacilityName,RegistrationDate,PatientSource,Gender,StartARTDate,PreviousARTStartDate,PreviousARTRegimen,StartARTAtThisFacility,StartRegimen,StartRegimenLine,LastARTDate,LastRegimen,LastRegimenLine,Duration,ExpectedReturn,Provider,LastVisit,ExitReason,ExitDate,Emr,Project,PKV,PatientUID,PreviousARTUse,PreviousARTPurpose,DateLastUsed) 
			VALUES(PatientPK,PatientID,DOB,AgeEnrollment,AgeARTStart,AgeLastVisit,SiteCode,FacilityName,RegistrationDate,PatientSource,Gender,StartARTDate,PreviousARTStartDate,PreviousARTRegimen,StartARTAtThisFacility,StartRegimen,StartRegimenLine,LastARTDate,LastRegimen,LastRegimenLine,Duration,ExpectedReturn,Provider,LastVisit,ExitReason,ExitDate,Emr,Project,PKV,PatientUID,PreviousARTUse,PreviousARTPurpose,DateLastUsed);
			
			---Remove any duplicate from [NDWH_DB].[dbo].[DimPatient]
			WITH CTE AS   
				(  
					SELECT [PatientPK],[SiteCode],ROW_NUMBER()  ----PARTITION by the columns
					OVER (PARTITION BY [PatientPK],[SiteCode] 
					ORDER BY [PatientPK],[SiteCode]) AS dump_ 
					FROM [ODS].[dbo].[CT_ARTPatients] 
					)  
			
			DELETE FROM CTE WHERE dump_ >1;

			------- Rrefresh DimFacility

			--MERGE [NDWH_DB].[dbo].[DimFacility] AS a
			--	USING(SELECT  P.[PatientCccNumber] as PatientID,P.[PatientPID] as PatientPK,F.Code as SiteCode,F.[Name] as FacilityName,Gender,DOB,RegistrationDate,RegistrationAtCCC,RegistrationAtPMTCT,RegistrationAtTBClinic,PatientSource,Region,District,Village,ContactRelation,LastVisit,MaritalStatus,EducationLevel,DateConfirmedHIVPositive,PreviousARTExposure,PreviousARTStartDate,P.Emr,P.Project,PKV,Orphan,Inschool,PatientType,PopulationType,KeyPopulationType,PatientResidentCounty,PatientResidentSubCounty,PatientResidentLocation,PatientResidentSubLocation,PatientResidentWard,PatientResidentVillage,TransferInDate,Occupation,NUPI
			--			FROM [DWAPICentral].[dbo].[PatientExtract]  P  with (NoLock)
			--			INNER JOIN [DWAPICentral].[dbo].[Facility] F with (NoLock)  ON P.[FacilityId] = F.Id AND F.Voided=0 
			--			---INNER JOIN FacilityManifest_MaxDateRecieved(NoLock) a ON F.Code = a.SiteCode
			--			WHERE P.Voided=0 and P.[Gender] is NOT NULL and p.gender!='Unknown' ) AS b 
			--			ON(a.PatientID=b.PatientID and a.PatientPK = b.PatientPK and a.SiteCode = b.SiteCode)
			--WHEN MATCHED THEN
			--UPDATE SET 
			--a.FacilityName = B.FacilityName
			--WHEN NOT MATCHED THEN 
			--INSERT(PatientID,PatientPK,SiteCode,FacilityName,Gender,DOB,RegistrationDate,RegistrationAtCCC,RegistrationAtPMTCT,RegistrationAtTBClinic,PatientSource,Region,District,Village,ContactRelation,LastVisit,MaritalStatus,EducationLevel,DateConfirmedHIVPositive,PreviousARTExposure,PreviousARTStartDate,Emr,Project,Orphan,Inschool,PatientType,PopulationType,KeyPopulationType,PatientResidentCounty,PatientResidentSubCounty,PatientResidentLocation,PatientResidentSubLocation,PatientResidentWard,PatientResidentVillage,TransferInDate,Occupation,NUPI) 
			--VALUES(PatientID,PatientPK,SiteCode,FacilityName,Gender,DOB,RegistrationDate,RegistrationAtCCC,RegistrationAtPMTCT,RegistrationAtTBClinic,PatientSource,Region,District,Village,ContactRelation,LastVisit,MaritalStatus,EducationLevel,DateConfirmedHIVPositive,PreviousARTExposure,PreviousARTStartDate,Emr,Project,Orphan,Inschool,PatientType,PopulationType,KeyPopulationType,PatientResidentCounty,PatientResidentSubCounty,PatientResidentLocation,PatientResidentSubLocation,PatientResidentWard,PatientResidentVillage,TransferInDate,Occupation,NUPI);
			
	END


GO
/****** Object:  StoredProcedure [dbo].[Load_CT_ARTPatients_Optimized]    Script Date: 10/13/2022 9:03:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[Load_CT_ARTPatients_Optimized]  
AS 
	BEGIN
			DECLARE @MaxLastVisitDate_Hist			DATETIME,
				    @LastVisitDate					DATETIME
				
		SELECT @MaxLastVisitDate_Hist =  MAX(MaxLastVisitDate) FROM [ODS].[dbo].[CT_ARTPatient_Log]  (NoLock)
		SELECT @LastVisitDate = MAX(LastVisit) FROM [DWAPICentral].[dbo].[PatientArtExtract] WITH (NOLOCK) 
		
		IF (SELECT COUNT(1) FROM [ODS].[dbo].[CT_ARTPatient_Log](NoLock) WHERE MaxLastVisitDate = @LastVisitDate) > 0
		RETURN

			ELSE
				BEGIN
					
					INSERT INTO  [ODS].[dbo].[CT_ARTPatient_Log](MaxLastVisitDate,LoadStartDateTime)
					VALUES(@LastVisitDate,GETDATE());

					INSERT INTO [ODS].[dbo].[CT_ARTPatients](PatientPK,PatientID,FacilityName,SiteCode,
					DOB,AgeEnrollment,AgeARTStart,AgeLastVisit,RegistrationDate,PatientSource,Gender,StartARTDate,PreviousARTStartDate,PreviousARTRegimen,StartARTAtThisFacility,
					StartRegimen,StartRegimenLine,LastARTDate,LastRegimen,LastRegimenLine,Duration,ExpectedReturn,[Provider],LastVisit,ExitReason,ExitDate,Emr,Project,
					CKV,PreviousARTUse,PreviousARTPurpose,DateLastUsed)
					SELECT  P.[PatientPID] AS PatientPK,P.[PatientCccNumber] AS PatientID, F.Name AS FacilityName, F.Code AS SiteCode
						,PA.[DOB],PA.[AgeEnrollment],PA.[AgeARTStart],PA.[AgeLastVisit],PA.[RegistrationDate],PA.[PatientSource],PA.[Gender]
						,PA.[StartARTDate],PA.[PreviousARTStartDate],PA.[PreviousARTRegimen],PA.[StartARTAtThisFacility]
						  ,PA.[StartRegimen],PA.[StartRegimenLine],PA.[LastARTDate],PA.[LastRegimen],PA.[LastRegimenLine],PA.[Duration],PA.[ExpectedReturn]
						 ,PA.[Provider],PA.[LastVisit],PA.[ExitReason],PA.[ExitDate],P.[Emr]
						  ,CASE P.[Project] 
								WHEN 'I-TECH' THEN 'Kenya HMIS II' 
								WHEN 'HMIS' THEN 'Kenya HMIS II'
						   ELSE P.[Project] 
						   END AS [Project] 
						   ,LTRIM(RTRIM(STR(F.Code)))+'-'+LTRIM(RTRIM(P.[PatientCccNumber])) +'-'+LTRIM(RTRIM(STR(P.[PatientPID]))) AS CKV
						 
					,PA.[PreviousARTUse]
					,PA.[PreviousARTPurpose]
					,PA.[DateLastUsed]

					FROM [DWAPICentral].[dbo].[PatientExtract](NoLock) P 
					INNER JOIN [DWAPICentral].[dbo].[PatientArtExtract](NoLock) PA ON PA.[PatientId]= P.ID AND PA.Voided=0
					INNER JOIN [DWAPICentral].[dbo].[Facility](NoLock) F ON P.[FacilityId] = F.Id AND F.Voided=0 
					WHERE p.gender!='Unknown' AND pa.LastVisit > @MaxLastVisitDate_Hist;

					UPDATE [ODS].[dbo].[CT_ARTPatient_Log]
				SET LoadEndDateTime = GETDATE()
				WHERE MaxLastVisitDate = @LastVisitDate;
			END
			---Remove any duplicate from [NDWH_DB].[dbo].[DimPatient]
			;WITH CTE AS   
				(  
					SELECT [PatientPK],[SiteCode],ROW_NUMBER()  ----PARTITION by the columns
					OVER (PARTITION BY [PatientPK],[SiteCode] 
					ORDER BY [PatientPK],[SiteCode]) AS dump_ 
					FROM [ODS].[dbo].[CT_ARTPatients] 
					)  
			
			DELETE FROM CTE WHERE dump_ >1;

			------- Rrefresh DimFacility

			--MERGE [NDWH_DB].[dbo].[DimFacility] AS a
			--	USING(SELECT  P.[PatientCccNumber] as PatientID,P.[PatientPID] as PatientPK,F.Code as SiteCode,F.[Name] as FacilityName,Gender,DOB,RegistrationDate,RegistrationAtCCC,RegistrationAtPMTCT,RegistrationAtTBClinic,PatientSource,Region,District,Village,ContactRelation,LastVisit,MaritalStatus,EducationLevel,DateConfirmedHIVPositive,PreviousARTExposure,PreviousARTStartDate,P.Emr,P.Project,PKV,Orphan,Inschool,PatientType,PopulationType,KeyPopulationType,PatientResidentCounty,PatientResidentSubCounty,PatientResidentLocation,PatientResidentSubLocation,PatientResidentWard,PatientResidentVillage,TransferInDate,Occupation,NUPI
			--			FROM [DWAPICentral].[dbo].[PatientExtract]  P  with (NoLock)
			--			INNER JOIN [DWAPICentral].[dbo].[Facility] F with (NoLock)  ON P.[FacilityId] = F.Id AND F.Voided=0 
			--			---INNER JOIN FacilityManifest_MaxDateRecieved(NoLock) a ON F.Code = a.SiteCode
			--			WHERE P.Voided=0 and P.[Gender] is NOT NULL and p.gender!='Unknown' ) AS b 
			--			ON(a.PatientID=b.PatientID and a.PatientPK = b.PatientPK and a.SiteCode = b.SiteCode)
			--WHEN MATCHED THEN
			--UPDATE SET 
			--a.FacilityName = B.FacilityName
			--WHEN NOT MATCHED THEN 
			--INSERT(PatientID,PatientPK,SiteCode,FacilityName,Gender,DOB,RegistrationDate,RegistrationAtCCC,RegistrationAtPMTCT,RegistrationAtTBClinic,PatientSource,Region,District,Village,ContactRelation,LastVisit,MaritalStatus,EducationLevel,DateConfirmedHIVPositive,PreviousARTExposure,PreviousARTStartDate,Emr,Project,Orphan,Inschool,PatientType,PopulationType,KeyPopulationType,PatientResidentCounty,PatientResidentSubCounty,PatientResidentLocation,PatientResidentSubLocation,PatientResidentWard,PatientResidentVillage,TransferInDate,Occupation,NUPI) 
			--VALUES(PatientID,PatientPK,SiteCode,FacilityName,Gender,DOB,RegistrationDate,RegistrationAtCCC,RegistrationAtPMTCT,RegistrationAtTBClinic,PatientSource,Region,District,Village,ContactRelation,LastVisit,MaritalStatus,EducationLevel,DateConfirmedHIVPositive,PreviousARTExposure,PreviousARTStartDate,Emr,Project,Orphan,Inschool,PatientType,PopulationType,KeyPopulationType,PatientResidentCounty,PatientResidentSubCounty,PatientResidentLocation,PatientResidentSubLocation,PatientResidentWard,PatientResidentVillage,TransferInDate,Occupation,NUPI);
			
	END


GO
/****** Object:  StoredProcedure [dbo].[Load_CT_Patient]    Script Date: 10/13/2022 9:03:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Load_CT_Patient]    
AS 
	BEGIN
	
	       ---- Refresh DimPatient
			MERGE [ODS].[dbo].[CT_Patient] AS a
				USING(SELECT  P.[PatientCccNumber] as PatientID,P.[PatientPID] as PatientPK,F.Code as SiteCode,F.[Name] as FacilityName,Gender,DOB,RegistrationDate,RegistrationAtCCC,RegistrationAtPMTCT,RegistrationAtTBClinic,PatientSource,Region,District,Village,ContactRelation,LastVisit,MaritalStatus,EducationLevel,DateConfirmedHIVPositive,PreviousARTExposure,PreviousARTStartDate,P.Emr,P.Project,PKV,Orphan,Inschool,PatientType,PopulationType,KeyPopulationType,PatientResidentCounty,PatientResidentSubCounty,PatientResidentLocation,PatientResidentSubLocation,PatientResidentWard,PatientResidentVillage,TransferInDate,Occupation,NUPI
						FROM [DWAPICentral].[dbo].[PatientExtract]  P  with (NoLock)
						INNER JOIN [DWAPICentral].[dbo].[Facility] F with (NoLock)  
						ON P.[FacilityId]  = F.Id  AND F.Voided=0 
						---INNER JOIN FacilityManifest_MaxDateRecieved(NoLock) a ON F.Code = a.SiteCode
						WHERE P.Voided=0 and P.[Gender] is NOT NULL and p.gender!='Unknown' ) AS b 
						ON(
						--a.PatientID COLLATE SQL_Latin1_General_CP1_CI_AS = b.PatientID COLLATE SQL_Latin1_General_CP1_CI_AS and
						 a.PatientPK  = b.PatientPK 
						and a.SiteCode = b.SiteCode)
			WHEN MATCHED THEN
			UPDATE SET 
			a.FacilityName = B.FacilityName  ---Update all the columns that can change
			WHEN NOT MATCHED THEN 
			INSERT(PatientID,PatientPK,SiteCode,FacilityName,Gender,DOB,RegistrationDate,RegistrationAtCCC,RegistrationAtPMTCT,RegistrationAtTBClinic,PatientSource,Region,District,Village,ContactRelation,LastVisit,MaritalStatus,EducationLevel,DateConfirmedHIVPositive,PreviousARTExposure,PreviousARTStartDate,Emr,Project,Orphan,Inschool,PatientType,PopulationType,KeyPopulationType,PatientResidentCounty,PatientResidentSubCounty,PatientResidentLocation,PatientResidentSubLocation,PatientResidentWard,PatientResidentVillage,TransferInDate,Occupation,NUPI) 
			VALUES(PatientID,PatientPK,SiteCode,FacilityName,Gender,DOB,RegistrationDate,RegistrationAtCCC,RegistrationAtPMTCT,RegistrationAtTBClinic,PatientSource,Region,District,Village,ContactRelation,LastVisit,MaritalStatus,EducationLevel,DateConfirmedHIVPositive,PreviousARTExposure,PreviousARTStartDate,Emr,Project,Orphan,Inschool,PatientType,PopulationType,KeyPopulationType,PatientResidentCounty,PatientResidentSubCounty,PatientResidentLocation,PatientResidentSubLocation,PatientResidentWard,PatientResidentVillage,TransferInDate,Occupation,NUPI);
			
			---Remove any duplicate from [NDWH_DB].[dbo].[DimPatient]
			WITH CTE AS   
				(  
					SELECT [PatientPK],[SiteCode],ROW_NUMBER() 
					OVER (PARTITION BY [PatientPK],[SiteCode] 
					ORDER BY [PatientPK],[SiteCode]) AS dump_ 
					FROM [ODS].[dbo].[CT_Patient] 
					)  
			
			DELETE FROM CTE WHERE dump_ >1;

			------- Rrefresh DimFacility

			--MERGE [NDWH_DB].[dbo].[DimFacility] AS a
			--	USING(SELECT  P.[PatientCccNumber] as PatientID,P.[PatientPID] as PatientPK,F.Code as SiteCode,F.[Name] as FacilityName,Gender,DOB,RegistrationDate,RegistrationAtCCC,RegistrationAtPMTCT,RegistrationAtTBClinic,PatientSource,Region,District,Village,ContactRelation,LastVisit,MaritalStatus,EducationLevel,DateConfirmedHIVPositive,PreviousARTExposure,PreviousARTStartDate,P.Emr,P.Project,PKV,Orphan,Inschool,PatientType,PopulationType,KeyPopulationType,PatientResidentCounty,PatientResidentSubCounty,PatientResidentLocation,PatientResidentSubLocation,PatientResidentWard,PatientResidentVillage,TransferInDate,Occupation,NUPI
			--			FROM [197.248.44.225].[DWAPICentral].[dbo].[PatientExtract]  P  with (NoLock)
			--			INNER JOIN [197.248.44.225].[DWAPICentral].[dbo].[Facility] F with (NoLock)  ON P.[FacilityId] = F.Id AND F.Voided=0 
			--			---INNER JOIN FacilityManifest_MaxDateRecieved(NoLock) a ON F.Code = a.SiteCode
			--			WHERE P.Voided=0 and P.[Gender] is NOT NULL and p.gender!='Unknown' ) AS b 
			--			ON(a.PatientID=b.PatientID and a.PatientPK = b.PatientPK and a.SiteCode = b.SiteCode)
			--WHEN MATCHED THEN
			--UPDATE SET 
			--a.FacilityName = B.FacilityName
			--WHEN NOT MATCHED THEN 
			--INSERT(PatientID,PatientPK,SiteCode,FacilityName,Gender,DOB,RegistrationDate,RegistrationAtCCC,RegistrationAtPMTCT,RegistrationAtTBClinic,PatientSource,Region,District,Village,ContactRelation,LastVisit,MaritalStatus,EducationLevel,DateConfirmedHIVPositive,PreviousARTExposure,PreviousARTStartDate,Emr,Project,Orphan,Inschool,PatientType,PopulationType,KeyPopulationType,PatientResidentCounty,PatientResidentSubCounty,PatientResidentLocation,PatientResidentSubLocation,PatientResidentWard,PatientResidentVillage,TransferInDate,Occupation,NUPI) 
			--VALUES(PatientID,PatientPK,SiteCode,FacilityName,Gender,DOB,RegistrationDate,RegistrationAtCCC,RegistrationAtPMTCT,RegistrationAtTBClinic,PatientSource,Region,District,Village,ContactRelation,LastVisit,MaritalStatus,EducationLevel,DateConfirmedHIVPositive,PreviousARTExposure,PreviousARTStartDate,Emr,Project,Orphan,Inschool,PatientType,PopulationType,KeyPopulationType,PatientResidentCounty,PatientResidentSubCounty,PatientResidentLocation,PatientResidentSubLocation,PatientResidentWard,PatientResidentVillage,TransferInDate,Occupation,NUPI);
			
	END


GO
/****** Object:  StoredProcedure [dbo].[Load_CT_PatientLabs_Optimized]    Script Date: 10/13/2022 9:03:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Load_CT_PatientLabs_Optimized]  
AS 
	BEGIN
	       DECLARE @MaxOrderedbyDate_Hist			DATETIME,
				   @OrderedbyDate					DATETIME
				
		SELECT @MaxOrderedbyDate_Hist =  MAX(MaxOrderedbyDate) FROM [dbo].[CT_PatientLabs_Log]  (NoLock)
		SELECT  @OrderedbyDate = MAX(OrderedbyDate) FROM [DWAPICentral].[dbo].[PatientLaboratoryExtract] WITH (NOLOCK) 
		
		IF (SELECT COUNT(1) FROM [dbo].[CT_PatientLabs_Log](NoLock) WHERE MaxOrderedbyDate =  @OrderedbyDate) > 0
		RETURN

			ELSE
				BEGIN
					
					INSERT INTO  [dbo].[CT_PatientLabs_Log](MaxOrderedbyDate,LoadStartDateTime)
					VALUES( @OrderedbyDate,GETDATE())

					INSERT INTO [ODS].[dbo].[CT_PatientLabs](PatientID,PatientPk,FacilityName,
															SiteCode,VisitID,OrderedbyDate,ReportedbyDate,TestName,TestResult,
															Emr,Project,CKV,DateSampleTaken,SampleType
															)
					SELECT 
						  P.[PatientCccNumber] AS PatientID,P.[PatientPID] AS PatientPK,F.Name AS FacilityName, 
						  F.Code AS SiteCode,PL.[VisitId],PL.[OrderedByDate],PL.[ReportedByDate],PL.[TestName]
						  ,PL.[TestResult],P.[Emr]
						  ,CASE P.[Project] 
								WHEN 'I-TECH' THEN 'Kenya HMIS II' 
								WHEN 'HMIS' THEN 'Kenya HMIS II'
						   ELSE P.[Project] 
						   END AS [Project] 
						   ,LTRIM(RTRIM(STR(F.Code)))+'-'+LTRIM(RTRIM(P.[PatientCccNumber]))+'-'+LTRIM(RTRIM(STR(P.[PatientPID]))) AS CKV
						 -- ,PL.[Processed],PL.[EnrollmentTest],PL.[Created],
						  --,PL.Reason
						  
					-------------------- Added by Dennis as missing columns
						,PL.DateSampleTaken,
						PL.SampleType

					FROM [DWAPICentral].[dbo].[PatientExtract](NoLock) P 
					INNER JOIN [DWAPICentral].[dbo].[PatientLaboratoryExtract](NoLock) PL ON PL.[PatientId]= P.ID AND PL.Voided=0
					INNER JOIN [DWAPICentral].[dbo].[Facility](NoLock) F ON P.[FacilityId] = F.Id AND F.Voided=0
					WHERE p.gender!='Unknown'  AND OrderedByDate > @MaxOrderedbyDate_Hist;

					UPDATE [dbo].[CT_PatientLabs_Log]
					SET LoadEndDateTime = GETDATE()
					WHERE MaxOrderedbyDate =  @OrderedbyDate;

			END
			---Remove any duplicate from [NDWH_DB].[dbo].[DimPatient]
			;WITH CTE AS   
				(  
					SELECT [PatientPK],[SiteCode],OrderedbyDate,ROW_NUMBER() 
					OVER (PARTITION BY [PatientPK],[SiteCode],OrderedbyDate
					ORDER BY [PatientPK],[SiteCode],OrderedbyDate) AS dump_ 
					FROM [ODS].[dbo].[CT_PatientLabs]
					)  
			
			DELETE FROM CTE WHERE dump_ >1;

			
	END


GO
/****** Object:  StoredProcedure [dbo].[Load_CT_PatientPharmacy]    Script Date: 10/13/2022 9:03:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Load_CT_PatientPharmacy]    
AS 
	BEGIN
	       ---- Refresh [ODS].[dbo].[CT_PatientPharmacy]
			MERGE [ODS].[dbo].[CT_PatientPharmacy] AS a
				USING(SELECT 
					  P.[PatientCccNumber] AS PatientID, P.[PatientPID] AS PatientPK,F.[Name] AS FacilityName, F.Code AS SiteCode,PP.[VisitID] VisitID,PP.[Drug] Drug
					  ,PP.[DispenseDate] DispenseDate,PP.[Duration] Duration,PP.[ExpectedReturn] ExpectedReturn,PP.[TreatmentType] TreatmentType
					  ,PP.[PeriodTaken] PeriodTaken,PP.[ProphylaxisType] ProphylaxisType,P.[Emr] Emr
					  ,CASE P.[Project] 
								WHEN 'I-TECH' THEN 'Kenya HMIS II' 
								WHEN 'HMIS' THEN 'Kenya HMIS II'
							ELSE P.[Project] 
					   END AS [Project] 
					  ,PP.[Voided] Voided
					  ,PP.[Processed] Processed
					  ,PP.[Provider] [Provider]
					  ,PP.[RegimenLine] RegimenLine
					  ,PP.[Created] Created
					  ,PP.RegimenChangedSwitched RegimenChangedSwitched
					  ,PP.RegimenChangeSwitchReason RegimenChangeSwitchReason
					  ,PP.StopRegimenReason StopRegimenReason
					  ,PP.StopRegimenDate StopRegimenDate
					  ,LTRIM(RTRIM(STR(F.Code)))+'-'+LTRIM(RTRIM(P.[PatientCccNumber])) +'-'+LTRIM(RTRIM(STR(P.[PatientPID]))) AS PKV, 
					  0 AS IsRegimenFlag, 
					  0 AS KnockOutDrug,
					  NULL AS PatientUID
					FROM [DWAPICentral].[dbo].[PatientExtract] P 
						INNER JOIN [DWAPICentral].[dbo].[PatientArtExtract] PA ON PA.[PatientId]= P.ID
						INNER JOIN [DWAPICentral].[dbo].[PatientPharmacyExtract] PP ON PP.[PatientId]= P.ID AND PP.Voided=0
						INNER JOIN [DWAPICentral].[dbo].[Facility] F ON P.[FacilityId] = F.Id AND F.Voided=0
					WHERE p.gender!='Unknown' ) AS b 
						ON(
						--a.PatientID COLLATE SQL_Latin1_General_CP1_CI_AS = b.PatientID COLLATE SQL_Latin1_General_CP1_CI_AS and
						 a.PatientPK  = b.PatientPK 
						and a.SiteCode = b.SiteCode
						and a.visitID = b.visitID
						and a.DispenseDate = b.DispenseDate
						)
			--WHEN MATCHED THEN
			--UPDATE SET 
			--a.FacilityName = B.FacilityName  ----anclude all the columns that can change
			WHEN NOT MATCHED THEN 
			INSERT(PatientID,SiteCode,FacilityName,PatientPK,VisitID,Drug,DispenseDate,Duration,ExpectedReturn,TreatmentType,PeriodTaken,ProphylaxisType,Emr,Project,PKV,PatientUID,RegimenLine,RegimenChangedSwitched,RegimenChangeSwitchReason,StopRegimenReason,StopRegimenDate) 
			VALUES(PatientID,SiteCode,FacilityName,PatientPK,VisitID,Drug,DispenseDate,Duration,ExpectedReturn,TreatmentType,PeriodTaken,ProphylaxisType,Emr,Project,PKV,PatientUID,RegimenLine,RegimenChangedSwitched,RegimenChangeSwitchReason,StopRegimenReason,StopRegimenDate);
			
			---Remove any duplicate from [NDWH_DB].[dbo].[DimPatient]
			WITH CTE AS   
				(  
					SELECT [PatientPK],[SiteCode],DispenseDate,ROW_NUMBER() 
					OVER (PARTITION BY [PatientPK],[SiteCode],DispenseDate
					ORDER BY [PatientPK],[SiteCode],DispenseDate) AS dump_ 
					FROM [ODS].[dbo].[CT_PatientPharmacy] 
					)  
			
			DELETE FROM CTE WHERE dump_ >1;

			------- Rrefresh DimFacility

			--MERGE [NDWH_DB].[dbo].[DimFacility] AS a
			--	USING(SELECT  P.[PatientCccNumber] as PatientID,P.[PatientPID] as PatientPK,F.Code as SiteCode,F.[Name] as FacilityName,Gender,DOB,RegistrationDate,RegistrationAtCCC,RegistrationAtPMTCT,RegistrationAtTBClinic,PatientSource,Region,District,Village,ContactRelation,LastVisit,MaritalStatus,EducationLevel,DateConfirmedHIVPositive,PreviousARTExposure,PreviousARTStartDate,P.Emr,P.Project,PKV,Orphan,Inschool,PatientType,PopulationType,KeyPopulationType,PatientResidentCounty,PatientResidentSubCounty,PatientResidentLocation,PatientResidentSubLocation,PatientResidentWard,PatientResidentVillage,TransferInDate,Occupation,NUPI
			--			FROM [DWAPICentral].[dbo].[PatientExtract]  P  with (NoLock)
			--			INNER JOIN [DWAPICentral].[dbo].[Facility] F with (NoLock)  ON P.[FacilityId] = F.Id AND F.Voided=0 
			--			---INNER JOIN FacilityManifest_MaxDateRecieved(NoLock) a ON F.Code = a.SiteCode
			--			WHERE P.Voided=0 and P.[Gender] is NOT NULL and p.gender!='Unknown' ) AS b 
			--			ON(a.PatientID=b.PatientID and a.PatientPK = b.PatientPK and a.SiteCode = b.SiteCode)
			--WHEN MATCHED THEN
			--UPDATE SET 
			--a.FacilityName = B.FacilityName
			--WHEN NOT MATCHED THEN 
			--INSERT(PatientID,PatientPK,SiteCode,FacilityName,Gender,DOB,RegistrationDate,RegistrationAtCCC,RegistrationAtPMTCT,RegistrationAtTBClinic,PatientSource,Region,District,Village,ContactRelation,LastVisit,MaritalStatus,EducationLevel,DateConfirmedHIVPositive,PreviousARTExposure,PreviousARTStartDate,Emr,Project,Orphan,Inschool,PatientType,PopulationType,KeyPopulationType,PatientResidentCounty,PatientResidentSubCounty,PatientResidentLocation,PatientResidentSubLocation,PatientResidentWard,PatientResidentVillage,TransferInDate,Occupation,NUPI) 
			--VALUES(PatientID,PatientPK,SiteCode,FacilityName,Gender,DOB,RegistrationDate,RegistrationAtCCC,RegistrationAtPMTCT,RegistrationAtTBClinic,PatientSource,Region,District,Village,ContactRelation,LastVisit,MaritalStatus,EducationLevel,DateConfirmedHIVPositive,PreviousARTExposure,PreviousARTStartDate,Emr,Project,Orphan,Inschool,PatientType,PopulationType,KeyPopulationType,PatientResidentCounty,PatientResidentSubCounty,PatientResidentLocation,PatientResidentSubLocation,PatientResidentWard,PatientResidentVillage,TransferInDate,Occupation,NUPI);
			
	END


GO
/****** Object:  StoredProcedure [dbo].[Load_CT_PatientPharmacy_Optimized]    Script Date: 10/13/2022 9:03:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Load_CT_PatientPharmacy_Optimized]  
AS 
	BEGIN
	       DECLARE @MaxDispenseDate_Hist			DATETIME,
				   @DispenseDate					DATETIME
				
		SELECT @MaxDispenseDate_Hist =  MAX(MaxDispenseDate) FROM [ODS].[dbo].[CT_PharmacyVisit_Log]  (NoLock)
		SELECT @DispenseDate = MAX(DispenseDate) FROM [DWAPICentral].[dbo].[PatientPharmacyExtract] WITH (NOLOCK) 
		
		IF (SELECT COUNT(1) FROM [ODS].[dbo].[CT_PharmacyVisit_Log](NoLock) WHERE MaxDispenseDate = @DispenseDate) > 0
		RETURN

			ELSE
				BEGIN
					
					INSERT INTO  [ODS].[dbo].[CT_PharmacyVisit_Log](MaxDispenseDate,LoadStartDateTime)
					VALUES(@DispenseDate,GETDATE())

					INSERT INTO [ODS].[dbo].[CT_PatientPharmacy](PatientID,PatientPK,FacilityName,SiteCode,VisitID,Drug,DispenseDate,Duration,
					ExpectedReturn,TreatmentType,PeriodTaken,ProphylaxisType,Emr,Project,DateImported,CKV,RegimenLine,RegimenChangedSwitched,RegimenChangeSwitchReason,StopRegimenReason,StopRegimenDate)

					SELECT 
					  P.[PatientCccNumber] AS PatientID,P.[PatientPID] AS PatientPK,F.Name AS FacilityName,F.Code AS SiteCode,PP.[VisitID],PP.[Drug],PP.[DispenseDate],PP.[Duration]
					  ,PP.[ExpectedReturn],PP.[TreatmentType],PP.[PeriodTaken],PP.[ProphylaxisType],P.[Emr]
					  ,CASE P.[Project] 
							WHEN 'I-TECH' THEN 'Kenya HMIS II' 
							WHEN 'HMIS' THEN 'Kenya HMIS II'
					   ELSE P.[Project] 
					   END AS [Project]
					  ,CAST(GETDATE() AS DATE) AS DateImported
					  ,LTRIM(RTRIM(STR(F.Code)))+'-'+LTRIM(RTRIM(P.[PatientCccNumber])) +'-'+LTRIM(RTRIM(STR(P.[PatientPID]))) AS CKV 
					  --,PP.[Provider]
					  ,PP.[RegimenLine]
					 -- ,PP.[Created]
					   ,PP.RegimenChangedSwitched,PP.RegimenChangeSwitchReason,PP.StopRegimenReason,PP.StopRegimenDate

				FROM [DWAPICentral].[dbo].[PatientExtract] P 
				INNER JOIN [DWAPICentral].[dbo].[PatientArtExtract] PA ON PA.[PatientId]= P.ID
				INNER JOIN [DWAPICentral].[dbo].[PatientPharmacyExtract] PP ON PP.[PatientId]= P.ID AND PP.Voided=0
				INNER JOIN [DWAPICentral].[dbo].[Facility] F ON P.[FacilityId] = F.Id AND F.Voided=0
				WHERE p.gender!='Unknown'  AND DispenseDate > @MaxDispenseDate_Hist;

				UPDATE [ODS].[dbo].[CT_PharmacyVisit_Log]
				SET LoadEndDateTime = GETDATE()
				WHERE MaxDispenseDate = @DispenseDate;

			END
			---Remove any duplicate from [NDWH_DB].[dbo].[DimPatient]
			;WITH CTE AS   
				(  
					SELECT [PatientPK],[SiteCode],DispenseDate,ROW_NUMBER() 
					OVER (PARTITION BY [PatientPK],[SiteCode],DispenseDate
					ORDER BY [PatientPK],[SiteCode],DispenseDate) AS dump_ 
					FROM [ODS].[dbo].[CT_PatientPharmacy] 
					)  
			
			DELETE FROM CTE WHERE dump_ >1;

			
	END


GO
/****** Object:  StoredProcedure [dbo].[Load_CT_PatientStatus]    Script Date: 10/13/2022 9:03:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Load_CT_PatientStatus]    
AS 
	BEGIN
	       ---- Refresh [ODS].[dbo].[CT_PatientStatus]
		  
			MERGE [ODS].[dbo].[CT_PatientStatus] AS a
				USING(SELECT 
							P.[PatientCccNumber] AS PatientID, 
							P.[PatientPID] AS PatientPK,
							F.Name AS FacilityName, 
							F.Code AS SiteCode
							,PS.[ExitDescription] ExitDescription
							,PS.[ExitDate] ExitDate
							,PS.[ExitReason] ExitReason
							,P.[Emr] Emr
							,CASE P.[Project] 
								WHEN 'I-TECH' THEN 'Kenya HMIS II' 
								WHEN 'HMIS' THEN 'Kenya HMIS II'
							ELSE P.[Project] 
							END AS [Project] 

						  ,PS.[Voided] Voided
						  ,PS.[Processed] Processed
						  ,PS.[Created] Created
						  ,LTRIM(RTRIM(STR(F.Code)))+'-'+LTRIM(RTRIM(P.[PatientCccNumber])) +'-'+LTRIM(RTRIM(STR(P.[PatientPID]))) AS PKV,
						NULL AS PatientUID,
						[ReasonForDeath],
						[SpecificDeathReason],
						Cast([DeathDate] as Date)[DeathDate],
						EffectiveDiscontinuationDate,
						PS.TOVerified TOVerified,
						PS.TOVerifiedDate TOVerifiedDate,
						PS.ReEnrollmentDate ReEnrollmentDate
						FROM [DWAPICentral].[dbo].[PatientExtract] P WITH (NoLock)  
						INNER JOIN [DWAPICentral].[dbo].[PatientStatusExtract]PS WITH (NoLock)  ON PS.[PatientId]= P.ID AND PS.Voided=0
						INNER JOIN [DWAPICentral].[dbo].[Facility] F (NoLock)  ON P.[FacilityId] = F.Id AND F.Voided=0
						---INNER JOIN FacilityManifest_MaxDateRecieved(NoLock) a ON F.Code = a.SiteCode and a.[End] is not null and a.[Session] is not null
						WHERE p.gender!='Unknown') AS b 
						ON(
						--a.PatientID COLLATE SQL_Latin1_General_CP1_CI_AS = b.PatientID COLLATE SQL_Latin1_General_CP1_CI_AS and
						 a.PatientPK  = b.PatientPK 
						and a.SiteCode = b.SiteCode
						and a.exitdate = b.exitdate
						and a.EffectiveDiscontinuationDate = b.EffectiveDiscontinuationDate
						)
						--WHEN MATCHED THEN
						--UPDATE SET 
						--a.FacilityName = B.FacilityName     ----Add all the columns that can change
						WHEN NOT MATCHED THEN 
						INSERT(PatientID,SiteCode,FacilityName,ExitDescription,ExitDate,ExitReason,PatientPK,Emr,Project,PKV,PatientUID,TOVerified,TOVerifiedDate,ReEnrollmentDate,DeathDate)--/*,SpecificDeathReason,DeathDate,EffectiveDiscontinuationDate */) 
						VALUES(PatientID,SiteCode,FacilityName,ExitDescription,ExitDate,ExitReason,PatientPK,Emr,Project,PKV,PatientUID,TOVerified,TOVerifiedDate,ReEnrollmentDate,DeathDate); --/*ReasonForDeath,SpecificDeathReason,DeathDate /*EffectiveDiscontinuationDate/*);
			
			---Remove any duplicate from [NDWH_DB].[dbo].[DimPatient]
			WITH CTE AS   
				(  
					SELECT [PatientPK],[SiteCode],ExitDate,EffectiveDiscontinuationDate,ROW_NUMBER() 
					OVER (PARTITION BY [PatientPK],[SiteCode],ExitDate ,EffectiveDiscontinuationDate
					ORDER BY [PatientPK],[SiteCode],ExitDate,EffectiveDiscontinuationDate) AS dump_ 
					FROM [ODS].[dbo].[CT_PatientStatus] 
					)  
			
			DELETE FROM CTE WHERE dump_ >1;

			
	END


GO
/****** Object:  StoredProcedure [dbo].[Load_CT_PatientStatus_Optimized]    Script Date: 10/13/2022 9:03:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Load_CT_PatientStatus_Optimized]    
AS 
	BEGIN
		DECLARE		@MaxExitDate_Hist			DATETIME,
					@ExitDate					DATETIME
				
		SELECT @MaxExitDate_Hist =  MAX(MaxExitDate) FROM [ODS].[dbo].[CT_LopatientStatus_Log]  (NoLock);
		SELECT @ExitDate = MAX(ExitDate) FROM [DWAPICentral].[dbo].[PatientStatusExtract] WITH (NOLOCK) ;
		
		IF (SELECT COUNT(1) FROM [ODS].[dbo].[CT_LopatientStatus_Log] (NoLock) WHERE MaxExitDate = @ExitDate) > 0
		RETURN

			ELSE
				BEGIN
					
					INSERT INTO  [ODS].[dbo].[CT_PharmacyVisit_Log](MaxDispenseDate,LoadStartDateTime)
					VALUES(@ExitDate,GETDATE());
	       ---- Refresh [ODS].[dbo].[CT_PatientStatus]
		   INSERT INTO [ODS].[dbo].[CT_PatientStatus](PatientID,PatientPK,FacilityName,SiteCode,ExitDescription,ExitDate,ExitReason,Emr,Project,
		   CKV,TOVerified,TOVerifiedDate,ReEnrollmentDate,ReasonForDeath,SpecificDeathReason,DeathDate,EffectiveDiscontinuationDate)
			SELECT P.[PatientCccNumber] AS PatientID, 
							P.[PatientPID] AS PatientPK,
							F.Name AS FacilityName, 
							F.Code AS SiteCode
							,PS.[ExitDescription] ExitDescription
							,PS.[ExitDate] ExitDate
							,PS.[ExitReason] ExitReason
							,P.[Emr] Emr
							,CASE P.[Project] 
								WHEN 'I-TECH' THEN 'Kenya HMIS II' 
								WHEN 'HMIS' THEN 'Kenya HMIS II'
							ELSE P.[Project] 
							END AS [Project] 
							,LTRIM(RTRIM(STR(F.Code)))+'-'+LTRIM(RTRIM(P.[PatientCccNumber])) +'-'+LTRIM(RTRIM(STR(P.[PatientPID]))) AS CKV--Previously PKV
						  --,PS.[Voided] Voided
						  --,PS.[Processed] Processed
						  --,PS.[Created] Created
						  ,PS.TOVerified TOVerified
						,PS.TOVerifiedDate TOVerifiedDate
						,PS.ReEnrollmentDate ReEnrollmentDate

						,[ReasonForDeath]
						,[SpecificDeathReason]
						,Cast([DeathDate] as Date)[DeathDate]
						,EffectiveDiscontinuationDate
						
						FROM [DWAPICentral].[dbo].[PatientExtract] P WITH (NoLock)  
						INNER JOIN [DWAPICentral].[dbo].[PatientStatusExtract]PS WITH (NoLock)  ON PS.[PatientId]= P.ID AND PS.Voided=0
						INNER JOIN [DWAPICentral].[dbo].[Facility] F (NoLock)  ON P.[FacilityId] = F.Id AND F.Voided=0
						---INNER JOIN FacilityManifest_MaxDateRecieved(NoLock) a ON F.Code = a.SiteCode and a.[End] is not null and a.[Session] is not null
						WHERE p.gender!='Unknown' AND ExitDate > @MaxExitDate_Hist;

						UPDATE [ODS].[dbo].[CT_LopatientStatus_Log]
						SET LoadEndDateTime = GETDATE()
						WHERE MaxExitDate = @ExitDate;
				END
			---Remove any duplicate from [NDWH_DB].[dbo].[DimPatient]
			;WITH CTE AS   
				(  
					SELECT [PatientPK],[SiteCode],ExitDate,EffectiveDiscontinuationDate,ROW_NUMBER() 
					OVER (PARTITION BY [PatientPK],[SiteCode],ExitDate ,EffectiveDiscontinuationDate
					ORDER BY [PatientPK],[SiteCode],ExitDate,EffectiveDiscontinuationDate) AS dump_ 
					FROM [ODS].[dbo].[CT_PatientStatus] 
					)  
			
			DELETE FROM CTE WHERE dump_ >1;

			
	END


GO
/****** Object:  StoredProcedure [dbo].[Load_CT_PatientVisits]    Script Date: 10/13/2022 9:03:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Load_CT_PatientVisits]    
AS 
	BEGIN
	       ---- Refresh DimPatient
			MERGE [ODS].[dbo].[CT_PatientVisits] AS a
				USING(SELECT  P.[PatientCccNumber] AS PatientID, P.[PatientPID] AS PatientPK,F.[Name] AS FacilityName, F.Code AS SiteCode,PV.[VisitId] VisitID,PV.[VisitDate] VisitDate
						  ,PV.[Service] [SERVICE],PV.[VisitType] VisitType,PV.[WHOStage] WHOStage,PV.[WABStage] WABStage,PV.[Pregnant] Pregnant,PV.[LMP] LMP,PV.[EDD] EDD,PV.[Height] [Height],PV.[Weight] [Weight],PV.[BP] [BP],PV.[OI] [OI],PV.[OIDate] [OIDate]
						  ,PV.[SubstitutionFirstlineRegimenDate] SubstitutionFirstlineRegimenDate,PV.[SubstitutionFirstlineRegimenReason] SubstitutionFirstlineRegimenReason,PV.[SubstitutionSecondlineRegimenDate] SubstitutionSecondlineRegimenDate,PV.[SubstitutionSecondlineRegimenReason] SubstitutionSecondlineRegimenReason
						  ,PV.[SecondlineRegimenChangeDate] SecondlineRegimenChangeDate,PV.[SecondlineRegimenChangeReason] SecondlineRegimenChangeReason,PV.[Adherence] Adherence,PV.[AdherenceCategory] AdherenceCategory,PV.[FamilyPlanningMethod] FamilyPlanningMethod
						  ,PV.[PwP] PwP,PV.[GestationAge] GestationAge,PV.[NextAppointmentDate] NextAppointmentDate,P.[Emr] Emr
						  ,CASE P.[Project]
									WHEN 'I-TECH' THEN 'Kenya HMIS II' 
									WHEN 'HMIS' THEN 'Kenya HMIS II'
								ELSE P.[Project] 
							END AS [Project] 
						  ,PV.[Voided] Voided,pv.[StabilityAssessment] StabilityAssessment,pv.[DifferentiatedCare] DifferentiatedCare,pv.[PopulationType] PopulationType,pv.[KeyPopulationType] KeyPopulationType,PV.[Processed] Processed
						  ,PV.[Created] Created
						  ,LTRIM(RTRIM(STR(F.Code)))+'-'+LTRIM(RTRIM(P.[PatientCccNumber]))+'-'+LTRIM(RTRIM(STR(P.[PatientPID]))) AS PKV, 
						  0 AS knockout,NULL AS PatientUID,[GeneralExamination],[SystemExamination],[Skin],[Eyes],[ENT],[Chest],[CVS],[Abdomen],[CNS],[Genitourinary]
							-----Missing columns Added later by Dennis
						  ,PV.VisitBy VisitBy,PV.Temp Temp,PV.PulseRate PulseRate,PV.RespiratoryRate RespiratoryRate,PV.OxygenSaturation OxygenSaturation,PV.Muac Muac,PV.NutritionalStatus NutritionalStatus,PV.EverHadMenses EverHadMenses,PV.Menopausal Menopausal
						  ,PV.Breastfeeding Breastfeeding,PV.NoFPReason NoFPReason,PV.ProphylaxisUsed ProphylaxisUsed,PV.CTXAdherence CTXAdherence,PV.CurrentRegimen CurrentRegimen,PV.HCWConcern HCWConcern,PV.TCAReason TCAReason,PV.ClinicalNotes ClinicalNotes
						FROM [DWAPICentral].[dbo].[PatientExtract] P WITH (NoLock)  
						LEFT JOIN [DWAPICentral].[dbo].[PatientArtExtract] PA WITH(NoLock)  ON PA.[PatientId]= P.ID
						INNER JOIN [DWAPICentral].[dbo].[PatientVisitExtract] PV WITH(NoLock)  ON PV.[PatientId]= P.ID AND PV.Voided=0
						INNER JOIN [DWAPICentral].[dbo].[Facility] F WITH(NoLock)  ON P.[FacilityId] = F.Id AND F.Voided=0
						---INNER JOIN [DWAPICentral].[dbo].[FacilityManifest_MaxDateRecieved](NoLock) a ON F.Code = a.SiteCode
						----LEFT JOIN All_Staging_2016_2.dbo.stg_Patients TPat ON TPat.PKV=LTRIM(RTRIM(STR(F.Code)))+'-'+LTRIM(RTRIM(P.[PatientCccNumber]))+'-'+LTRIM(RTRIM(STR(P.[PatientPID])))
						--ORDER BY F.Id, PV.[PatientId],PV.[VisitDate],PV.[VisitId]
						WHERE p.gender!='Unknown') AS b 
						ON(
						--a.PatientID COLLATE SQL_Latin1_General_CP1_CI_AS = b.PatientID COLLATE SQL_Latin1_General_CP1_CI_AS AND
							 a.PatientPK  = b.PatientPK 
							AND a.SiteCode = b.SiteCode
							AND a.visitID = b.[VisitId]
							and a.visitDate = b.visitDate
							)
			--WHEN MATCHED THEN
			--UPDATE SET 
			--a.FacilityName = B.FacilityName  ---Update all the columns that can change
			WHEN NOT MATCHED THEN 
			INSERT(PatientID,FacilityName,SiteCode,PatientPK,VisitID,VisitDate,[SERVICE],VisitType,WHOStage,WABStage,Pregnant,LMP,EDD,Height,[Weight],BP,OI,OIDate,Adherence,AdherenceCategory,FamilyPlanningMethod,PwP,GestationAge,NextAppointmentDate,Emr,Project,PKV,PatientUID,DifferentiatedCare,StabilityAssessment,KeyPopulationType,PopulationType,VisitBy,Temp,PulseRate,RespiratoryRate,OxygenSaturation,Muac,NutritionalStatus,EverHadMenses,Breastfeeding,Menopausal,NoFPReason,ProphylaxisUsed,CTXAdherence,CurrentRegimen,HCWConcern,TCAReason,ClinicalNotes) 
			VALUES(PatientID,FacilityName,SiteCode,PatientPK,VisitID,VisitDate,[SERVICE],VisitType,WHOStage,WABStage,Pregnant,LMP,EDD,Height,[Weight],BP,OI,OIDate,Adherence,AdherenceCategory,FamilyPlanningMethod,PwP,GestationAge,NextAppointmentDate,Emr,Project,PKV,PatientUID,DifferentiatedCare,StabilityAssessment,KeyPopulationType,PopulationType,VisitBy,Temp,PulseRate,RespiratoryRate,OxygenSaturation,Muac,NutritionalStatus,EverHadMenses,Breastfeeding,Menopausal,NoFPReason,ProphylaxisUsed,CTXAdherence,CurrentRegimen,HCWConcern,TCAReason,ClinicalNotes);
			
			---Remove any duplicate from [NDWH_DB].[dbo].[DimPatient]
			WITH CTE AS   
				(  
					SELECT [PatientPK],[SiteCode],VisitID,visitDate,ROW_NUMBER() 
					OVER (PARTITION BY [PatientPK],[SiteCode],VisitID,visitDate
					ORDER BY [PatientPK],[SiteCode],VisitID,visitDate) AS dump_ 
					FROM [ODS].[dbo].[CT_PatientVisits] 
					)  
			
			DELETE FROM CTE WHERE dump_ >1;
			
	END





GO
/****** Object:  StoredProcedure [dbo].[Load_CT_PatientVisits_Optimized]    Script Date: 10/13/2022 9:03:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Load_CT_PatientVisits_Optimized] 
AS 
	BEGIN
		DECLARE @MaxVisitDate_Hist		DATETIME,
				@VisitDate				DATETIME
				
		SELECT @MaxVisitDate_Hist =  MAX(MaxVisitDate) FROM [ODS].[dbo].[CT_Visit_Log]  (NoLock)
		SELECT @VisitDate = MAX(VisitDate) FROM [DWAPICentral].[dbo].[PatientVisitExtract] WITH (NOLOCK) 
		
		IF (SELECT COUNT(1) FROM [ODS].[dbo].[CT_Visit_Log](NoLock) WHERE MaxVisitDate = @VisitDate) > 0
		RETURN

			ELSE
				BEGIN
				
					INSERT INTO  [ODS].[dbo].[CT_Visit_Log](MaxVisitDate,LoadStartDateTime)
					VALUES(@VisitDate,GETDATE())

				  INSERT INTO [ODS].[dbo].[CT_PatientVisits](PatientID,PatientPK,FacilityName,SiteCode,VisitID,
						VisitDate,[SERVICE],VisitType,WHOStage,WABStage,Pregnant,LMP,EDD,Height,[Weight],
						BP,OI,OIDate,Adherence,AdherenceCategory,FamilyPlanningMethod,PwP,GestationAge,NextAppointmentDate,
						Emr,Project,CKV,DifferentiatedCare,StabilityAssessment,KeyPopulationType,PopulationType,VisitBy,Temp,PulseRate,
						RespiratoryRate,OxygenSaturation,Muac,NutritionalStatus,EverHadMenses,Breastfeeding,Menopausal,NoFPReason,
						ProphylaxisUsed,CTXAdherence,CurrentRegimen,HCWConcern,TCAReason,ClinicalNotes,GeneralExamination,SystemExamination,Skin,Eyes,ENT,Chest,CVS,Abdomen,CNS,Genitourinary)
				   SELECT 
						  P.[PatientCccNumber] AS PatientID, P.[PatientPID] AS PatientPK, F.Name AS FacilityName,  F.Code AS SiteCode,PV.[VisitId]
						  ,PV.[VisitDate],PV.[Service],PV.[VisitType],PV.[WHOStage],PV.[WABStage],PV.[Pregnant],PV.[LMP],PV.[EDD],PV.[Height],PV.[Weight]
						  ,PV.[BP],PV.[OI],PV.[OIDate],PV.[Adherence],PV.[AdherenceCategory],PV.[FamilyPlanningMethod],PV.[PwP],PV.[GestationAge],PV.[NextAppointmentDate]
						  ,P.[Emr]
						  ,CASE P.[Project] 
								WHEN 'I-TECH' THEN 'Kenya HMIS II' 
								WHEN 'HMIS' THEN 'Kenya HMIS II'
						   ELSE P.[Project] 
						   END AS [Project] 
						   ,LTRIM(RTRIM(STR(F.Code)))+'-'+LTRIM(RTRIM(P.[PatientCccNumber]))+'-'+LTRIM(RTRIM(STR(P.[PatientPID]))) AS CKV 
						  ,pv.[DifferentiatedCare],pv.[StabilityAssessment],pv.[PopulationType],pv.[KeyPopulationType],PV.VisitBy ,PV.Temp ,PV.PulseRate 
						  ,PV.RespiratoryRate,PV.OxygenSaturation,PV.Muac,PV.NutritionalStatus,PV.EverHadMenses,PV.Breastfeeding,PV.Menopausal,PV.NoFPReason
						  ,PV.ProphylaxisUsed,PV.CTXAdherence,PV.CurrentRegimen,PV.HCWConcern,PV.TCAReason,PV.ClinicalNotes,[GeneralExamination]
						  ,[SystemExamination],[Skin],[Eyes],[ENT],[Chest],[CVS],[Abdomen],[CNS],[Genitourinary]
						  -----Missing columns Added later by Dennis
						  
					FROM [DWAPICentral].[dbo].[PatientExtract](NoLock) P 
					LEFT JOIN [DWAPICentral].[dbo].[PatientArtExtract](NoLock) PA ON PA.[PatientId]= P.ID
					INNER JOIN [DWAPICentral].[dbo].[PatientVisitExtract](NoLock) PV ON PV.[PatientId]= P.ID AND PV.Voided=0
					INNER JOIN [DWAPICentral].[dbo].[Facility](NoLock) F ON P.[FacilityId] = F.Id AND F.Voided=0
					WHERE p.gender!='Unknown' AND VisitDate >@MaxVisitDate_Hist  --and a.[End] is not null and a.[Session] is not null  AND VisitDate > @MaxVisitDate_Hist
				
				  UPDATE [ODS].[dbo].[CT_Visit_Log]
				  SET LoadEndDateTime = GETDATE()
				  WHERE MaxVisitDate = @VisitDate
				END
			---Remove any duplicate from [NDWH_DB].[dbo].[DimPatient]
			;WITH CTE AS   
				(  
					SELECT [PatientID],[PatientPK],[SiteCode],VisitID,ROW_NUMBER() 
					OVER (PARTITION BY [PatientID],[PatientPK],[SiteCode],VisitID 
					ORDER BY [PatientID],[PatientPK],[SiteCode],VisitID) AS dump_ 
					FROM [ODS].[dbo].[CT_PatientVisits] 
					)  
			
			DELETE FROM CTE WHERE dump_ >1;			
	END





GO
/****** Object:  StoredProcedure [dbo].[Load_CT_Visit]    Script Date: 10/13/2022 9:03:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[Load_CT_Visit]
	AS

	DECLARE		@MaxVisit_Hist			DATETIME,
				@VisitDate				DATETIME
				
		SELECT @MaxVisit_Hist =  MAX(MaxVisitDate) from [ODS].[dbo].[CT_Visit_Log]  (nolock)
		SELECT @VisitDate = MAX(VisitDate) FROM [DWAPICentral].[dbo].[PatientVisitExtract] WITH (NOLOCK) 
		
		IF (SELECT COUNT(1) FROM [ODS].[dbo].[CT_Visit_Log](NoLock) WHERE MaxVisitDate = @VisitDate ) > 0
		RETURN

			ELSE
		BEGIN

			INSERT INTO [ODS].[dbo].[CT_Visit_Log](MaxVisitDate,[LoadStartDateTime])
			SELECT @VisitDate,GETDATE()

			
			INSERT INTO [ODS].[dbo].[CT_PatientVisits_Test](PatientID,PatientPK,FacilityName,SiteCode,VisitID,VisitDate,
			[SERVICE],VisitType,WHOStage,WABStage,Pregnant,LMP,EDD,Height,[Weight],BP,OI,OIDate,Adherence,AdherenceCategory,FamilyPlanningMethod,PwP,
			GestationAge,NextAppointmentDate,Emr,Project,
			PKV,DifferentiatedCare,StabilityAssessment,PopulationType,KeyPopulationType,
			VisitBy,Temp,PulseRate,RespiratoryRate,OxygenSaturation,Muac,NutritionalStatus,EverHadMenses,Menopausal,NoFPReason,ProphylaxisUsed,CTXAdherence,CurrentRegimen,HCWConcern,TCAReason,ClinicalNotes,GeneralExamination,
			SystemExamination,Skin,Eyes,ENT,Chest,CVS,Abdomen,CNS,Genitourinary,Breastfeeding)
			SELECT  P.[PatientCccNumber] AS PatientID, P.[PatientPID] AS PatientPK,F.[Name] AS FacilityName, F.Code AS SiteCode,PV.[VisitId] VisitID,PV.[VisitDate]
						  ,PV.[Service],PV.[VisitType],PV.[WHOStage],PV.[WABStage],PV.[Pregnant],PV.[LMP],PV.[EDD],PV.[Height],PV.[Weight]
						  ,PV.[BP],PV.[OI],PV.[OIDate] 
						  ,PV.[Adherence] ,PV.[AdherenceCategory],PV.[FamilyPlanningMethod],PV.[PwP],
						  PV.[GestationAge],PV.[NextAppointmentDate],P.[Emr]
						  --,PV.[SubstitutionFirstlineRegimenDate] SubstitutionFirstlineRegimenDate,PV.[SubstitutionFirstlineRegimenReason] SubstitutionFirstlineRegimenReason,PV.[SubstitutionSecondlineRegimenDate] SubstitutionSecondlineRegimenDate,PV.[SubstitutionSecondlineRegimenReason] SubstitutionSecondlineRegimenReason
						  --,PV.[SecondlineRegimenChangeDate] SecondlineRegimenChangeDate,PV.[SecondlineRegimenChangeReason] SecondlineRegimenChangeReason,
						  ,CASE P.[Project]
									WHEN 'I-TECH' THEN 'Kenya HMIS II' 
									WHEN 'HMIS' THEN 'Kenya HMIS II'
								ELSE P.[Project] 
							END AS [Project] 
						,LTRIM(RTRIM(STR(F.Code)))+'-'+LTRIM(RTRIM(P.[PatientCccNumber]))+'-'+LTRIM(RTRIM(STR(P.[PatientPID]))) AS PKV
						  ,pv.[DifferentiatedCare] ,pv.[StabilityAssessment],pv.[PopulationType],PV.KeyPopulationType
						   ,PV.VisitBy,PV.Temp,PV.PulseRate,PV.RespiratoryRate,PV.OxygenSaturation,PV.Muac, PV.NutritionalStatus,PV.EverHadMenses,PV.Menopausal
						   ,PV.NoFPReason,PV.ProphylaxisUsed,PV.CTXAdherence,PV.CurrentRegimen,PV.HCWConcern,PV.TCAReason,PV.ClinicalNotes
						  ,[GeneralExamination],[SystemExamination],[Skin],[Eyes],[ENT],[Chest],[CVS],[Abdomen],[CNS],[Genitourinary]
							-----Missing columns Added later by Dennis
						  ,PV.Breastfeeding 
						FROM [DWAPICentral].[dbo].[PatientExtract] P WITH (NoLock)  
						LEFT JOIN [DWAPICentral].[dbo].[PatientArtExtract] PA WITH(NoLock)  ON PA.[PatientId]= P.ID
						INNER JOIN [DWAPICentral].[dbo].[PatientVisitExtract] PV WITH(NoLock)  ON PV.[PatientId]= P.ID AND PV.Voided=0
						INNER JOIN [DWAPICentral].[dbo].[Facility] F WITH(NoLock)  ON P.[FacilityId] = F.Id AND F.Voided=0
						WHERE p.gender!='Unknown' AND VisitDate > @MaxVisit_Hist
			


					UPDATE [ODS].[dbo].[CT_Visit_Log]
					SET [LoadEndDateTime]= GETDATE()
					WHERE MaxVisitDate = @VisitDate

	END

GO
/****** Object:  StoredProcedure [dbo].[Populate_ARTOutcome]    Script Date: 10/13/2022 9:03:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Populate_ARTOutcome]

AS
BEGIN

declare @as_of_date as date;
--set @as_of_date = '2022-06-30';
		--declare @as_of_date as date;
		truncate table  NDWH_DB.dbo.Landing_ARTOutcomeReport;

		select @as_of_date =EOMONTH(DATEADD(MONTH,-1,GETDATE()));


		with clinical_visits_as_of_date as (
			/* get visits as of date */
			select 
				PatientPK,
				PatientID,
				SiteCode,
				VisitDate,
				NextAppointmentDate,
				PopulationType,
				KeyPopulationType,
				CurrentRegimen,
				Emr
			from ODS.dbo.CT_PatientVisits
			where SiteCode > 0 and VisitDate <= @as_of_date
		),
		pharmacy_visits_as_of_date as (
			 /* get pharmacy dispensations as of date */
			select 
				PatientPK,
				PatientID,
				SiteCode,
				DispenseDate,
				ExpectedReturn,
				Emr
			from ODS.dbo.CT_PatientPharmacy
			where SiteCode > 0 and DispenseDate <= @as_of_date  
		),
		patient_art_and_enrollment_info as (
			 /* get patients' ART start date */
			select
				distinct CT_ARTPatients.PatientID,
				CT_ARTPatients.PatientPK,
				CT_ARTPatients.SiteCode,
				CT_ARTPatients.StartARTDate,
				CT_ARTPatients.StartRegimen,
				CT_ARTPatients.StartRegimenLine,
				CT_Patient.RegistrationAtCCC as EnrollmentDate,
				CT_Patient.DOB,
				CT_Patient.Gender,
				CT_Patient.DateConfirmedHIVPositive,
				datediff(yy, CT_Patient.DOB, CT_Patient.RegistrationAtCCC) as AgeEnrollment
			from ODS.dbo.CT_ARTPatients
			left join ODS.dbo.CT_Patient  on CT_Patient.PatientID = CT_ARTPatients.PatientID
			and CT_Patient.PatientPK = CT_ARTPatients.PatientPK
			and CT_Patient.SiteCode = CT_ARTPatients.SiteCode
		),
		visit_encounter_as_of_date_ordering as (
			 /* order visits as of date by the VisitDate */
			select 
				clinical_visits_as_of_date.*,
				row_number() over (partition by PatientPK, PatientID, SiteCode order by VisitDate desc) as rank
			from clinical_visits_as_of_date
		),
		pharmacy_dispense_as_of_date_ordering as (
			/* order pharmacy dispensations as of date by the VisitDate */
			select 
				pharmacy_visits_as_of_date.*,
				row_number() over (partition by PatientPK, PatientID, SiteCode order by DispenseDate desc) as rank
			from pharmacy_visits_as_of_date
		),
		last_visit_encounter_as_of_date as (
			/*get the latest visit record for patients for as of date */
			select 
				*
			from visit_encounter_as_of_date_ordering
			where rank = 1
		),
		last_pharmacy_dispense_as_of_date as (
			/*get the latest pharmacy dispensations record for patients for as of date */
			select
				*
			from pharmacy_dispense_as_of_date_ordering
			where rank = 1
		),
		effective_discontinuation_ordering as (
			/*order the effective discontinuation by the EffectiveDiscontinuationDate*/
			select 
				PatientID,
				PatientPK,
				SiteCode,
				EffectiveDiscontinuationDate,
				ExitDate,
				ExitReason,
				row_number() over (partition by PatientPK, PatientID, SiteCode order by EffectiveDiscontinuationDate desc) as rank
			from ODS.dbo.CT_PatientStatus
			where ExitDate is not null and EffectiveDiscontinuationDate is not null
		),
		latest_effective_discontinuation as (
			/*get the latest discontinuation record*/
			select 
				*
			from effective_discontinuation_ordering
			where rank = 1
		),
		exits_as_of_date as (
			/* get exits as of date */
			select 
				PatientID,
				PatientPK,
				SiteCode,
				ExitDate,
				ExitReason
			from ODS.dbo.CT_PatientStatus
			where ExitDate <= @as_of_date 
		),
		exits_as_of_date_ordering as (
			/* order the exits by the ExitDate*/
			select 
				PatientID,
				PatientPK,
				SiteCode,
				ExitDate,
				ExitReason,
				row_number() over (partition by PatientPK, PatientID, SiteCode order by ExitDate desc) as rank
			from exits_as_of_date
		),
		last_exit_as_of_date as (
			/* get latest exit_date as of date */
			select 
				*
			from exits_as_of_date_ordering
			where rank = 1
		),
		visits_and_dispense_encounters_combined_tbl as (
			/* combine latest visits and latest pharmacy dispensation records as of date - 'borrowed logic from the view vw_PatientLastEnconter*/
			/* we don't include the CT_ARTPatients table logic because this table has only the latest records of the patients (no history) */
			select  distinct coalesce (last_visit.PatientID, last_dispense.PatientID) as PatientID,
					coalesce(last_visit.SiteCode, last_dispense.SiteCode) as SiteCode,
					coalesce(last_visit.PatientPK, last_dispense.PatientPK) as PatientPK ,
					coalesce(last_visit.Emr, last_dispense.Emr) as Emr,
					case
						when last_visit.VisitDate >= last_dispense.DispenseDate then last_visit.VisitDate 
						else isnull(last_dispense.DispenseDate, last_visit.VisitDate)
					end as LastEncounterDate,
					case 
						when last_visit.NextAppointmentDate >= last_dispense.ExpectedReturn then last_visit.NextAppointmentDate 
						else isnull(last_dispense.ExpectedReturn, last_visit.NextAppointmentDate)  
					end as NextAppointmentDate
			from last_visit_encounter_as_of_date as last_visit
			full join last_pharmacy_dispense_as_of_date as last_dispense on last_visit.PatientID = last_dispense.PatientID 
				and last_visit.SiteCode = last_dispense.SiteCode 
				and last_visit.PatientPK = last_dispense.PatientPK
			where 
				case
					when last_visit.VisitDate >= last_dispense.DispenseDate then last_visit.VisitDate 
				else isnull(last_dispense.DispenseDate, last_visit.VisitDate)
				end is not null
		),
		last_encounter as (
			/* preparing the latest encounter records as of date */
			select
				visits_and_dispense_encounters_combined_tbl.PatientID,
				visits_and_dispense_encounters_combined_tbl.SiteCode,
				visits_and_dispense_encounters_combined_tbl.PatientPK,
				visits_and_dispense_encounters_combined_tbl.Emr,
				visits_and_dispense_encounters_combined_tbl.LastEncounterDate,
				case 
					when datediff(dd, @as_of_date, visits_and_dispense_encounters_combined_tbl.NextAppointmentDate) >= 365 then dateadd(day, 30, LastEncounterDate)
					else visits_and_dispense_encounters_combined_tbl.NextAppointmentDate 
				end As NextAppointmentDate    
			from visits_and_dispense_encounters_combined_tbl
		),
		ARTOutcomesCompuation as (
			/* computing the ART_Outcome as of date - 'borrowed logic from the view vw_ARTOutcomeX'*/
			select 
				last_encounter.*,
				patient_art_and_enrollment_info.startARTDate,
				last_exit_as_of_date.ExitDate,
				patient_art_and_enrollment_info.EnrollmentDate,
				patient_art_and_enrollment_info.AgeEnrollment,
				patient_art_and_enrollment_info.StartRegimen,
				patient_art_and_enrollment_info.StartRegimenLine,
				patient_art_and_enrollment_info.DateConfirmedHIVPositive,
				patient_art_and_enrollment_info.Gender,
				datediff(year, patient_art_and_enrollment_info.DOB, last_encounter.LastEncounterDate) as AgeLastVisit,
				case 
					when latest_effective_discontinuation.ExitDate is not null 
						and latest_effective_discontinuation.ExitReason <> 'DIED' 
						and latest_effective_discontinuation.EffectiveDiscontinuationDate > eomonth(@as_of_date) then 'V'
					when patient_art_and_enrollment_info.startARTDate > dateadd(s,-1,dateadd(mm, datediff(m,0, @as_of_date) + 1 ,0)) then 'NP'
					when last_exit_as_of_date.ExitDate is not null then substring(last_exit_as_of_date.ExitReason, 1, 1)
					when eomonth(@as_of_date) < last_encounter.NextAppointmentDate
					  or datediff(dd, last_encounter.NextAppointmentDate, eomonth(@as_of_date)) <= 30 then 'V'
					when datediff(dd, last_encounter.NextAppointmentDate, eomonth(@as_of_date)) > 30 then 'uL'
					when NextAppointmentDate is null then 'NV'
				end as ARTOutome,
				@as_of_date as AsOfDate
			from last_encounter
			left join latest_effective_discontinuation on latest_effective_discontinuation.PatientID = last_encounter.PatientID
				and latest_effective_discontinuation.PatientPK = last_encounter.PatientPK
				and latest_effective_discontinuation.SiteCode = last_encounter.SiteCode
			left join last_exit_as_of_date on last_exit_as_of_date.PatientID = last_encounter.PatientID
				and last_exit_as_of_date.PatientPK = last_encounter.PatientPK
				and last_exit_as_of_date.SiteCode = last_encounter.SiteCode
			left join patient_art_and_enrollment_info on patient_art_and_enrollment_info.PatientID = last_encounter.PatientID
				and patient_art_and_enrollment_info.PatientPK = last_encounter.PatientPK
				and patient_art_and_enrollment_info.SiteCode = last_encounter.SiteCode
		)
		select 
			distinct ARTOutcomesCompuation.PatientID,
			ARTOutcomesCompuation.PatientPK,
			ARTOutcomesCompuation.SiteCode as MFLCode,
			facility.[Facility Name] as FacilityName,
			partner.SDP as CTPartner,
			partner.[SDP Agency] as CTAgency,
			facility.County,
			facility.SubCounty as Subcounty,
			last_visit_encounter_as_of_date.PopulationType,
			last_visit_encounter_as_of_date.KeyPopulationType,
			last_visit_encounter_as_of_date.CurrentRegimen,
			ARTOutcomesCompuation.Gender,
			ARTOutcomesCompuation.AgeLastVisit,
			ARTOutcomesCompuation.EnrollmentDate,
			ARTOutcomesCompuation.AgeEnrollment,
			ARTOutcomesCompuation.StartRegimen,
			ARTOutcomesCompuation.StartRegimenLine,
			ARTOutcomesCompuation.ARTOutome,
			ARTOutcomesCompuation.AsOfDate,
			ARTOutcomesCompuation.LastEncounterDate as DateLastVisit,
			ARTOutcomesCompuation.NextAppointmentDate,
			ARTOutcomesCompuation.StartARTDate,
			ARTOutcomesCompuation.DateConfirmedHIVPositive
			Into #ArtOutomes
		from ARTOutcomesCompuation
		left join [ODS].dbo.ALL_EMRSites as partner ON ARTOutcomesCompuation.SiteCode = partner.SDP
		left join [ODS].dbo.ALL_EMRSites as facility ON ARTOutcomesCompuation.SiteCode = facility.MFL_Code
		left join last_visit_encounter_as_of_date  on last_visit_encounter_as_of_date.PatientID = ARTOutcomesCompuation.PatientID
			and last_visit_encounter_as_of_date.PatientPK = ARTOutcomesCompuation.PatientPK
			and last_visit_encounter_as_of_date.SiteCode = ARTOutcomesCompuation.SiteCode

			insert  into  [NDWH_DB].[dbo].[Landing_ARTOutcomeReport](PatientID,PatientPK,MFLCode,FacilityName,CTPartner,CTAgency,County,Subcounty,PopulationType,KeyPopulationType,CurrentRegimen,Gender,AgeLastVisit,EnrollmentDate,AgeEnrollment,StartRegimen,StartRegimenLine,ARTOutome,AsOfDate,DateLastVisit,NextAppointmentDate,StartARTDate,DateConfirmedHIVPositive
)
			select * from #ArtOutomes

			drop table #ArtOutomes

END
GO
