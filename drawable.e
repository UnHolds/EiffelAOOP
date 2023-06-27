note
	description: "Summary description for {DRAWABLE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	DRAWABLE


feature
	draw(position:POSITION):BOOLEAN
		require
			false
		do
			--this should be overwritten in the subclass
		ensure
			true
		end


end
