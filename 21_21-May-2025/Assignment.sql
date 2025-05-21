tbl_Student
	Student_Id (PK, Identity)
	Student_Name
	
tbl_StudentDetail
	StudentDetail_Id (PK, Identity)
	Student_Id (FK)
	StudentDetail_Std
	StudentDetail_Marks


-- Store Procedure
Create procedure sp_name
(
	@Type nvarchar(20) = null,
	-- tbl_Student
	@Student_Name nvarchar(20) = null,
	@Student_DOB datetime = null,
	@Student_Address nvarchar(max) = null,
	-- tbl_StudentDetail
	@Student_Id int = null,
	@StudentDetail_Std int = null,
	@StudentDetail_Marks decimal(18,2) = null
)
As
Begin
	If(@Type = 'tbl_Student')
	Begin
		-- Insert into tbl_Student
		Insert into tbl_Student(Student_Name,Student_DOB,Student_Address)
		values(@Student_Name,@Student_DOB,@Student_Address)
	End
	Else
	Begin
		-- Insert into tbl_StudentDetail
		Insert into tbl_StudentDetail(Student_Id,StudentDetail_Std,StudentDetail_Marks)
		values(@Student_Id,@StudentDetail_Std,@StudentDetail_Marks)
	End
End

-- tbl_Student
Exec sp_name
	@Type = 'tbl_Student',
	@Student_Name = 'A',
	@Student_DOB = getdate(),
	@Student_Address =  'Vadodara'

-- tbl_StudentDetail
Exec sp_name
	@Student_Id = 1,
	@StudentDetail_Std = 5,
	@StudentDetail_Marks = 150.25


-- Select Statement
	-- We will use 4 diff topic here
		-- Join
		-- Aggregate Function
		-- Group By
		-- Condition

Select 
	TS.Student_Name,
	SUM(TSD.StudentDetail_Marks) as Marks,
	Case
		When SUM(TSD.StudentDetail_Marks) >= 200 Then 'Grade A'
		When SUM(TSD.StudentDetail_Marks) >= 100 Then 'Grade B'
		Else 'Grade C' End as Grade
from tbl_Student TS
Inner join tbl_StudentDetail TSD
	on TS.Student_Id = TSD.Student_Id
Group by TS.Student_Name