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

	make(xSize:INTEGER ySize: INTEGER seed:INTEGER)
		local
			time: TIME
			random: RANDOM
			numHoles: INTEGER
			x: INTEGER
			y: INTEGER
			hole: HOLE
			pos: POSITION
		do
			create time.make_now
			create random.set_seed (time.milli_second + 16576 + time.minute + seed)
			random.forth
			numHoles := (random.item \\ 4) + 2
			create holes.make(0)
			across 1 |..| numHoles as yc loop
				random.forth
				x := ((random.item \\ (xSize - 2)) + 2)
				random.forth
				y := ((random.item \\ (ySize - 2)) + 2)
				create pos.make (x, y)
				create hole.make(pos)
				holes.extend(hole)
			end
		end

	getHoles: ARRAYED_LIST[HOLE]
		do
			Result := holes
		end

end
