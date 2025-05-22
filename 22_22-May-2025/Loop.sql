Loop :
	Loop is use to iterate code.
	It executes code until the condition is false.
	
	-- Syntax :
		While condition
		Begin
			-- Code
		End

	-- Example :
		Declare @Num as int = 5

		While 0 < @Num
		Begin
			print(@Num)

			Set @Num = @Num - 1
		End

		Declare @Num as int = 5

		While 0 < @Num
		Begin
			Set @Num = @Num - 1
			
			print(@Num)
		End

		4,3,2,1,0


		1. 0 < 5 = true
			o/p = 5
		2. 0 < 4 = true
			o/p = 4
		3. 0 < 3 = true
			o/p = 3
		4. 0 < 2 = true
			o/p = 2
		5. 0 < 1 = true
			o/p = 1
		6 0 < 0 = false
			exit

		Declare @Num1 as int = 0
		Declare @Num2 as int = 5

		While @Num1 <= @Num2
		Begin
			print (@Num1)

			Set @Num1 = @Num1 + 1
		End

		-------------------------------------
		Create table
			Test_Id (PK, Identity)
			Test_Name - ABC-1
						ABC-2
						ABC-3
						ABC-4
						ABC-5



