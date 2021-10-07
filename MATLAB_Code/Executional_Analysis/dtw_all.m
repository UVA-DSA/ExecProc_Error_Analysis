function [dist] = dtw_all(x1,x2)
%dtw_all compute the dist after dtw for a multi-dimentional array
%   x1,x2:time x para
%   dist:1 x para
    dist=zeros(1,size(x1,2));
    for i=1:size(x1,2)
        dist(i)=dtw(x1(:,i),x2(:,i));
    end
end