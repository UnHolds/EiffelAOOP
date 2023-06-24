note
	description: "CatAndMouseGame application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	--ARGUMENTS_32
	EXECUTION_ENVIRONMENT

create
	make

feature {NONE} -- Initialization

	gameboard: GAMEBOARD
	make
			-- Run application.
		do
			--| Add your code here
			create gameboard.make
			sleep(10000000000)
		end

end
