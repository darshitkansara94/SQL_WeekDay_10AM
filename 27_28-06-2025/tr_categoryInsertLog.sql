Alter trigger tr_categoryInsertLog
On tbl_categoryMaster
For update
As
Begin
	Declare @CategoryName nvarchar(50)
	Declare @ModifiedDate datetime

	Select @CategoryName = Category_Name from inserted
	Select @ModifiedDate = Modified_Date from inserted

	Insert into tbl_Log(Log_Description,Log_Date)
	Values(CONCAT_Ws(' ','Data updated for catgeory with category name',@CategoryName,
	'Modified on',@ModifiedDate),GETDATE())
End

Select * from tbl_CategoryMaster
Select * from tbl_log

Insert into tbl_CategoryMaster(Category_Name,Modified_Date) values('Xiomi',GETDATE())