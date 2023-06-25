note
	description: "Summary description for {HOLE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	HOLE

inherit
	ENTITY
		rename
			make as makeEntity
		redefine
			draw
		end


create
	make

feature
	make(startPos: POSITION)
		do
			position := startPos
		end

	draw(pos:POSITION):BOOLEAN
		do
			Result := false
			if position.isEqual(pos) then
				print("O")
				Result := true
			end
		end
end
