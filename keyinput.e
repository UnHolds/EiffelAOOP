note
	description: "Summary description for {KEYINPUT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	KEYINPUT

inherit
	THREAD

create make2

feature

	lastKeyPressed: CHARACTER
	active: BOOLEAN

	make2
		do
			make
		end

	run
		do
			execute
		end


	execute
		local
			input: STRING
		do
			from
			 	active := true
			until
				active = false
			loop
				print("#")
			end
        end

	read_char: CHARACTER
        -- Read a character from a console without waiting for Enter.
    external "C inline use <conio.h>"
        alias "return getch ();"
    end


end
