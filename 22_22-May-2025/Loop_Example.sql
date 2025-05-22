-- Procedure
-- Concat function
-- Convert
-- While

Create table tbl_Test
(
	Test_Id int primary key identity(1,1),
	Test_Name nvarchar(20)
)

Create procedure sp_TestInsert
(
	@Test_Name nvarchar(20)
)
As
Begin
	Insert into tbl_Test(Test_Name)
	values(@Test_Name)
End

------- While statement
Declare @Num1 as int = 1
Declare @Num2 as int = 5

While @Num1 <= @Num2
Begin
	--Exec sp_TestInsert
	--	@Test_Name = concat_ws('-','ABC',@Num1)

	Exec sp_TestInsert
		@Test_Name = 'ABC -' + Cast(@Num1 as nvarchar(2))

	Set @Num1 = @Num1 + 1
End