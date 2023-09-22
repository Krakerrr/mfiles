function x_filtered = medianfilter(x,windowSize,~)
% median filter
switch nargin
    case 2
        x_filtered = medfilt1(x,windowSize);
    case 3
        cos_x = cos(x);
        sin_x = sin(x);
        cos_x_filtered = medfilt1(cos_x,windowSize);
        sin_x_filtered = medfilt1(sin_x,windowSize);
        x_filtered = atan2(sin_x_filtered , cos_x_filtered);
end
end