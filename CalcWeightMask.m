function weight_mask = CalcWeightMask(im, obj_model, rect)
	% rect: initial rect (x, y, width, height)
	% for each surround pixel, there is an assigned weight
	% w_i represent the probability of finding this color in the histogram.

	[center_model, code_vec] = CalcHist(im, rect);
	
	non_zero = center_model ~= 0;  % use this index to speed up
	color_prob = zeros(size(obj_model)); % the same size of histogram
	color_prob(non_zero) = sqrt(obj_model(non_zero) ./ center_model(non_zero));

	weight_vec = color_prob(code_vec+1); % color_prob is from 1:255^3, code_vec range from 0:255^3-1
	weight_mask = reshape(weight_vec, round([rect(3) rect(4)]));
	assert(sum(isnan(weight_vec)) == 0);
end
