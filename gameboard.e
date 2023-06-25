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

	mainLoop
		do

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
		do
			create pos.make (x, y)
			wasDrawn := cat.draw (pos)
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
		do
			xSize := 100
			ySize := 25
			won := false
			lost := false
			create catStartPos.make(xSize//2, ySize//2)
			create cat.make(catStartPos)
			draw
		end
end
