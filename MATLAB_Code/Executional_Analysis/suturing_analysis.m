% Kay Hutchinson 2/16/2021
% Executional Error Analysis of JIGSAWS dataset - suturing

% -------------------------------------------------------------------------
% DATA --------------------------------------------------------------------
% Create the *.mat file containing kinematic data, subject, and label
% Only need to run once,                    creates "all_data_suturing.mat"
%{
% organized by gesture where each gesture is a 1x3 cell
% containing the kinematic data, the subject, and a nor/err label

% directories
transcriptionDir = 'C:\Users\Student\Documents\UVA Files\Grad\Research\JIGSAWS Dataset\Suturing\Suturing\transcriptions';
kinematicDir = 'C:\Users\Student\Documents\UVA Files\Grad\Research\JIGSAWS Dataset\Suturing\Suturing\kinematics\AllGestures';
labelDir = 'C:\Users\Student\Documents\UVA Files\Grad\Research\IJCARS Paper\Consensus_error_labels_suturing';

% gets all csv files in struct
labelFiles = dir(fullfile(labelDir,'*.csv')); %gets all csv files in struct

% gesture cell arrays
G1 = cell(1, 3);  G1i = 1;      G2 = cell(1, 3);  G2i = 1;      G3 = cell(1, 3);  G3i = 1;
G4 = cell(1, 3);  G4i = 1;      G5 = cell(1, 3);  G5i = 1;      G6 = cell(1, 3);  G6i = 1;
G7 = cell(1, 3);  G7i = 1;      G8 = cell(1, 3);  G8i = 1;      G9 = cell(1, 3);  G9i = 1;
G10 = cell(1, 3);  G10i = 1;    G11 = cell(1, 3);  G11i = 1;    G12 = cell(1, 3);  G12i = 1;
G13 = cell(1, 3);  G13i = 1;    G14 = cell(1, 3);  G14i = 1;    G15 = cell(1, 3);  G15i = 1;

% for each gesture
for k = 1:length(labelFiles)
  baseFileName = labelFiles(k).name;
  gesture = split(baseFileName, "_");
  gesture = gesture{3}(1:2);
  
  fulllabelFileName = fullfile(labelDir, baseFileName);
  fprintf(1, 'Now reading %s\n', fulllabelFileName);
  
  fid=fopen(fulllabelFileName,'r');
  fgetl(fid);
  while(~feof(fid))
      % read line
      temp = fgetl(fid);
      row = strsplit(temp, ",");
      row2 = strsplit(row{2}, "/");
      data = row{2};
      endIndexes = regexp(row2{10}, "_");
      endIndex = endIndexes(2)-1;
      
      % use subject and trial to find kinematic file
      kinematicFileName = row2{10}(1:endIndex) + ".txt";
      fullkinematicFileName = fullfile(kinematicDir, kinematicFileName);
      kinematics = importdata(fullkinematicFileName);
      
      % extract task, subject, trial, and start and stop frames
      data = split(row2{10}, "_");
      task = data{1};
      subject = data{2}(1);
      trial = data{2}(2:4);
      startFrame = str2double(data{3});
      stopFrame = split(data{4}, ".");
      stopFrame = str2double(stopFrame(1));
      
      if row{3} == '1'
          label = 'err';
      else
          label = 'nor';
      end
      
      % fill in cell arrays for each gesture
      if gesture == "G1"
          G1{G1i,1} = kinematics(startFrame:stopFrame, :);
          G1{G1i,2} = subject;
          G1{G1i,3} = label;
          G1i = G1i+1;
      end
      if gesture == "G2"
          G2{G2i,1} = kinematics(startFrame:stopFrame, :);
          G2{G2i,2} = subject;
          G2{G2i,3} = label;
          G2i = G2i+1;
      end
      if gesture == "G3"
          G3{G3i,1} = kinematics(startFrame:stopFrame, :);
          G3{G3i,2} = subject;
          G3{G3i,3} = label;
          G3i = G3i+1;
      end
      if gesture == "G4"
          G4{G4i,1} = kinematics(startFrame:stopFrame, :);
          G4{G4i,2} = subject;
          G4{G4i,3} = label;
          G4i = G4i+1;
      end
      if gesture == "G5"
          G5{G5i,1} = kinematics(startFrame:stopFrame, :);
          G5{G5i,2} = subject;
          G5{G5i,3} = label;
          G5i = G5i+1;
      end
      if gesture == "G6"
          G6{G6i,1} = kinematics(startFrame:stopFrame, :);
          G6{G6i,2} = subject;
          G6{G6i,3} = label;
          G6i = G6i+1;
      end
      if gesture == "G7"
          G7{G7i,1} = kinematics(startFrame:stopFrame, :);
          G7{G7i,2} = subject;
          G7{G7i,3} = label;
          G7i = G7i+1;
      end
      if gesture == "G8"
          G8{G8i,1} = kinematics(startFrame:stopFrame, :);
          G8{G8i,2} = subject;
          G8{G8i,3} = label;
          G8i = G8i+1;
      end
      if gesture == "G9"
          G9{G9i,1} = kinematics(startFrame:stopFrame, :);
          G9{G9i,2} = subject;
          G9{G9i,3} = label;
          G9i = G9i+1;
      end
      if gesture == "G10"
          G10{G10i,1} = kinematics(startFrame:stopFrame, :);
          G10{G10i,2} = subject;
          G10{G10i,3} = label;
          G10i = G10i+1;
      end
      if gesture == "G11"
          G11{G11i,1} = kinematics(startFrame:stopFrame, :);
          G11{G11i,2} = subject;
          G11{G11i,3} = label;
          G11i = G11i+1;
      end
      if gesture == "G12"
          G12{G12i,1} = kinematics(startFrame:stopFrame, :);
          G12{G12i,2} = subject;
          G12{G12i,3} = label;
          G12i = G12i+1;
      end
      if gesture == "G13"
          G13{G13i,1} = kinematics(startFrame:stopFrame, :);
          G13{G13i,2} = subject;
          G13{G13i,3} = label;
          G13i = G13i+1;
      end
      if gesture == "G14"
          G14{G14i,1} = kinematics(startFrame:stopFrame, :);
          G14{G14i,2} = subject;
          G14{G14i,3} = label;
          G14i = G14i+1;
      end
      if gesture == "G15"
          G15{G15i,1} = kinematics(startFrame:stopFrame, :);
          G15{G15i,2} = subject;
          G15{G15i,3} = label;
          G15i = G15i+1;
      end
      
      
  end
  
  fclose(fid);
  fprintf(1, 'Finished gesture %s\n', gesture);
  
end

% save as .mat file
save("all_data_suturing.mat", "G1", "G2", "G3", "G4", "G5", "G6", "G7", "G8", "G9", "G10", "G11", "G12", "G13", "G14", "G15")
%}
% -------------------------------------------------------------------------


