Create trigger tr_Insert_A
On tbl_A
for Insert
As
Begin
	Declare @AName nvarchar(50)

	Select @AName = A_Name from inserted

	print(@Aname)
End

Insert into tbl_A(A_Id,A_Name,A_Address)
values(7,'A','Bihar2')