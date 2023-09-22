function time_date = nms2datetime(nWeek,nMs)
% converts gps time data to date time
% nWeek -> weak of the year
% nMs -> time passes from week start miliseconds
nMs = nMs ./ 1000; % convert to sec
zulutime=datetime(1980,1,6);
time_date = zulutime+calweeks(nWeek)+hours(3) + seconds(nMs); %add zulu time to nWeek (+3 hours added for Turkiye)
