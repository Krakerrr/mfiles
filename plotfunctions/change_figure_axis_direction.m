function change_figure_axis_direction(x,y,z)
% changes figure axis direction if 1 is given
ax = gca;

if x
ax.XAxis.Direction = 'reverse';
end

if y
ax.YAxis.Direction = 'reverse';
end

if z
ax.ZAxis.Direction = 'reverse';
end
end