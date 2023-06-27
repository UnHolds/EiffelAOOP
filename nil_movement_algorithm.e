note
	description: "Summary description for {NIL_MOVEMENT_ALGORITHM}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	NIL_MOVEMENT_ALGORITHM

inherit
	MOVEMENT_ALGORITHM

create
	make

feature



	make
		do

		end

	move: POSITION
		require else
			false
		local
			pos: POSITION
		do
			create pos.make(-1, -1)
			Result := pos
		ensure then
			true
		end

end
