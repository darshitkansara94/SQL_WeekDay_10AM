Transaction :
	Transaction is use to manage the execution in sql.
	Transaction is applied only on DML(Insert/ Update and Delete) operation.
	It is used when we want to perform operation with the dependency.

	Commit :
		Commit make sure that data is successfully inserted and on permenant basis.
		Once commit is done we can not rollback / reverse data.

		-- Syntax :
			Begin transaction tr_name
			Commit transaction tr_name

	Rollback :
		Rollback reverse all the entries that is performed from previous SQL statement.

		-- Syntax :
			Begin transaction tr_name
			Rollback transaction tr_name

	-- Example :
		Select * from tbl_RegistartionMaster

		Begin transaction tr_Reg
			Insert into tbl_RegistartionMaster(Reg_EmailId,Reg_FirstName,Reg_LastName)
			values('abc@gmail.com','A','B')

		commit transaction tr_Reg

		Begin transaction tr_Reg_rollback
			Insert into tbl_RegistartionMaster(Reg_EmailId,Reg_FirstName,Reg_LastName)
			values('abc@gmail.com','E','F')

		rollback transaction tr_Reg_rollback

	-- Error Handling :
		Error handling handles the sql error and developer can display that error 
			by custom message.
		It is used when we are doing transaction , mthemetical operation
			or some complicated logics.

		-- Syntax :
			Begin try
				-- Your logic
			End try
			Begin catch
				-- Error handle here
			End catch

		-- Example :
			Begin try
				Select 15/3 as division

				print('try block')
			End try
			Begin catch
				print('Divide by zero is not possible')
			End catch