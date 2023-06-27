note
	description: "Summary description for {DIRECT_MOVEMENT_ALGORITHM}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	DIRECT_MOVEMENT_ALGORITHM

inherit
	MOVEMENT_ALGORITHM

create
	make

feature

	mouse: MOUSE
	subways: ARRAYED_LIST[SUBWAY]
	isInSub: BOOLEAN
	time: TIME
	waitTime: DURATION
	residingSubway: SUBWAY
	goalHole: HOLE
	random: RANDOM
	cat: CAT


	make(m: MOUSE s: ARRAYED_LIST[SUBWAY] rs: SUBWAY seed: INTEGER c: CAT)
		require else
			s.count > 1
		do
			mouse := m
			subways := s
			create random.set_seed(seed)
			random.forth
			create time.make_by_fine_seconds(4 + (random.item \\ 4))
			random.forth
			waitTime := time.duration
			create time.make_now
			residingSubway := rs
			chooseGoalHole
			cat := c
		ensure then
			mouse = m and residingSubway = rs and cat = c
		end


	move: POSITION
		require else
			mouse.getposition.getx > 1 and mouse.getposition.gety > 1
		local
			pos: POSITION
			currentTime: TIME
			timeDiff: DURATION
			xdiff: INTEGER
			ydiff: INTEGER
		do
			pos := mouse.getposition
			Result := pos
			if isInSub then
				create currentTime.make_now
				timeDiff := (currentTime - time).duration
				if timeDiff.is_greater_equal(waitTime) and residingSubway.goalSubway = false then
					Result := residingSubway.exit(mouse)
					chooseGoalHole
					isInSub := false
				end
			else
				-- move mouse to hole
				xdiff := (goalHole.getposition.getx - mouse.getposition.getx)
				ydiff := (goalHole.getposition.gety - mouse.getposition.gety)
				if xdiff.abs > ydiff.abs then
					if xdiff > 0 then
						create pos.make(mouse.getposition.getx + 1, mouse.getposition.gety)
					else
						create pos.make(mouse.getposition.getx - 1, mouse.getposition.gety)
					end
				else
					if ydiff > 0 then
						create pos.make(mouse.getposition.getx, mouse.getposition.gety + 1)
					else
						create pos.make(mouse.getposition.getx, mouse.getposition.gety - 1)
					end
				end
				Result := pos

				-- check if mouse is on goal hole and if so eat into hole
				if mouse.getposition.isequal(goalHole.getposition) then
					residingSubway := goalHole.getsubway
					residingSubway.enter(mouse, cat.getposition)
					isInSub := true
					create time.make_now
				end
			end
		end

	chooseGoalHole
		require
			subways.count > 1
		local
			holes: ARRAYED_LIST[HOLE]
		do
			create holes.make(0)

			from
				subways.start
			until
				subways.exhausted
			loop
				holes.append(subways.item.getholes)
				subways.forth
			end

			random.forth
			goalHole := holes.i_th((random.item \\ (holes.count - 1)) + 1)
		end

end
