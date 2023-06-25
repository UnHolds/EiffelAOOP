note
	description: "CatAndMouseGame application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	--ARGUMENTS_32
	EXECUTION_ENVIRONMENT

create
	make

feature {NONE} -- Initialization

	gameboard: GAMEBOARD
	startTime, endTime, initTime: TIME
	duration, loopDuration, gameTimeEnd, gameTime: DURATION
	make
			-- Run application.
		do
			--| Add your code here
			create gameboard.make

			create startTime.make_by_fine_seconds (0.2) --set the loop time here :)
			loopDuration := startTime.duration
			create startTime.make_by_fine_seconds (10.0) --set the game end time
			gameTimeEnd := startTime.duration

			--init variables
			create initTime.make_now
			create startTime.make_now
			create endTime.make_now
			gameTime := startTime.duration - initTime.duration
			duration := endTime.duration - startTime.duration

			from

			until
				gameTime.is_greater_equal(gameTimeEnd) or gameboard.haswon or gameboard.haslost
			loop
				create startTime.make_now

				-- ############### main loop code goes here ####################


				gameboard.mainLoop


				-- ################### end main loop code ######################

				from
					create endTime.make_now
					duration := endTime.duration - startTime.duration
				until
					duration.is_greater_equal(loopDuration)
				loop
					sleep(1000000) -- fry my PC prevention
					create endTime.make_now
					duration := endTime.duration - startTime.duration
				end
				gameTime := startTime.duration - initTime.duration
			end

			if gameTime.is_greater_equal(gameTimeEnd) or gameboard.haswon then
				gameboard.drawWinScreen
			end

			if gameboard.haslost then
				gameboard.drawLoseScreen
			end
		end

end
