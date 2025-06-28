Create trigger tr_DeletA
on tbl_A
For delete
As
Begin
	Declare @Aname nvarchar(50)

	Select @Aname= A_Name from deleted

	print(@Aname)
End

select * from tbl_A

Delete from tbl_A where A_Id = 5