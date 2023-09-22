function setLineWidth_move_allfig(linewidth)
% set linewidths of all figs and moves them
% h2 = findall(groot,'Type','figure');
h2 = findobj('type','figure');
for iter = 1:length(h2)
    figure(iter)
    setLineWidth(linewidth);
    movefig;
end
end