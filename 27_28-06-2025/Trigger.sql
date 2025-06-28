Trigger :
	Trigger is special type of code which perform some operation / event.
	This event we can perform on table.
	We can not execute trigger only. We need to execute trigger through tbale always.
	Trigger does not accept any parameter.
	When we have dependent data / we need to maintain history in that case we can use 
		trigger.
	We have two types of trigger For and after.
	In a single trigger we can create for Insert or update or delete.


	-- Syntax :
		-- For trigger
			Create trigger tr_Name
			on tbl_name -- Execute when any modification is happen in this table
			For Insert/Update/Delete -- Type of Operation perform on table
			As
			Begin
				-- Code here
			End

		-- After trigger
			Create trigger tr_name
			on tbl_name
			After Insert/Update/ Delete
			As
			Begin
				-- Code here
			End

	