function [relt_etrpy_m_G] = GestureEntropy(G_all_dtw_m)
%GestureEntropy calculates the nornor vs errnor entropy 
%   G_all_dtw_m :cell contains gestures 
%   return 
%   relt_entrpy_m_G : cell contains entropy of 10 parameter for all gestures 
    relt_etrpy_m_G=cell(1,length(G_all_dtw_m));
    for i=1:length(relt_etrpy_m_G)
        G=G_all_dtw_m{i};
        Gp0=G{2};
        Gp1=G{3};
        X=[Gp0;Gp1];
        y=logical([zeros(1,size(Gp0,1)) ones(1,size(Gp1,1))]);
        re_=relativeEntropy(X,y);
        relt_etrpy_m_G{i}=re_;
    end
end