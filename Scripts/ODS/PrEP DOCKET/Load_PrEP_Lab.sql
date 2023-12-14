
BEGIN

MERGE [ODS].[dbo].[PrEP_Lab] AS a
	USING(SELECT	DISTINCT
	        
			   a.[RefId]
			  ,a.[Created]
			  ,a.[PatientPk]
			  ,a.[SiteCode]
			  ,a.[Emr]
			  ,a.[Project]
			  ,a.[Processed]
			  ,a.[QueueId]
			  ,a.[Status]
			  ,a.[StatusDate]
			  ,a.[DateExtracted]
			  ,a.[FacilityId]
			  ,a.[FacilityName]
			  ,a.[PrepNumber]
			  ,a.[HtsNumber]
			  ,[VisitID]
			  ,[TestName]
			  ,[TestResult]
			  ,[SampleDate]
			  ,[TestResultDate]
			  ,[Reason]
			  ,a.[Date_Created]
			  ,a.[Date_Last_Modified]
		FROM [PREPCentral].[dbo].[PrepLabs](NoLock) a
			inner join (select tn.PatientPK,tn.SiteCode,tn.PrepNumber,max(tn.Created)MaxCreated FROM [PREPCentral].[dbo].[PrepLabs](NoLock)tn
						GROUP BY tn.PatientPK,tn.SiteCode,tn.PrepNumber)tm
			on a.PatientPk = tm.PatientPk and a.SiteCode =tm.SiteCode and a.Created = tm.MaxCreated
		INNER JOIN  [PREPCentral].[dbo].[PrepPatients](NoLock) b	
		ON a.sitecode = b.sitecode
		and a.patientPK = b.patientPK
		and a.[PrepNumber] = b.[PrepNumber]
		)AS b 	 
			ON(
			a.PatientPK  = b.PatientPK						
			and a.SiteCode = b.SiteCode
			and a.PrepNumber = b.PrepNumber
			--and a.ID = b.ID
			) 
	 WHEN NOT MATCHED THEN 
		  INSERT(RefId,Created,PatientPk,SiteCode,Emr,Project,Processed,QueueId,[Status],StatusDate,DateExtracted,FacilityId,FacilityName,PrepNumber,HtsNumber
				,VisitID,TestName,TestResult,SampleDate,TestResultDate,Reason,Date_Created,Date_Last_Modified,LoadDate)  
		  VALUES(RefId,Created,PatientPk,SiteCode,Emr,Project,Processed,QueueId,[Status],StatusDate,DateExtracted,FacilityId,FacilityName,PrepNumber,HtsNumber,
				  VisitID,TestName,TestResult,SampleDate,TestResultDate,Reason,Date_Created,Date_Last_Modified,Getdate())
	  WHEN MATCHED THEN
				UPDATE SET 							
					a.Created = b.Created,				 						
					a.Status=b.Status,
					a.StatusDate=b.StatusDate,					
					a.TestName=b.TestName,
					a.TestResult=b.TestResult,
					a.SampleDate=b.SampleDate,
					a.TestResultDate=b.TestResultDate,
					a.Reason=b.Reason,
					a.Date_Last_Modified=b.Date_Last_Modified;
	END

					