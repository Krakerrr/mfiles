function figdata  = extract_fig_data(figno)
% extract fig x y z and legend name from figure
% if multiple there is plots exist, data is given as cell array
figure(figno);

h = findobj(gca,'Type','line');
figdata.dispnames = get(h,'DisplayName');
figdata.xdata = get(h,'XData');
figdata.ydata = get(h,'YData');
figdata.zdata = get(h,'ZData');
end