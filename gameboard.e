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

	checkDrawItem (x: INTEGER y: INTEGER) : BOOLEAN
		require
			x > 1 and x < xSize and y > 1 and y < ySize
		do
			Result := false
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
		do
			xSize := 100
			ySize := 25
			draw
		end
end
