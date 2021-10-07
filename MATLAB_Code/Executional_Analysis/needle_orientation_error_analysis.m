% Kay Hutchinson 4/7/2021
% Executional Error Analysis of JIGSAWS dataset 
% - suturing G4 and G8 needle orientation error only

% -------------------------------------------------------------------------
% DATA --------------------------------------------------------------------
% Create the *.mat file containing kinematic data, subject, and label
% Only need to run once, creates "all_data_suturing_needle_orientation.mat"
%{
% organized by gesture where each gesture is a 1x3 cell
% containing the kinematic data, the subject, and a nor/err label

% directories
transcriptionDir = 'C:\Users\Student\Documents\UVA Files\Grad\Research\JIGSAWS Dataset\Suturing\Suturing\transcriptions';
kinematicDir = 'C:\Users\Student\Documents\UVA Files\Grad\Research\JIGSAWS Dataset\Suturing\Suturing\kinematics\AllGestures';
labelDir = 'C:\Users\Student\Documents\UVA Files\Grad\Research\IJCARS Paper\needle_orientation_labels_suturing';

% gets all csv files in struct
labelFiles = dir(fullfile(labelDir,'*.csv')); %gets all csv files in struct

% gesture cell arrays
G4 = cell(1, 3);  G4i = 1;      G8 = cell(1, 3);  G8i = 1;

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
      
      if gesture == "G4"
          G4{G4i,1} = kinematics(startFrame:stopFrame, :);
          G4{G4i,2} = subject;
          G4{G4i,3} = label;
          G4i = G4i+1;
      end
      if gesture == "G8"
          G8{G8i,1} = kinematics(startFrame:stopFrame, :);
          G8{G8i,2} = subject;
          G8{G8i,3} = label;
          G8i = G8i+1;
      end
  end
  
  fclose(fid);
  fprintf(1, 'Finished gesture %s\n', gesture);
  
end

% save as .mat file
save("all_data_suturing_needle_orientation.mat", "G4", "G8")
%}
% -------------------------------------------------------------------------


% -------------------------------------------------------------------------
% DTW ---------------------------------------------------------------------
% Create *.mat file containing dtw for each gesture
% Only need to run once, creates "all_data_suturing_needle_orientation_dtw.mat"
%{
% Load *.mat file of all task data
all_data = load("all_data_suturing_needle_orientation.mat");

G_all=cell(1,2);
G_all{1}=all_data.G4; G_all{2}=all_data.G8;

% DTW multivariate
G_all_dtw_m=multivariDTW(G_all);
save('all_data_suturing_needle_orientation_dtw.mat','G_all_dtw_m');
%}
% -------------------------------------------------------------------------


% -------------------------------------------------------------------------
% KL ----------------------------------------------------------------------
% Analyze data
% Create *.mat file containing KL divergences
% Only need to run once,       creates "KL_suturing_needle_orientation.mat"
%{
% Load .mat file with dtw data
all_data_dtw = load("all_data_suturing_needle_orientation_dtw.mat");
% KL divergence
relt_etrpy_m_G=GestureEntropy(all_data_dtw.G_all_dtw_m);
save('KL_suturing_needle_orientation.mat','relt_etrpy_m_G')
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
a = load('KL_suturing_needle_orientation.mat');
relt_etrpy_m_G = a.relt_etrpy_m_G;
Gestures=[  "G1: Reaching for needle with right hand",
            "G2: Positioning needle",
            "G3: Pushing needle through tissue",
            "G4: Transferring needle from left to right",
            "G5: Moving to center with needle in grip",
            "G6: Pulling suture with left hand",
            "G8: Orienting needle",
            "G9: Using right hand to help tighten suture"];

for f=[2]
    gind = [4, 8];
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
    set(gca,'YLim', [0 7], 'FontWeight', 'normal', 'FontName', 'Arial', 'FontSize', myfontsize);
    
    %title(["Suturing", Gestures(f)], 'FontWeight', 'normal', 'FontName', 'Arial', 'FontSize', myfontsize); %,"dtw:(errnor vs. nornor)"]);
    %xlabel("Parameter", 'FontWeight', 'normal', 'FontName', 'Arial', 'FontSize', myfontsize);
    ylabel("KL divergence", 'FontWeight', 'normal', 'FontName', 'Arial', 'FontSize', myfontsize);
    
    figname='S_G'+string(gind(f))+'_needle_orientation_KLD.pdf';
    print(gcf, '-dpdf', '-bestfit', figname);
end




% -------------------------------------------------------------------------

