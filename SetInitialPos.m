function rect = SetInitialPos(im)
% get object rectangle for initial frame
    imshow(im);
    pts = ginput(2);
    rect = [pts(1,1), pts(1, 2), pts(2,1)-pts(1,1), pts(2,2)-pts(1,2)]; % rect (x, y, width, height)
    rect = round(rect);
    close(fig);
end
