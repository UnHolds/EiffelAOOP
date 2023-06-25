note
	description: "Summary description for {MOUSE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MOUSE

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
				print("M")
				Result := true
			end
		end





end
