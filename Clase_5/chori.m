function b = chori(a)
%CHORI Summary of this function goes here
%   Detailed explanation goes here
[fil,col,cap]=size(a);
b=reshape(a,[fil,col*cap]);
end

