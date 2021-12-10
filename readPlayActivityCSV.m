function [ out_s ] = readPlayActivityCSV( fname )

% Read file
fid = fopen(fname,'r');

c_head = textscan(fid, '%q', 31, 'Delimiter',',');
c_head = c_head{1};

formatstr{1} = '%f';
formatstr{2} = '%q';
formatstr{3} = '%q';
formatstr{4} = '%q';
formatstr{5} = '%q';
formatstr{6} = '%q';
formatstr{7} = '%q';
formatstr{8} = '%q';
formatstr{9} = '%q';
formatstr{10} = '%f';
formatstr{11} = '%q';
formatstr{12} = '%q';
formatstr{13} = '%q';
formatstr{14} = '%q';
formatstr{15} = '%q';
formatstr{16} = '%q';
formatstr{17} = '%q';
formatstr{18} = '%q';
formatstr{19} = '%q';
formatstr{20} = '%f';
formatstr{21} = '%q';
formatstr{22} = '%f';
formatstr{23} = '%q';
formatstr{24} = '%f';
formatstr{25} = '%q';
formatstr{26} = '%q';
formatstr{27} = '%f';
formatstr{28} = '%q';
formatstr{29} = '%f';
formatstr{30} = '%q';
formatstr{31} = '%f';


fstr = strjoin(formatstr);

c_data = textscan(fid, fstr, 'Delimiter',',');

good_ind = c_data{7}./c_data{8} > 0.20;
dd = cellfun(@(x) strrep(x,'T',' '), c_data{2}(good_ind), 'UniformOutput', false);
dd = cellfun(@(x) strrep(x,'Z',''), dd, 'UniformOutput', false);
out_s.timestamp = datenum(dd);
out_s.song = c_data{3}(good_ind);
out_s.artist = c_data{4}(good_ind);
out_s.playDur = c_data{7}(good_ind);
out_s.mediaDur = c_data{8}(good_ind);
out_s.container = c_data{5}(good_ind);
out_s.ind = good_ind;
end

