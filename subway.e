note
	description: "Summary description for {SUBWAY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	SUBWAY

create
	make

feature

	holes: ARRAYED_LIST[HOLE]
	mice: ARRAYED_LIST[MOUSE]
	goalSubway: BOOLEAN
	lastCatPos: POSITION

	make(xSize:INTEGER ySize: INTEGER seed:INTEGER isGoal: BOOLEAN)
		local
			time: TIME
			random: RANDOM
			numHoles: INTEGER
			x: INTEGER
			y: INTEGER
			hole: HOLE
			pos: POSITION
		do
			goalSubway := isGoal
			create time.make_now
			create mice.make(0)
			create random.set_seed (time.milli_second + 16576 + time.minute + seed)
			random.forth
			numHoles := (random.item \\ 4) + 2
			create holes.make(0)
			create lastCatPos.make (100, 100)
			across 1 |..| numHoles as yc loop
				random.forth
				x := ((random.item \\ (xSize - 2)) + 2)
				random.forth
				y := ((random.item \\ (ySize - 2)) + 2)
				create pos.make (x, y)
				create hole.make(pos, Current)
				holes.extend(hole)
			end

		end

	getMice: ARRAYED_LIST[MOUSE]
		do
			Result := mice
		end

	getHoles: ARRAYED_LIST[HOLE]
		do
			Result := holes
		end

	enter(mouse:MOUSE catPos:POSITION)
		require
			catPos.getx > 1 and catPos.gety > 1
		do
			mouse.setVisable(false)
			mice.extend(mouse)
			lastCatPos := catPos
		end

	exit(mouse: MOUSE): POSITION
		do
			mouse.setVisable(true)
			mice.prune(mouse)
			Result := findExitHole
		end

	findExitHole: POSITION
		local
			bestHolePos: POSITION
		do
			bestHolePos := lastCatPos
			from
				holes.start
			until
				holes.exhausted
			loop
				if
					holes.item.getposition.distance(lastCatPos) > bestHolePos.distance(lastCatPos)
				then
					bestHolePos := holes.item.getposition
				end
				holes.forth
			end

			Result := bestHolePos
		end

end
