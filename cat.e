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
	maxX: INTEGER
	maxY: INTEGER

	make(startPos: POSITION amaxX: INTEGER amaxY: INTEGER)
		require
			startPos.getx > 1 and startPos.gety > 1 and startPos.getx < amaxX and startPos.gety < amaxY
		do
			makeEntity(startPos)
			maxX := amaxX
			maxY := amaxY
			create input.make2
			input.launch
		end

	draw(pos:POSITION):BOOLEAN
		require else
			pos.getx > 1 and pos.gety > 1 and pos.getx < maxX and pos.gety < maxY
		do
			Result := false
			if position.isEqual(pos) then
				print("C")
				Result := true
			end
		end

	move
		require
			position.getx > 1 and position.gety > 1 and position.getx < maxX and position.gety < maxY
		local
			newPos: POSITION
			keyPress: CHARACTER
		do
			keyPress := input.getKeyPress
			create newPos.make (position.getx, position.gety)
			if keyPress = 'w' or keyPress = 'W' then
				create newPos.make (position.getx, position.gety - 1)
			end
			if keyPress = 's' or keyPress = 'S' then
				create newPos.make (position.getx, position.gety + 1)
			end
			if keyPress = 'a' or keyPress = 'A' then
				create newPos.make (position.getx - 1, position.gety)
			end
			if keyPress = 'd' or keyPress = 'D' then
				create newPos.make (position.getx + 1, position.gety)
			end

			if newPos.getx > 1 and newPos.gety > 1 and newPos.getx < maxX and newPos.gety < maxY then
				position := newPos
			end
		ensure
			position.getx > 1 and position.gety > 1 and position.getx < maxX and position.gety < maxY
		end
end
