function [next_angle] = next_dir(laser_rp)
next_angle = 0;
iter_max = 36;
max_val = 1.25*laser_rp(36);

for i=25:36
	if((i/20)*laser_rp(i) > max_val)
		iter_max = i;
		max_val = laser_rp(i);
	endif
endfor

for i=1:9
	if((1.8/i)*laser_rp(i) > max_val)
		iter_max = i;
		max_val = laser_rp(i);
	endif
endfor

if(iter_max > 0 && iter_max < 10)
	next_angle = -10*iter_max;
	%disp("a");
endif
if(iter_max > 26 && iter_max < 37)
	next_angle = 10*(36-iter_max);
	%disp("b");
endif
%disp(next_angle);
