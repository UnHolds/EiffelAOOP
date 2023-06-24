note
	description: "Summary description for {CAT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CAT

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

	input: KEYINPUT

	make(startPos: POSITION)
		do
			position := startPos
			create input.make2
			input.launch
		end

	draw(pos:POSITION):BOOLEAN
		do
			Result := false
			if position.isEqual(pos) then
				print("C")
				Result := true
			end
		end


end
