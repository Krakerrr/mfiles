function merge2figures(figno1,figno2)
% merges two figures
figure; legend;

fig_gcf = gcf;
L1 = findobj(figno1,'type','line');
L2 = findobj(figno2,'type','line');
Lbase = findobj(fig_gcf.Number,'type','axes');
copyobj(L1, Lbase);
copyobj(L2, Lbase);
end