function b = normaliza(a)
%NORMALIZA Summary of this function goes here
%   Detailed explanation goes here
b=double(a);
b=b/max(b(:));
b=b*255;
b=uint8(b);
end

