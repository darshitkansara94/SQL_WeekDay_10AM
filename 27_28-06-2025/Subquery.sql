Subquery :
	Subquery is when we write a sql statement inside one statement.
	In this we have main query and inner query.
	We can implement this in select statement.
	We have two types of subquery which is most commonly used.
	When our main table output is depend on any other table then we can use subquery.
		
		Within select statement
		With where clause

	-- Syntax :
		-- With where clause
			Select columnName1,columnname2... from tbl_name
			where columnname operator (Select columnName from tbl_name)

		-- Within select statement
			Select columnname,(Select columnname from tbl_name) as aliasname
				from tbl_name

	-- Example :
		Select * from tbl_CategoryMaster
		Select * from tbl_OrderMaster

		Select Category_Id,Category_Name from tbl_CategoryMaster 
		where Category_Id in (1,2,1,5)

		Select Category_Id,Category_Name from tbl_CategoryMaster 
		where Category_Id not in (1,2,5)

		Select Category_Id,Category_Name from tbl_CategoryMaster
		Where Category_Id in (Select Category_Id from tbl_OrderMaster)

		Select Category_Id,Category_Name from tbl_CategoryMaster
		Where Category_Id not in (Select Category_Id 
		from tbl_OrderMaster)

		Insert into tbl_OrderMaster(Category_Id) values(10)

		-- Within Select statement
		Select Category_Id,Category_Name,
		(Select count(*) from tbl_OrderMaster 
			where Category_Id = tbl_CategoryMaster.Category_Id) as Total_Order
		from tbl_CategoryMaster


		Select
		tbl_CategoryMaster.category_Id, tbl_CategoryMaster.Category_Name,
		Count(*) as Total_Order
		from tbl_OrderMaster
		Right join tbl_CategoryMaster 
			on tbl_CategoryMaster.Category_Id = tbl_OrderMaster.Category_Id
		group by 
			tbl_CategoryMaster.category_Id, tbl_CategoryMaster.Category_Name
