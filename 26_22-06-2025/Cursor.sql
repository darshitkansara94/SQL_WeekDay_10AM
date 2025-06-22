Cursor :
	Cursor is used to get a row by row data.
	It will affect the performance of retrieving data.
	To fetch all the rows from table we need to use while loop.


	-- Syntax :
		Declare cursor_name Cursor
			for Select_Statement
			Open cursor_name
				fetch next from cursor_name into variable
			Close cursor_name

		Deallocate cursor_name

	-- Example :
		Select * from tbl_CategoryMaster

		-- Single value retrieval
		Declare @CategoryName nvarchar(50)

		Declare cr_Category Cursor
			For Select Category_Name from tbl_CategoryMaster

			Open cr_Category
				Fetch next from cr_Category into @CategoryName

				print(@CategoryName)
			Close cr_Category

		Deallocate cr_Category

		------------------------------------
		Declare @CategoryName nvarchar(50)
		Declare @CategoryId int

		Declare cr_Category Cursor
			For Select Category_Id,Category_Name from tbl_CategoryMaster

			Open cr_Category
				Fetch next from cr_Category into @CategoryId,@CategoryName

				print(cast(@CategoryId as nvarchar(10)) + ' ' + @CategoryName)
			Close cr_Category

		Deallocate cr_Category

		-- Fetch multiple rows
		Declare @CategoryName nvarchar(50)
		Declare @Category_Id int

		Declare cr_AllData Cursor
			for Select Category_Id,Category_Name from tbl_CategoryMaster
			Open cr_AllData
				fetch next from cr_AllData into @Category_Id,@CategoryName

				print(cast(@Category_Id as nvarchar(10)) + ' | ' + @CategoryName)

				While @@FETCH_STATUS = 0
				Begin
					fetch next from cr_AllData into @Category_Id,@CategoryName
					if(@Category_Id = 5)
					Begin
						break
					End

					print(cast(@Category_Id as nvarchar(10)) + ' | ' + @CategoryName)
				End

			Close cr_AllData
		Deallocate cr_AllData