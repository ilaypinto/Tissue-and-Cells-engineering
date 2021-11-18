function conc = find_concentration(AP_range, C)
    sol = C.sol;
    x = sol.x; 
    y = sol.y(1,:);
    interpul = interp1(x,y,AP_range); %Extract concentration in borders using interpulation 
    conc = linspace(interpul(1),interpul(2),10);%Taking 10 values in the border's range
end 

    
    
    
        