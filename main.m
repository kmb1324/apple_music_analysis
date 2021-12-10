clear; close all;

fname = fullfile('Apple Music Activity 2021','Apple Music Play Activity.csv');
data_s = importfile_apple_music_2021(fname);
data_s = renamestruc(data_s);

tstart = datenum('2021-01-01 00:00:01');
tend = datenum('2022-01-01 00:00:00');
ind_2021 = data_s.timestamp>=tstart & data_s.timestamp<=tend;
tstart = datenum('2020-01-01 00:00:01');
tend = datenum('2021-01-01 00:00:00');
ind_2020 = data_s.timestamp>=tstart & data_s.timestamp<=tend;
tstart = datenum('2019-01-01 00:00:01');
tend = datenum('2020-01-01 00:00:00');
ind_2019 = data_s.timestamp>=tstart & data_s.timestamp<=tend;
tstart = datenum('2018-01-01 00:00:01');
tend = datenum('2019-01-01 00:00:00');
ind_2018 = data_s.timestamp>=tstart & data_s.timestamp<=tend;
tstart = datenum('2017-01-01 00:00:01');
tend = datenum('2018-01-01 00:00:00');
ind_2017 = data_s.timestamp>=tstart & data_s.timestamp<=tend;
tstart = datenum('2016-01-01 00:00:01');
tend = datenum('2017-01-01 00:00:00');
ind_2016 = data_s.timestamp>=tstart & data_s.timestamp<=tend;

%% Analysis
close all; clc;
song_2021 = createDictonary(data_s.song(ind_2021));
artist_2021 = createDictonary(data_s.artist(ind_2021));
artist_2021 = artist_2021(cellfun(@(x) ~isempty(x), artist_2021(:,1)),:);
song_2021 = song_2021(2:end,:);

song_2020 = createDictonary(data_s.song(ind_2020));
artist_2020 = createDictonary(data_s.artist(ind_2020));
artist_2020 = artist_2020(cellfun(@(x) ~isempty(x), artist_2020(:,1)),:);
song_2020 = song_2020(2:end,:);
song_2019 = createDictonary(data_s.song(ind_2019));
artist_2019 = createDictonary(data_s.artist(ind_2019));
artist_2019 = artist_2019(cellfun(@(x) ~isempty(x), artist_2019(:,1)),:);
song_2019 = song_2019(2:end,:);
song_2018 = createDictonary(data_s.song(ind_2018));
artist_2018 = createDictonary(data_s.artist(ind_2018));
artist_2018 = artist_2018(cellfun(@(x) ~isempty(x), artist_2018(:,1)),:);
song_2018 = song_2018(2:end,:);
song_2017 = createDictonary(data_s.song(ind_2017));
artist_2017 = createDictonary(data_s.artist(ind_2017));
artist_2017 = artist_2017(cellfun(@(x) ~isempty(x), artist_2017(:,1)),:);
song_2017 = song_2017(2:end,:);
song_2016 = createDictonary(data_s.song(ind_2016));
artist_2016 = createDictonary(data_s.artist(ind_2016));
artist_2016 = artist_2016(cellfun(@(x) ~isempty(x), artist_2016(:,1)),:);
song_2016 = song_2016(2:end,:);
% genre_2021 = createDictonary(data_s.genre(ind_2021));
% genre_2020 = createDictonary(data_s.genre(ind_2020));
% genre_2019 = createDictonary(data_s.genre(ind_2019));
% genre_2018 = createDictonary(data_s.genre(ind_2018));
% genre_2017 = createDictonary(data_s.genre(ind_2017));
% genre_2016 = createDictonary(data_s.genre(ind_2016));

total_play_2021 = sum(data_s.playDur(ind_2021))./1000./60./60./24;
total_play_2020 = sum(data_s.playDur(ind_2020))./1000./60./60./24;
total_play_2019 = sum(data_s.playDur(ind_2019))./1000./60./60./24;
total_play_2018 = sum(data_s.playDur(ind_2018))./1000./60./60./24;
total_play_2016 = sum(data_s.playDur(ind_2016))./1000./60./60./24;
total_play_2017 = sum(data_s.playDur(ind_2017))./1000./60./60./24;
fprintf('Total Play time in 2021: %.1f [days]\n', total_play_2021);
fprintf('Total Play time in 2020: %.1f [days]\n', total_play_2020);
fprintf('Total Play time in 2019: %.1f [days]\n', total_play_2019);
fprintf('Total Play time in 2018: %.1f [days]\n', total_play_2018);
fprintf('Total Play time in 2017: %.1f [days]\n', total_play_2017);

% Plot
figure
subplot(5,1,3);
barh([artist_2019{5:-1:1,2}]);
set(gca,'yticklabel',artist_2019(5:-1:1,1))
title('Top 5 Artist 2019');
subplot(5,1,2);
barh([artist_2018{5:-1:1,2}]);
set(gca,'yticklabel',artist_2018(5:-1:1,1))
title('Top 5 Artist 2018');
subplot(5,1,4)
barh([artist_2020{5:-1:1,2}]);
set(gca,'yticklabel',artist_2020(5:-1:1,1))
title('Top 5 Artist 2020');
subplot(5,1,1)
barh([artist_2017{5:-1:1,2}]);
set(gca,'yticklabel',artist_2017(5:-1:1,1))
title('Top 5 Artist 2017');
subplot(5,1,5)
barh([artist_2021{5:-1:1,2}]);
set(gca,'yticklabel',artist_2021(5:-1:1,1))
title('Top 5 Artist 2021');

figure
subplot(5,1,3);
barh([song_2019{5:-1:1,2}]);
set(gca,'yticklabel',song_2019(5:-1:1,1))
title('Top 5 song 2019');
subplot(5,1,2);
barh([song_2018{5:-1:1,2}]);
set(gca,'yticklabel',song_2018(5:-1:1,1))
title('Top 5 song 2018');
subplot(5,1,4);
barh([song_2020{5:-1:1,2}]);
set(gca,'yticklabel',song_2020(5:-1:1,1))
title('Top 5 song 2020');
subplot(5,1,1)
barh([song_2017{5:-1:1,2}]);
set(gca,'yticklabel',song_2017(5:-1:1,1))
title('Top 5 song 2017');
subplot(5,1,5)
barh([song_2021{5:-1:1,2}]);
set(gca,'yticklabel',song_2021(5:-1:1,1))
title('Top 5 song 2021');

% figure
% subplot(5,1,3);
% barh([genre_2019{5:-1:1,2}]);
% set(gca,'yticklabel',genre_2019(5:-1:1,1))
% title('Top 5 genres 2019');
% subplot(5,1,2);
% barh([genre_2018{5:-1:1,2}]);
% set(gca,'yticklabel',genre_2018(5:-1:1,1))
% title('Top 5 genres 2018');
% subplot(5,1,4);
% barh([genre_2020{5:-1:1,2}]);
% set(gca,'yticklabel',genre_2020(5:-1:1,1))
% title('Top 5 genres 2020');
% subplot(5,1,1)
% barh([genre_2017{5:-1:1,2}]);
% set(gca,'yticklabel',genre_2017(5:-1:1,1))
% title('Top 5 genres 2017');
% subplot(5,1,5)
% barh([genre_2021{5:-1:1,2}]);
% set(gca,'yticklabel',genre_2021(5:-1:1,1))
% title('Top 5 genres 2021');

