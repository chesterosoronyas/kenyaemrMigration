

select p.PersonId as Person_Id ,pmv.VisitDate as Encounter_Date,NULL as Encounter_ID
,(select lm.[Name] from LookupMaster lm where lm.Id=pe.ExaminationTypeId) as ExaminationType
,(select [Name] from LookupItem where Id=pe.ExamId)Exam,
(select [Name] from LookupItem where Id=pe.FindingId)Finding,
pe.CreateDate,pe.CreateBy as CreatedBy,pe.DeleteFlag as voided  from PhysicalExamination pe
inner join Patient p on p.Id=pe.PatientId
inner join PatientMasterVisit pmv on pmv.Id=pe.PatientMasterVisitId
where ExaminationTypeId=(select top 1 Id from lookupmaster where Name = 'GeneralExamination')