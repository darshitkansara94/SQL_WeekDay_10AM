CTE :
	CTE = Common Table Expression
	CTE is generate temporary table at the time of execution and once execution is completed CTE itself destroy that table.
	CTE is always start with keyword 'with'.


	-- Syntax :
		With cte_name as
		(
			SQL statement
		)

		Select * from cte_Name

	-- Example :
		With cte_Employee as
		(
			Select Employee_Name,Employee_Address,Employee_DOB,Employee_Salary 
			from tbl_Employee
		)

		Select * from cte_Employee

		-- Find nth rank of salary
		With cte_EmployeeSalary as
		(
			Select DENSE_RANK() over(order by Employee_Salary desc) as SrNo, Employee_Name,Employee_Salary
			from tbl_Employee
		)

		Select * from cte_EmployeeSalary where srno = 1

		-- Partion By :
			use ECommerce_DB

			Select * from tbl_A

			Insert into tbl_A(A_Id, A_Name,A_Address)
			values(6,'abc','Baroda')

			with cte_DuplicateRecord as
			(
				Select A_Id,
				ROW_NUMBER() 
				over(partition by A_Name order by A_Name) as SrNo,
				A_Name,A_Address from tbl_A
			)

			Delete from cte_DuplicateRecord where SrNo > 1

			-- With multiple combination
			with cte_DuplicateRecord as
			(
				Select A_Id,
				ROW_NUMBER() 
				over(partition by A_Name, A_Address order by A_Name) as SrNo,
				A_Name,A_Address from tbl_A
			)

			Select * 
			from cte_DuplicateRecord 
			where SrNo > 1