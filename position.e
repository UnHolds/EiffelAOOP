note
	description: "Summary description for {POSITION}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	POSITION

create
	make

feature

	xPos: INTEGER
	yPos: INTEGER

	make(x: INTEGER y: INTEGER)
		do
			xPos := x
			yPos := y
		end

	getX: INTEGER
		do
			Result := xPos
		end

	getY: INTEGER
		do
			Result := yPos
		end

	isEqual (pos: POSITION): BOOLEAN
		do
			Result := (xPos = pos.getX and yPos = pos.getY)
		end

end
