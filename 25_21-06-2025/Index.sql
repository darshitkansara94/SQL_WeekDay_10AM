Index :
	Index is use to retrieve record fast.
	By creating multiple index can slow down Insert, Update
		 and Delete operation.
	
	Types of Index :
		Clustered Index :
			We can create only one clustered index per table.
			By default PK will create clustered index itself.
			Clustered index follow the key sorting algorithm.

			-- Syntax :
				Create clustered index idx_Name
				on tbl_Name(column_name)

			-- Example
				Create clustered index idx_AID
				on tbl_A(A_Id)

		NonClustered index :
			NonClustered index we can create multiple on single table.
			It follows tree structure.
			It always regenerate new tree structure while we perform DML
				operation and due to that DML operation can be slowdown.

			-- Syntax :
				Create nonclustered index idx_name
				on tbl_Name (column_name)

			-- Example :
				Create nonclustered index idx_Name
				on tbl_A(A_name)

			-- Unique index :
				Unique index make sure that data is unique for that column.
				If we have already duplicate data available in that column
					first we need to correct and then we can create unique index.

				-- Syntax :
					Create unique nonclustered index idx_name
					on tbl_name(column_name)

				-- Example :
					Select * from tbl_A

					Insert into tbl_A(A_Id,A_Name,A_Address)
					values(5,'xyz','Ahmedabad')

					Create unique nonclustered index idx_Address
					on tbl_A(A_Address)

					Update tbl_A set
					A_Address = 'Baroda' where A_Id = 5

					Insert into tbl_A(A_Id,A_Name,A_Address)
					values(6,'xyz','Ahmedabad')

					Update tbl_A set
					A_Address = 'Ahmedabad' where A_Id = 5
					
				-- Filtered index :
					Filtered index use when we need to write condition
						with the index.
					It will check value for the data that is return by condition

					-- Syntax :
						Create nonclustered index idx_name
						on tbl_name(column_name)
						Where condition

					-- Example :
						Select * from tbl_CategoryMaster
						
						insert into tbl_CategoryMaster(Category_Name,IsDeleted)
						VALUES('KEYBOARD',1),
						('MOUSE',1),
						('MOUSE',0),
						('SHOES',0);

						Create unique nonclustered index idx_CategoryName
						on tbl_CategoryMaster(Category_Name) 
						Where IsDeleted = 0

						Insert into tbl_CategoryMaster(Category_Name,IsDeleted)
						values('KEYBOARD',1)

		-- Remove Index
			Remove existing index from table.

			-- Syntax :
				Drop index idx_name on tbl_name

			-- Example :
				Drop index idx_CategoryName on tbl_CategoryMaster
						

						