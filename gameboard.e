note
	description: "Summary description for {GAMEBOARD}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	GAMEBOARD

create
	make

feature --init

	xSize: INTEGER
	ySize: INTEGER
	cat: CAT
	won: BOOLEAN
	lost: BOOLEAN
	random: RANDOM
	mice: ARRAYED_LIST[MOUSE]
	subways: ARRAYED_LIST[SUBWAY]
	score: INTEGER


	moveMice
		local
			mouse: MOUSE
		do
			from
				mice.start
			until
				mice.exhausted
			loop
				mice.item.move
				mice.forth
			end
		end

	checkEat
		local
			mouse: MOUSE
			newMice: ARRAYED_LIST[MOUSE]
		do
			create newMice.make(0)
			from
				mice.start
			until
				mice.exhausted
			loop
				if mice.item.getPosition.isEqual(cat.getposition) = false or mice.item.visable = false then
					newMice.extend(mice.item)
				else
					score := score + 1
				end
				mice.forth
			end

			mice := newMice
		end


	mainLoop
		do
			clear
			checkEat
			cat.move
			moveMice
			draw
		end

	hasWon: BOOLEAN
		do
			Result := won
		end

	hasLost: BOOLEAN
		do
			Result := lost
		end

	clear
		external "C inline use <stdlib.h>"
	        alias "system(%"cls%");"
	    end

	checkDrawItem (x: INTEGER y: INTEGER) : BOOLEAN
		require
			x > 1 and x < xSize and y > 1 and y < ySize
		local
			pos: POSITION
			wasDrawn : BOOLEAN
			holes: ARRAYED_LIST[HOLE]
		do
			create pos.make (x, y)
			wasDrawn := cat.draw (pos)

			from
				mice.start
			until
				wasDrawn or mice.exhausted
			loop
				wasDrawn := mice.item.draw(pos)
				mice.forth
			end

			from
				subways.start
			until
				wasDrawn or subways.exhausted
			loop
				holes := subways.item.getHoles
				from
					holes.start
				until
					wasDrawn or holes.exhausted
				loop
					wasDrawn := holes.item.draw(pos)
					holes.forth
				end
				subways.forth
			end

			Result := wasDrawn
		end

	drawWinScreen
		do
			clear
			print(" __     __           _                       %N")
 			print(" \ \   / /          | |                      %N")
  			print("  \ \_/ /__  _   _  | |__   __ ___   _____   %N")
   			print("   \   / _ \| | | | | '_ \ / _` \ \ / / _ \  %N")
    		print("    | | (_) | |_| | | | | | (_| |\ V /  __/  %N")
    		print("    |_|\___/ \__,_| |_|_|_|\__,_| \_/ \___|  %N")
		    print("         __          ______  _   _           %N")
		    print("         \ \        / / __ \| \ | |          %N")
		    print("          \ \  /\  / / |  | |  \| |          %N")
		    print("           \ \/  \/ /| |  | | . ` |          %N")
		    print("            \  /\  / | |__| | |\  |          %N")
		    print("             \/  \/   \____/|_| \_|          %N")

		end

	drawLoseScreen
		do
			clear
			print(" __     __           _                         %N")
			print(" \ \   / /          | |                        %N")
  			print("  \ \_/ /__  _   _  | |__   __ ___   _____     %N")
  			print("   \   / _ \| | | | | '_ \ / _` \ \ / / _ \    %N")
		  	print("    | | (_) | |_| | | | | | (_| |\ V /  __/    %N")
			print("    |_|\___/ \__,_| |_| |_|\__,_| \_/ \___|    %N")
			print("         _      ____   _____ _______           %N")
			print("        | |    / __ \ / ____|__   __|          %N")
			print("        | |   | |  | | (___    | |             %N")
			print("        | |   | |  | |\___ \   | |             %N")
			print("        | |___| |__| |____) |  | |             %N")
			print("        |______\____/|_____/   |_|             %N")

		end

	draw
		do
			print("SCORE: ")
			print(score)
			print("%N")
			across 1 |..| ySize as yc loop
				across 1 |..| xSize as  xc loop
					if xc.item = 1 or yc.item = 1 or xc.item = xSize or yc.item = ySize then
						print("#")
					else
						if checkDrawItem(xc.item, yc.item) = false then
							print(" ")
						end
					end
				end
				print("%N")
			end
		end

	make
		local
			catStartPos: POSITION
			pos: POSITION
			mouse: MOUSE
			x: INTEGER
			y: INTEGER
			subway: SUBWAY
			isGoal: BOOLEAN
		do
			xSize := 100
			ySize := 25
			won := false
			lost := false
			score := 0

			create random.make
			create mice.make (0)

			create catStartPos.make(xSize//2, ySize//2)
			create cat.make(catStartPos, xSize, ySize)

			across 1 |..| 5 as yc loop
				random.forth
				x := ((random.item \\ (xSize - 2)) + 2)
				random.forth
				y := ((random.item \\ (ySize - 2)) + 2)
				create pos.make (x, y)
				create mouse.make(pos)
				mice.extend(mouse)
			end

			create subways.make(0)
			across 1 |..| 3 as yc loop
				random.forth
				if yc.item = 1 then
					isGoal := true
				else
					isGoal := false
				end
				create subway.make(xSize, ySize, random.item \\ 128, isGoal)
				subways.extend(subway)
			end

			draw
		end
end
