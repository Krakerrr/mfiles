function out_marker = marker_iterative( markerno )
% at every call change marker, markerno is specific
if nargin <1
  markerno = 1;  
end
marker_array = {'+','*','o','x','s','d','^','p','v','>','<','h','.','_'};
persistent marker_iter
if isempty(marker_iter)
    marker_iter = zeros(111,1);
end
marker_iter(markerno) = marker_iter(markerno) + 1;

if marker_iter(markerno) > length(marker_array)
    marker_iter(markerno) = 1;
end

out_marker = marker_array{marker_iter(markerno)};
end