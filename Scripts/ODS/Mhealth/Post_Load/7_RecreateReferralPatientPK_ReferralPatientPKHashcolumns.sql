/* Renaming ReferralPK column coming from mhealth to UshauriReferralPK for the purpose of matching patient from C&T to  ones coming from ushauri. */
BEGIN


		IF EXISTS (SELECT * FROM sys.columns      /* 1st if confirms if the ReferralPK column exists on [ODS].[dbo].[Ushauri_PatientReferral] exists on ODS   */
					WHERE Name = N'ReferralPK' 
					AND Object_ID = Object_ID(N'[ODS].[dbo].[Ushauri_PatientReferral]'))
		BEGIN
			  IF  NOT EXISTS (SELECT *					/* If above condition is met, check if Ushauri_PatientReferral exists. If it exists escape. If it doesn't exist create it*/
							 FROM   INFORMATION_SCHEMA.COLUMNS
							 WHERE  TABLE_NAME = 'Ushauri_PatientReferral'
							 AND COLUMN_NAME = 'UshauriReferralPK') 

					BEGIN
						EXEC sp_rename '[ODS].[dbo].[Ushauri_PatientReferral].ReferralPK', 'UshauriReferralPK', 'COLUMN';
					END

		END


		IF EXISTS (SELECT * FROM sys.columns      /* 1st if confirms if the ReferralPKHash column exists on [ODS].[dbo].[Ushauri_PatientReferral] exists on ODS   */
				WHERE Name = N'ReferralPKHash' 
				AND Object_ID = Object_ID(N'[ODS].[dbo].[Ushauri_PatientReferral]'))
		BEGIN
			  IF  NOT EXISTS (SELECT *					/* If above condition is met, check if Ushauri_PatientReferral exists. If it exists escape. If it doesn't exist create it*/
							FROM   INFORMATION_SCHEMA.COLUMNS
							WHERE  TABLE_NAME = 'Ushauri_PatientReferral'
							AND COLUMN_NAME = 'UshariReferralPKHash') 

					BEGIN
						EXEC sp_rename '[ODS].[dbo].[Ushauri_PatientReferral].ReferralPKHash', 'UshauriReferralPKHash', 'COLUMN';
					END

		END
		
		IF NOT EXISTS (
			  SELECT
				*
			  FROM
				INFORMATION_SCHEMA.COLUMNS
			  WHERE
				TABLE_NAME = 'Ushauri_PatientReferral' AND COLUMN_NAME = 'ReferralpatientPK')
			BEGIN
			  ALTER TABLE [ODS].[dbo].[Ushauri_PatientReferral]
				ADD ReferralpatientPK int NULL
			END;

		IF NOT EXISTS (
			  SELECT
				*
			  FROM
				INFORMATION_SCHEMA.COLUMNS
			  WHERE
				TABLE_NAME = 'Ushauri_PatientReferral' AND COLUMN_NAME = 'ReferralPatientPKHash')
			BEGIN
			  alter table [ODS].[dbo].[Ushauri_PatientReferral]
					add ReferralPatientPKHash nvarchar(150) null
			END;

END