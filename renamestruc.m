function out_s = renamestruc(in)

good_ind = in.PlayDurationMilliseconds./in.MediaDurationInMilliseconds > 0.20;
dd = cellfun(@(x) strrep(x,'T',' '), in.EventStartTimestamp(good_ind), 'UniformOutput', false);
dd = cellfun(@(x) strrep(x,'Z',''), dd, 'UniformOutput', false);
out_s.timestamp = datenum(dd);
out_s.song = in.SongName(good_ind);
out_s.artist = in.ArtistName(good_ind);
out_s.playDur = in.PlayDurationMilliseconds(good_ind);
out_s.mediaDur = in.MediaDurationInMilliseconds(good_ind);
% out_s.genre = in.Genre(good_ind);
out_s.ind = good_ind;


end