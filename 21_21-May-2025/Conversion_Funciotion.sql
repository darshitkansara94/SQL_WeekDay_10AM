-- Date Style Format : https://www.mssqltips.com/sqlservertip/1145/date-and-time-conversions-using-sql-server/

Conversion Functions
	Conversion function is useto convert value from one datatype to another datatype.

	-- Two types of conversion function
		-- Convert
			Convert function convert one datatype to mentioned datatype.

			-- Syntax :
				Convert(new_datatype,value,type_of_value)

			-- Example :
				Select GETDATE()

				Select CONVERT(nvarchar(30),GETDATE(),106) as CurrentDate

				Select Banner_Id,Company_Id,Created_Date ,
				convert(nvarchar(30),Created_Date,105)
				from tbl_BannerMaster

				Select Banner_Id,Created_Date ,
				convert(nvarchar(30),Created_Date,105),
				convert(nvarchar(2),Company_Id) as Company_Id
				from tbl_BannerMaster

				Update tbl_BannerMaster set
					Created_Date = convert(nvarchar(30),Created_Date,105)



				Select * from tbl_CategoryMaster

				Select Category_Name, 
				CONVERT(int,Category_Name) as category_name_int
				from tbl_CategoryMaster

				Select CONCAT(Category_Id,Category_Name) from tbl_CategoryMaster

				Select CONVERT(nvarchar(2),Category_Id) + Category_Name 
				from tbl_CategoryMaster



		-- Cast