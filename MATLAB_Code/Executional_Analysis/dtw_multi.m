function [dist_m] = dtw_multi(x1,x2)
%dtw_multi compute the dist after dtw for a multi-dimentional array
%   x1,x2:time x para(10)
%   dist:1 x para(10)
    dist=dtw_all(x1,x2);
    sim_index=cell(1,20);
    sim_index{1}=[1:3];sim_index{2}=[4:12];sim_index{3}=[13:15];sim_index{4}=[16:18];sim_index{5}=19;
    sim_index{6}=[20:22];sim_index{7}=[23:31];sim_index{8}=[32:34];sim_index{9}=[35:37];sim_index{10}=38;
    
    sim_index{11}=[39:41];sim_index{12}=[42:50];sim_index{13}=[51:53];sim_index{14}=[54:56];sim_index{15}=57;
    sim_index{16}=[58:60];sim_index{17}=[61:69];sim_index{18}=[70:72];sim_index{19}=[73:75];sim_index{20}=76;
    dist_m=zeros(size(dist,1),20);
    
    for i=1:20
        idx=sim_index{i};
        sub=dist(:,idx);
        dist_m(:,i)=sum(sub,2);
    end
end