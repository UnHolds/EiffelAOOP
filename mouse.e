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

	visable: BOOLEAN
	algorithm: MOVEMENT_ALGORITHM

	make(startPos: POSITION)
		require
			startPos.getx > 1 and startPos.gety > 1
		local
			algo: NIL_MOVEMENT_ALGORITHM
		do
			position := startPos
			visable := true
			create algo.make
			algorithm := algo
		end

	draw(pos:POSITION):BOOLEAN
		require else
			pos.getx > 1 and pos.gety > 1

		do
			Result := false


			if position.isEqual(pos) and visable then
				print("M")
				Result := true
			end
		end

	move
		do
			position := algorithm.move
		end

	setVisable(vis: BOOLEAN)
		do
			visable := vis
		end

	setAlgorithm(algo:MOVEMENT_ALGORITHM)
		do
			algorithm := algo
		end



end
