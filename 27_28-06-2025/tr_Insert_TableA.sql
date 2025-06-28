Create trigger tr_Insert_TableA
On tbl_A
For Insert
As
Begin
	print('Trigger is executed')
End

select * from tbl_A

Insert into tbl_A(A_Id,A_Name,A_Address)
values(6,'A','Bihar1')

update tbl_A set A_Name = 'ABC' where A_Id = 6