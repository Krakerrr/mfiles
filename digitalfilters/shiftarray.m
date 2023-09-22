function xshift = shiftarray(x,n)
% shifts array forward or backward, protect array size by implementing zero
xshift = x .*0;
datalength = length(x);
if n> datalength
    n = datalength;
    warning('Shift is bigger than data size')
end
if n>0
    xshift(n+1:end) = x(1:end-n);
elseif n == 0
    xshift = x;
else
    n = abs(n);
    xshift(1:end-n) = x(n+1:end);
end

end