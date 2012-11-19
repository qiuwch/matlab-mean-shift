function idx = ColorMap(colors, bin_size)
% input color vector, return index of color in column vector
	channel_bin = floor(255 / bin_size);
    idx = floor(colors(:, 1) ./ bin_size) * 1 ...
        + floor(colors(:, 2) ./ bin_size) * channel_bin...
        + floor(colors(:, 3) ./ bin_size) * channel_bin^2;
end
