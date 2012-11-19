%%
% get initial frame
close all;
range = 818:1499;
filename_template = 'data/OneStopNoEnter/OneStopNoEnter2cor%04d.jpg';

im = imread(sprintf(filename_template, range(1)));
% rect = SetInitialPos(im);  % rect (x, y, width, height)
rect = [57,224,48,59];
obj_model = CalcHist(im, rect);

show_initial = true;
if show_initial
	fig_initial = figure('Name', 'Initial bb');
end
show_tracking = true;
if show_tracking
	fig_tracking = figure('Name', 'Tracking window');
end
show_similarity = true;
if show_similarity
	fig_similarity = figure('Name', 'Similarity');
end
show_frame_similarity = false;
if show_frame_similarity
	fig_frame_similarity = figure('Name', 'Frame similarity');
end

if show_initial
	figure(fig_initial);
	imshow(im);
	hold on;
	DrawRect(rect);
end

sims = zeros(size(range));
idx = 0;
%% enter main loop for tracking
for i = range

	% histogram here is weighted by distance to center.
    frame = imread(sprintf(filename_template, i));
    
	frame_sims = zeros(10, 1);
	for j = 1:10
    	weight_mask = CalcWeightMask(frame, obj_model, rect);
    	rect = UpdatePos(frame, rect, weight_mask);

		if show_frame_similarity
			figure(fig_frame_similarity);
    		current_hist = CalcHist(frame, rect);
    		sim = HistSim(obj_model, current_hist);
			frame_sims(j) = sim;
			plot(frame_sims);
			drawnow;
		end
	end
    idx = idx + 1;
    current_hist = CalcHist(frame, rect);
    sim = HistSim(obj_model, current_hist);
    sims(idx) = sim;
    disp(sim);
    
	if (show_similarity)
    	figure(fig_similarity);
    	plot(sims);
    	drawnow;
	end
    if (show_tracking)
        figure(fig_tracking);
        imshow(frame);
        hold on;
        DrawRect(rect);
    end
end
