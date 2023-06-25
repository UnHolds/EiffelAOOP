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
	subway: SUBWAY
	make(startPos: POSITION asubway: SUBWAY)
		do
			position := startPos
			subway := asubway
		end

	getSubway: SUBWAY
		do
			Result := subway
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
