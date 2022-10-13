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