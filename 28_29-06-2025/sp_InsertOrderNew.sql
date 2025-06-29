Alter procedure sp_InsertOrderNew 
As 
Begin 
	Begin transaction tr_NewTrans
	Begin try
		Insert into tbl_CategoryMaster(Category_Name)
		values('Universe')

		Insert into tbl_OrderMaster(Order_Id,Subcategory_Id)
		values(7,'Weltec')

		commit transaction tr_NewTrans
	End try
	Begin catch
		Rollback transaction tr_NewTrans

		print('Data not inserted')
	End catch
End 

Select * from tbl_CategoryMaster
Select * from tbl_OrderMaster

Exec sp_InsertOrderNew
