function [ out_dict ] = createDictonary( in_cell )

in_cell = cellstr(in_cell);
entries = unique(in_cell);
num = [];
for i = 1:length(entries)
   curEntry = entries{i};
   num{i} = sum(strcmp(in_cell,curEntry));
end

out_dict = entries;
out_dict(:,2) = num;

[~,I] = sort([out_dict{:,2}],'descend');
out_dict = out_dict(I,:);
ndx = strcmpi(out_dict(:,1),'<undefined>');
out_dict(ndx, :) = [];
end

