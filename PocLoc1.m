%%% Simple right wall follow algorithm %%%
function [v, om, k] = PocLoc1(laser_rp, my_pose, target_pose)

% Force-summation-based technique for steering... this will tend to just head for region of lowest net potential when optimized
% Useful for A* guidance

%F_x = 0;
%F_y = 0;

%for i=1:36
	%disp(i);
%	F_x += (15/(laser_rp(i))) * sin((i*10*pi/180));
%	F_y += (15/(laser_rp(i))) * cos((i*10*pi/180));
%endfor
%F_net = sqrt(F_x^2 + F_y^2);
%theta_net = atan2(F_y , F_x);
%v = F_net*128/256;%-.01 + 0.02*laser_rp(36);
%om2 = -.04*theta_net;%(-80/(d_min - laser_rp(9) + 1)) - 3.5;%(0 + (0.5*(laser_rp(27) + laser_rp(9)))) + 10;%(-1.5*d_min) + 33;
%om = -0.5*(om2); %.02
%disp(F_x);

% Perhaps a better wandering implementation: try chasing the beam indicating the longest distance (see next_dir.m for implementation)

%v = 0.02*laser_rp(36);
%om = next_dir(laser_rp) * -.04;

%target_theta = my_pose;
if((laser_rp(24) < 45 || laser_rp(6) < 45) && laser_rp(26) > 50)
	target_pose = my_pose - 90;
	k = my_pose - 90;
endif
k = target_pose;
v = .02*laser_rp(36);
om = -.08 * (my_pose - target_pose);
disp(my_pose);
disp(target_pose);
disp("=====");
%if(laser_rp(27) < laser_rp(9))
%d_min = min(laser_rp(27),min(laser_rp(26),min(laser_rp(27),min(laser_rp(28),laser_rp(27)))));
%if(laser_rp(27) > 25
%om = -0.75*((d_min/23) - 1);
%endif
%if(laser_rp(27) > laser_rp(9))
%	om = .06*(laser_rp(9)/10);
%endif

