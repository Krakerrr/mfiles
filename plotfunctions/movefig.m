function movefig()
persistent n
pos_array = {'southeast','northwest','north','northeast',...
    'west','center','east',...
    'southwest','south',	};
if isempty(n)
    n = 0;
end
n = n + 1;

k = mod(n,length(pos_array))+1;
fig = gcf;
movegui(fig,pos_array{k})
end