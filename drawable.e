note
	description: "Summary description for {DRAWABLE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	DRAWABLE


feature
	draw(position:POSITION):BOOLEAN
		do
			--this should be overwritten in the subclass
		end

end
