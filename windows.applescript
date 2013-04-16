tell application "Finder"
	set _b to bounds of window of desktop
	set _width to item 3 of _b
	set _height to item 4 of _b
end tell

if _width > 1800 then
  set _win_width to 730
	set _monitor to true
else
  set _win_width to 714
	set _monitor to false
end if
set _dbl_width to _win_width * 2
set _new_y to 21
set _new_max_y to 1125

tell application "System Events"
  set _active_app to item 1 of (get name of processes whose frontmost is true)
end tell

try
	tell application _active_app
		activate
		set _b2 to bounds of window 1
		set _x to item 1 of _b2
		set _y to item 2 of _b2
		set _w to item 3 of _b2
		set _h to item 4 of _b2
		set _w to _w - _x
		
		-- determine width
    if _w > 1000 then
      -- double-sized window. if it's already exactly double-sized, shrink it.
      if _w > (_dbl_width - 5) and (_w < _dbl_width + 5) then
        set _new_width to _win_width
      else
        set _new_width to _dbl_width
      end if
		else
      if _w = _win_width then
        set _new_width to _dbl_width
      else
        set _new_width to _win_width
      end if
		end if
		
		-- determine the horizontal location
		if _x < 500 then
			set _new_x to 0
		else if _x < 1000 then
			set _new_x to _win_width
		else
      set _new_x to _width - _new_width
		end if
		
		-- resize + move the window
		set _new_max_x to _new_x + _new_width
		set bounds of window 1 to {_new_x, _new_y, _new_max_x, _new_max_y}
	end tell
end try
