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
		do
			mouse := m
			subways := s
			create time.make_by_fine_seconds(5)
			waitTime := time.duration
			create time.make_now
			residingSubway := rs
			create random.set_seed(seed)
			chooseGoalHole
			cat := c
		end

	move: POSITION
		local
			pos: POSITION
			currentTime: TIME
			timeDiff: DURATION
		do
			Result := mouse.getposition

			if isInSub then
				create currentTime.make_now
				timeDiff := (currentTime - time).duration
				if timeDiff.is_greater_equal(waitTime) then
					Result := residingSubway.exit(mouse)
					chooseGoalHole
				end
			else
				-- move mouse to hole

				-- check if mouse is on goal hole and if so eat into hole
				if mouse.getposition.isequal (goalHole.getposition) then
					residingSubway := goalHole.getsubway
					residingSubway.enter(mouse, cat.getposition)
					create time.make_now
				end
			end



			create pos.make(1, 1)
			Result := pos
		end

	chooseGoalHole
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
			goalHole := holes.i_th(random.item \\ holes.count)

		end

end