% -------------------------------------------------------------------------
% DTW ---------------------------------------------------------------------
% Create *.mat file containing dtw for each gesture
% Only need to run once,                creates "all_data_suturing_dtw.mat"
%{
% Load *.mat file of all task data
all_data = load("all_data_suturing.mat");

G_all=cell(1,8);
G_all{1}=all_data.G1; G_all{2}=all_data.G2; G_all{3}=all_data.G3;
G_all{4}=all_data.G4; G_all{5}=all_data.G5; G_all{6}=all_data.G6;
G_all{7}=all_data.G8; G_all{8}=all_data.G9; 

% DTW multivariate
G_all_dtw_m=multivariDTW(G_all);
save('all_data_suturing_dtw.mat','G_all_dtw_m');
%}
% -------------------------------------------------------------------------


% -------------------------------------------------------------------------
% KL ----------------------------------------------------------------------
% Analyze data
% Create *.mat file containing KL divergences
% Only need to run once,                          creates "KL_suturing.mat"
%{
% Load .mat file with dtw data
all_data_dtw = load("all_data_suturing_dtw.mat");
% KL divergence
relt_etrpy_m_G=GestureEntropy(all_data_dtw.G_all_dtw_m);
save('KL_suturing.mat','relt_etrpy_m_G')
%}
% -------------------------------------------------------------------------


