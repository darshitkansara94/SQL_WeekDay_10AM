Ranking functions :
	Ranking functions provide ranking functionality to the output or dev can perform some operation based on that.

	-- Types of rankign function :
		Row_number()
			Row number provide sequentia order to the output.

			-- Syntax :
				Select ROW_NUMBER() over(order by columnName asc/desc) as aliasname, columnName,columnNameN
				from tbl_name

			-- Example :
				Select * from tbl_Employee

				Select ROW_NUMBER() over(order by Employee_Name desc) as SRNo,Employee_Name
				from tbl_Employee

				--Insert into tbl_Employee(Employee_Name,Employee_Address,Employee_DOB,Employee_Salary)
				--values('Darshit','Ahmedbad',GETDATE(),65000),('Darshit','Baroda',GETDATE(),55000),
				--('Nikhil','Surat',GETDATE(),75000)

				-- Partition by :
					Partition by is used to provide sequential number for the same record.

					-- Example :
						Select ROW_NUMBER() over(partition by Employee_Name order by Employee_Name desc) as SrNo,Employee_Id,
						Employee_Name from tbl_Employee

						Select * from tbl_Employee

						Select ROW_NUMBER() over(partition by Employee_Name, Employee_Address order by Employee_Name desc) as SrNo,Employee_Id,
						Employee_Name,Employee_Address from tbl_Employee

						create view vw_EmployeeNameDuplicate as
						Select ROW_NUMBER() over(partition by Employee_Name, Employee_Address order by Employee_Name desc) as SrNo,Employee_Id,
						Employee_Name,Employee_Address from tbl_Employee


						Select * from vw_EmployeeNameDuplicate where SrNo > 1
						
						Delete from vw_EmployeeNameDuplicate where srno > 1

		Dense_Rank() :
			Provide sequantial number just like row_number but the key difference is it will provide same sequence number for the column
				mentioned in order by.

			-- Syntax :
				Select DENSE_RANK() over(order by columnName asc/desc) as alias_name, columnName from tbl_name

			-- Example :
				Select DENSE_RANK() over(order by Employee_Id desc) as SrNo, Employee_Id,Employee_Name
				from tbl_Employee

				-- Get nth No of salary
				Create view vw_Employee as
				Select DENSE_RANK() over(order by Employee_Salary desc) as SrNo, Employee_Id,Employee_Name,Employee_Salary
				from tbl_Employee

				Select * from vw_Employee where SrNo = 6