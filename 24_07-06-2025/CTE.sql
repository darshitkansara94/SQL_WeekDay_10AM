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