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

end
