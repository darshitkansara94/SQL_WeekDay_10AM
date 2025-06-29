Alter procedure sp_InsertOrderNew_Positive
(
	@Category_Name nvarchar(50),
	@Subcategory_Id int
)
As 
Begin 
	Begin transaction tr_NewTrans
	Begin try
		Insert into tbl_CategoryMaster(Category_Name)
		values(@Category_Name)

		Insert into tbl_OrderMaster(Subcategory_Id)
		values(@Subcategory_Id)

		commit transaction tr_NewTrans

		print('Execution is done')
	End try
	Begin catch
		Rollback transaction tr_NewTrans

		print('Data not inserted')
	End catch
End 

Select * from tbl_CategoryMaster
Select * from tbl_OrderMaster

Exec sp_InsertOrderNew_Positive @Category_Name = 'Table',@Subcategory_Id = 1