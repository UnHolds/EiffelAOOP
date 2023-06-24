note
	description: "CatAndMouseGame application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS_32

create
	make

feature {NONE} -- Initialization

	gameboard: GAMEBOARD
	make
			-- Run application.
		do
			--| Add your code here
			create gameboard.make
		end

	read_char: CHARACTER
        -- Read a character from a console without waiting for Enter.
    external "C inline use <conio.h>"
        alias "return getch ();"
    end

end
