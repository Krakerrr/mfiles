function x_filtered = movingfiter(x,windowSize,~)
% % moving filter for x array
% if third input is given it is circular


switch nargin
    case 2 % linear
        x_filtered = x; % init
        for iter = 1:length(x)
            if iter < windowSize
                
            else
                x_filtered(iter) = sum(x(iter-windowSize+1:iter)) ./windowSize;
            end
        end
        
    case 3 % circular
        b = (1/windowSize)*ones(1,windowSize);
        a = 1;
        sin_x_filtered = filter(b,a,sin(x));
        cos_x_filtered = filter(b,a,cos(x));
        x_filtered = wrapToPi( atan2(sin_x_filtered , cos_x_filtered));
end
end