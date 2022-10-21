BEGIN
	       ---- Refresh [ODS].[dbo].[CT_PatientStatus]
			--CREATE INDEX CT_PatientStatus ON [ODS].[dbo].[CT_PatientStatus] (sitecode,PatientPK,exitdate);
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
						,P.ID as PatientUnique_ID
						,PS.ID as PatientStatusUnique_ID
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
						and a.PatientUnique_ID =b.PatientStatusUnique_ID 
						)
						WHEN MATCHED THEN
							UPDATE SET 
								a.PatientID						=b.PatientID,
								a.FacilityName					=b.FacilityName,
								a.ExitDescription				=b.ExitDescription,
								a.ExitReason					=b.ExitReason,
								a.PatientPK						=b.PatientPK,
								a.Emr							=b.Emr,
								a.Project						=b.Project,
								a.TOVerified					=b.TOVerified	,
								a.TOVerifiedDate				=b.TOVerifiedDate,
								a.ReEnrollmentDate				=b.ReEnrollmentDate,
								a.ReasonForDeath				=b.ReasonForDeath,
								a.SpecificDeathReason			=b.SpecificDeathReason,
								a.DeathDate						=b.DeathDate,
								a.EffectiveDiscontinuationDate	=b.EffectiveDiscontinuationDate
						WHEN NOT MATCHED THEN 
							INSERT(PatientID,SiteCode,FacilityName,ExitDescription,ExitDate,ExitReason,PatientPK,Emr,Project,CKV,TOVerified,TOVerifiedDate,ReEnrollmentDate,DeathDate,PatientUnique_ID,PatientStatusUnique_ID )--/*,SpecificDeathReason,DeathDate,EffectiveDiscontinuationDate */) 
							VALUES(PatientID,SiteCode,FacilityName,ExitDescription,ExitDate,ExitReason,PatientPK,Emr,Project,PKV,TOVerified,TOVerifiedDate,ReEnrollmentDate,DeathDate,PatientUnique_ID,PatientStatusUnique_ID); --/*ReasonForDeath,SpecificDeathReason,DeathDate /*EffectiveDiscontinuationDate/*);
			
						--DROP INDEX CT_PatientStatus ON [ODS].[dbo].[CT_PatientStatus] ;
						---Remove any duplicate from [ODS].[dbo].[CT_PatientStatus] 
						WITH CTE AS   
							(  
								SELECT [PatientPK],[SiteCode],ExitDate,PatientUnique_ID,PatientStatusUnique_ID,ROW_NUMBER() 
								OVER (PARTITION BY [PatientPK],[SiteCode],ExitDate ,PatientUnique_ID,PatientStatusUnique_ID
								ORDER BY [PatientPK],[SiteCode],ExitDate,PatientUnique_ID,PatientStatusUnique_ID) AS dump_ 
								FROM [ODS].[dbo].[CT_PatientStatus] 
								)  
			
					DELETE FROM CTE WHERE dump_ >1;

			
	END
