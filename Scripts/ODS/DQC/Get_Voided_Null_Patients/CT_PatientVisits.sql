SELECT 
--[PatientID]
      [FacilityName]
      ,[SiteCode]
      --,[PatientPK]
      ,[VisitID]
      ,[VisitDate]
      ,[SERVICE]
      ,[VisitType]
      ,[WHOStage]
      ,[WABStage]
      ,[Pregnant]
      ,[LMP]
      ,[EDD]
      ,[Height]
      ,[Weight]
      ,[BP]
      ,[OI]
      ,[OIDate]
      ,[Adherence]
      ,[AdherenceCategory]
      ,[FamilyPlanningMethod]
      ,[PwP]
      ,[GestationAge]
      ,[NextAppointmentDate]
      ,[SubstitutionFirstlineReg]
      ,[SubstitutionFirstLineRegReason]
      ,[SubstitutionSecondLineReg]
      ,[SubstitutionSecondLineRegReason]
      ,[SecondLineRegChange]
      ,[SecondLineRegChangeReason]
      ,[Emr]
      ,[Project]
      ,[DateImported]
      ,[DeletedFlag]
      ,[DifferentiatedCare]
      ,[StabilityAssessment]
      ,[KeyPopulationType]
      ,[PopulationType]
      ,[VisitBy]
      ,[Temp]
      ,[PulseRate]
      ,[RespiratoryRate]
      ,[OxygenSaturation]
      ,[Muac]
      ,[NutritionalStatus]
      ,[EverHadMenses]
      ,[Breastfeeding]
      ,[Menopausal]
      ,[NoFPReason]
      ,[ProphylaxisUsed]
      ,[CTXAdherence]
      ,[CurrentRegimen]
      ,[HCWConcern]
      ,[TCAReason]
      ,[ClinicalNotes]
      ,[GeneralExamination]
      ,[SystemExamination]
      ,[Skin]
      ,[Eyes]
      ,[ENT]
      ,[Chest]
      ,[CVS]
      ,[Abdomen]
      ,[CNS]
      ,[Genitourinary]
      ,[PatientPKHash]
      ,[PatientIDHash]
      ,[ZScore]
      ,[ZScoreAbsolute]
      ,[RefillDate]
      ,[PaedsDisclosure]
      ,[Date_Last_Modified]
      ,[Date_Created]
      ,[LoadDate]
      ,[RecordUUID]
      ,[voided]
      ,[WHOStagingOI]
  FROM [ODS].[dbo].[CT_PatientVisits]
  WHERE  [PatientIDHash] IS NULL OR [PatientPKHash] IS NULL AND [voided] = 0;