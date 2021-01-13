function [root,i] = binary(left,right,f,err)
i = 1;
while i<1000
    middle = (left + right)/2;
    y_middle = f(middle);        
    % 误差不大于0.0005
    if middle-left < err
        root = middle;
        break
    elseif y_middle*f(left)>0
        left = middle;
    else
        right = middle;
    end
    i = i + 1;
end
