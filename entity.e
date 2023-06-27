note
	description: "Summary description for {ENTITY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ENTITY

inherit
	DRAWABLE

create
	make

feature

	position: POSITION

	make(startPos: POSITION)
		require
				startPos.getx > 1 and startPos.gety > 1
		do
			position := startPos
		end

	getPosition: POSITION
		do
			Result := position
		end

end
