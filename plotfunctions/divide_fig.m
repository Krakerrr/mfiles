function divide_fig(figno,markertype)
% divide one plot into multiple plots
% if markertype is not given set as '-'
% one data plot is not divided
if nargin == 1
    markertype = '-';
end
figdata  = extract_fig_data(figno);
fig_length = length(figdata.xdata);
if fig_length > 1
    for iter = 1:fig_length
        figure; hold on;legend; grid on;
        plot( figdata.xdata{iter}, figdata.ydata{iter},markertype,'DisplayName', figdata.dispnames{iter})
    end
else
    disp('Only one figure exits')
end
end