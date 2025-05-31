View :
	View is use to create a virtual table in memory.
	This table is physically not exist in out database or we can not see in our DB.
	This table is behave like a normal table but we can not add or alter column in
		virtual table.
	We can combine one or more table and return as a single table.
	We can retrieve data from view using select statement.

	-- Syntax :
		Create view vw_name as
		Select Statement

	-- Example :
		Select * from tbl_Category

		Create view vw_CategoryTable as
		Select * from tbl_Category

		-- Get data from view
		Select Category_Name from vw_CategoryTable
		Where Category_Id = 1

		-- Add multiple table in single view

		SELECT * FROM tbl_Category
		SELECT * FROM tbl_SubCategory

		INSERT INTO tbl_Category(Category_Id,Category_Name)
		VALUES(2,'Laptop')

		SELECT TC.Category_Name,TS.Subcategory_Name FROM tbl_Category TC
		INNER JOIN tbl_SubCategory TS
		ON TC.Category_Id = TS.Category_Id

		Create view vw_CategoryAndSubCategoryTable as
		SELECT TC.Category_Id as CategoryId,TC.Category_Name,TS.Category_Id,TS.Subcategory_Id ,
		TS.Subcategory_Name,ts.Subcategry_Price
		FROM tbl_Category TC
		INNER JOIN tbl_SubCategory TS
		ON TC.Category_Id = TS.Category_Id

		Select * from vw_CategoryAndSubCategoryTable

		--Create Table  tbl_OrderMaster(
		--Order_Id int IDENTITY(1,1) primary key,
		--Subcategory_Id INT  Foreign key (subcategory_Id)References Tbl_subcategory(subcategory_id),
		--Order_QTY INT ,
		--Order_price Decimal(18,2));
		
		select*from tbl_OrderMaster

		alter table tbl_OrderMaster
		add  Subcategory_Id INT  Foreign key (subcategory_Id)References Tbl_subcategory(subcategory_id);
		
		
		update tbl_OrderMaster set Subcategory_id = 7 where Order_Name = 'iphone 15' 

		insert into tbl_SubCategory(Category_Id,Subcategory_Id,Subcategory_Name,Subcategry_Price)
		values (1,7,'iphone15',250000);
		select * from tbl_SubCategory