% -------------------------------------------------------------------------
% PLOTS -------------------------------------------------------------------
% Make KL div plots
%{
a = load('KL_suturing.mat');
relt_etrpy_m_G = a.relt_etrpy_m_G;
Gestures=[  "G1: Reaching for needle with right hand",
            "G2: Positioning needle",
            "G3: Pushing needle through tissue",
            "G4: Transferring needle from left to right",
            "G5: Moving to center with needle in grip",
            "G6: Pulling suture with left hand",
            "G8: Orienting needle",
            "G9: Using right hand to help tighten suture"];
max_G_suture=[];
for i=1:8
    val=relt_etrpy_m_G{i};
    max_G_suture=[max_G_suture max(val)];
end

for f=1:8
    figure;
    y = [relt_etrpy_m_G{f}(1) relt_etrpy_m_G{f}(16); relt_etrpy_m_G{f}(2) relt_etrpy_m_G{f}(17); relt_etrpy_m_G{f}(3) relt_etrpy_m_G{f}(18); relt_etrpy_m_G{f}(4) relt_etrpy_m_G{f}(19); relt_etrpy_m_G{f}(5) relt_etrpy_m_G{f}(20); relt_etrpy_m_G{f}(6) relt_etrpy_m_G{f}(11); relt_etrpy_m_G{f}(7) relt_etrpy_m_G{f}(12); relt_etrpy_m_G{f}(8) relt_etrpy_m_G{f}(13); relt_etrpy_m_G{f}(9) relt_etrpy_m_G{f}(14); relt_etrpy_m_G{f}(10) relt_etrpy_m_G{f}(15)];
    b = bar(1:10, y);
    xticks([1:10]);
    xticklabels({   'L Pos',
                    'L Rot Mat',
                    'L Lin Vel',
                    'L Rot Vel',
                    'L Gripper Ang',
                    'R Pos',
                    'R Rot Mat',
                    'R Lin Vel',
                    'R Rot Vel',
                    'R Gripper Ang'});
    xtickangle(45);
    %xlim([0 21]);
    xlim([0 11]);
    % Legend
    set(b, {'DisplayName'}, {'MTM','PSM'}')
    legend() 

    title(["Suturing", Gestures(f),"dtw:(errnor vs. nornor)"]);
    xlabel("Parameter")
    ylabel("KL divergence")
end
%}

myfontsize = 30;
a = load('KL_suturing.mat');
relt_etrpy_m_G = a.relt_etrpy_m_G;
Gestures=[  "G1: Reaching for needle with right hand",
            "G2: Positioning needle",
            "G3: Pushing needle through tissue",
            "G4: Transferring needle from left to right",
            "G5: Moving to center with needle in grip",
            "G6: Pulling suture with left hand",
            "G8: Orienting needle",
            "G9: Using right hand to help tighten suture"];

for f=[1, 2, 3, 6, 7] % 2, 3, 7(G8) need 'YLim', [0 12], % 1, 6
    gind = [1, 2, 3, 4, 5, 6, 8, 9];
    fig=figure('Position', [10, 10, 900, 900]);
    y = [relt_etrpy_m_G{f}(16); relt_etrpy_m_G{f}(17); relt_etrpy_m_G{f}(18); relt_etrpy_m_G{f}(19); relt_etrpy_m_G{f}(20); relt_etrpy_m_G{f}(11); relt_etrpy_m_G{f}(12); relt_etrpy_m_G{f}(13); relt_etrpy_m_G{f}(14); relt_etrpy_m_G{f}(15)];
    b = bar(1:10, y);
    xticks([1:10]);
    xticklabels({   'L Pos',
                    'L Rot Mat',
                    'L Lin Vel',
                    'L Rot Vel',
                    'L Grip Ang',
                    'R Pos',
                    'R Rot Mat',
                    'R Lin Vel',
                    'R Rot Vel',
                    'R Grip Ang'});
    xtickangle(45);
    %xlim([0 21]);
    %xlim([0 11]);
    % Legend
    %set(b, {'DisplayName'}, {'PSM'}')
    %legend() 
    
    % set tick labels
    set(gca,'FontWeight', 'normal', 'FontName', 'Arial', 'FontSize', myfontsize);
    
    if f == 2
        set(gca, 'YLim', [0 12],'FontWeight', 'normal', 'FontName', 'Arial', 'FontSize', myfontsize);
    elseif f == 3
        set(gca, 'YLim', [0 8],'FontWeight', 'normal', 'FontName', 'Arial', 'FontSize', myfontsize);
    elseif f == 7
        %myfontsize=myfontsize*(4/3);
        set(gca, 'YLim', [0 7],'FontWeight', 'normal', 'FontName', 'Arial', 'FontSize', myfontsize);
    else
        set(gca,'FontWeight', 'normal', 'FontName', 'Arial', 'FontSize', myfontsize);
    end
            
        
    %title(["Suturing", Gestures(f)], 'FontWeight', 'normal', 'FontName', 'Arial', 'FontSize', myfontsize); %,"dtw:(errnor vs. nornor)"]);
    %xlabel("Parameter", 'FontWeight', 'normal', 'FontName', 'Arial', 'FontSize', myfontsize);
    ylabel("KL divergence", 'FontWeight', 'normal', 'FontName', 'Arial', 'FontSize', myfontsize);
    
    figname='S_G'+string(gind(f))+'_KLD.pdf';
    print(gcf, '-dpdf', '-bestfit', figname);
end




% -------------------------------------------------------------------------

