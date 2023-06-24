note
	description: "Summary description for {ENTITY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ENTITY
create
	make

feature

	position: POSITION

	make(startPos: POSITION)
		do
			position := startPos
		end

	getPosition: POSITION
		do
			Result := position
		end

end
