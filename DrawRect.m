function DrawRect(rect)
    lx = rect(1); rx = rect(1)+rect(3);
    ty = rect(2); by = rect(2)+rect(4);
    x = [lx lx rx rx lx];
    y = [ty by by ty ty];
    plot(x, y, 'b');
end