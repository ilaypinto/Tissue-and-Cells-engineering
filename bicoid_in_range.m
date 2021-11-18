function bicoid = bicoid_in_range(C, AP_cell) 
bicoid = cell(1, length(AP_cell));
for i = 1:length(AP_cell)
    bicoid{1,i} = find_concentration(AP_cell{1,i}, C);
end
end
