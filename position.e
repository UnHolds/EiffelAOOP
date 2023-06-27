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
		require
			x > 0 and y > 0
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

	isEqual(pos: POSITION): BOOLEAN
		require
			pos.getx > 0 and pos.gety > 0
		do
			Result := (xPos = pos.getX and yPos = pos.getY)
		end

	distance(pos: POSITION): INTEGER
		require
			pos.getx > 0 and pos.gety > 0
		do
			Result := ((xPos - pos.getx).abs + (yPos - pos.gety).abs)
		end

end
