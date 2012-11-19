function rect = UpdatePos(im, initial_rect, weight_mask)
	% iterate to find the maximum
	% initial_rect (x, y, width, height)
    
	rx = round(initial_rect(3) / 2); ry = round(initial_rect(4) / 2);
    w = round(initial_rect(3)); h = round(initial_rect(4));
	[xs, ys] = meshgrid([-rx+1:w-rx], [-ry+1:h-ry]);
	color_weight_vec = reshape(weight_mask, size(weight_mask,1) * size(weight_mask,2), 1);
	xs = xs(:); ys = ys(:);
	% dist = sqrt(x.^2 + y.^2);
	% dist_vec = reshape(dist, size(dist, 1) * size(dist, 2), 1);
	% dist_weight_vec = gaussmf(dist_vec, [1, 0]);
	offx = sum(xs .* color_weight_vec) / sum(color_weight_vec);
	offy = sum(ys .* color_weight_vec) / sum(color_weight_vec);

	rect = initial_rect;
	rect(1) = rect(1) + offx;
	rect(2) = rect(2) + offy;
end
