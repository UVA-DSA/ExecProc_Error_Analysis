# Analysis of Executional and Procedural Errors in Dry-lab Robotic Surgery Experiments

This repository contains the code, data files, and error labels for our analysis of executional and procedural errors in dry-lab robotic surgery experiments.
Link to project page: [https://uva-dsa.github.io/ExecProc_Error_Analysis/](https://uva-dsa.github.io/ExecProc_Error_Analysis/)

### Examples of Executional Errors
|<img src="https://github.com/UVA-DSA/ExecProc_Error_Analysis/blob/main/Executional_Error_Example_Clips/multipleattempts_S_G3_D001_1150_1561.gif" width="500px"> | <img src="https://github.com/UVA-DSA/ExecProc_Error_Analysis/blob/main/Executional_Error_Example_Clips/needledrop_NP_G1_D001_428_606.gif" width="500px"> | <img src="https://github.com/UVA-DSA/ExecProc_Error_Analysis/blob/main/Executional_Error_Example_Clips/needleorientation_S_G4_G005_611_726.gif" width="500px"> | <img src="https://github.com/UVA-DSA/ExecProc_Error_Analysis/blob/main/Executional_Error_Example_Clips/outofview_S_G6_I004_1866_2027.gif" width="500px"> |
|:--:|:--:|:--:|:--:|
| Multiple Attempts | Needle Drop | Needle Orientation | Out of View |


### Pre-requisites
You will need to download the [JIGSAWS dataset](https://cirl.lcsr.jhu.edu/research/hmm/datasets/jigsaws_release/) and enter the filepaths to the 'transcriptions', 'kinematics', and 'label' folders in the MATLAB scripts. (Note that the relativeEntropy function requires at least MATLAB R2020a to run along with the appropriate toolboxes.) </br>
'transcriptionDir' is the filepath to the 'transcription' folder of a task in the JIGSAWS dataset. </br>
'kinematicDir' is the filepath to the folder containing the kinematic data of a task in the JIGSAWS dataset. </br>
'labelDir' is the filepath to the folder containing the executional error labels downloaded from this repository. </br>

For example: 
```sh
% directories
transcriptionDir = 'C:\Users\JIGSAWS\Suturing\Suturing\transcriptions';
kinematicDir = 'C:\Users\JIGSAWS\Suturing\Suturing\kinematics\AllGestures';
labelDir = 'C:\Users\Error_Labels\Consensus_error_labels_suturing';
```

## Publications
["Analysis of Executional and Procedural Errors in Dry-lab Robotic Surgery Experiments"](https://arxiv.org/abs/2106.11962) </br> 
K. Hutchinson, Z. Li, L. A. Cantrell, N. S. Schenkman, H. Alemzadeh </br>
Under review for publication in the Internation Journal of Medical Robotics and Computer Assisted Surgery (IJMRCAS)
