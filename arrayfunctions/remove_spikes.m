function data_array = remove_spikes(data_array,threshold)
% removes spikes bigger than threshold from array
idx_jump = find(  abs(diff(data_array))> threshold);

if isempty(idx_jump)
    return
end

iter = 1;
while(iter < length(idx_jump)-1)
    if( idx_jump(iter+1) -  idx_jump(iter) == 1)
        iter = iter + 2;
    else
        idx_jump(iter) = [];
    end
end
idx_jump(1:2:end) = [];
data_array(idx_jump) = [];
end