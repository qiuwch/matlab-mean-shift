function [histogram, code_vec] = CalcHist(im , rect)	
	% return histogram of image patch in pos
	% bin_size, means step size for color
    % mask = SpatialMask(rect);

	bin_size = 3;  % place 0, 1, 2 together
    rect = round(rect);
	channel_bin = floor(255 / bin_size);
    patch = uint32(im(rect(2)+1:rect(2)+rect(4), rect(1)+1:rect(1)+rect(3), :));
    code_vec = ColorMap(reshape(patch, size(patch,1) * size(patch,2), 3), bin_size);
    histogram = histc(code_vec, 0:channel_bin^3);
end
