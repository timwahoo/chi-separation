%% χ-separation Tool

% This tool is MATLAB-based software forseparating para- and dia-magnetic susceptibility sources (χ-separation). 
% Separating paramagnetic (e.g., iron) and diamagnetic (e.g., myelin) susceptibility sources 
% co-existing in a voxel provides the distributions of two sources that QSM does not provides. 

% χ-separation tool v1.0

% Contact E-mail: snu.list.software@gmail.com 

% Reference
% H.-G. Shin, J. Lee, Y. H. Yun, S. H. Yoo, J. Jang, S.-H. Oh, Y. Nam, S. Jung, S. Kim, F. Masaki, W. 
% Kim, H. J. Choi, J. Lee. χ-separation: Magnetic susceptibility source separation toward iron and 
% myelin mapping in the brain. Neuroimage, 2021 Oct; 240:118371.

% χ-separation tool is powered by MEDI toolbox (for BET), STI Suite (for V-SHARP), SEGUE toolbox (for SEGUE), and mritools (for ROMEO).


%% Example
% This example reconstructs χ-separation maps from multi-echo gradient 
% echo magnitude and phase data

%% Necessary preparation

% Set x-separation tool directory path
home_directory = 'your_path/x-separation tool directory';
addpath(genpath(home_directory))

% Set MATLAB tool directory path 
% xiangruili/dicm2nii (https://kr.mathworks.com/matlabcentral/fileexchange/42997-xiangruili-dicm2nii)
addpath(genpath('your_path/dicm2nii'))
% Tools for NIfTI and ANALYZE image (https://kr.mathworks.com/matlabcentral/fileexchange/8797-tools-for-nifti-and-analyze-image)
addpath(genpath('your_path/Tools_for_NIfTI_and_ANALYZE_image'))

% Download onnxconverter Add-on, and then install it.
% Deep Learning Toolbox Converter for ONNX Model Format 
% (https://kr.mathworks.com/matlabcentral/fileexchange/67296-deep-learning-toolbox-converter-for-onnx-model-format)

% Set QSM tool directory path 
% STI Suite (Version 3.0) (https://people.eecs.berkeley.edu/~chunlei.liu/software.html)
addpath(genpath('your_path/to/STISuite'))

% MEDI toolbox (http://pre.weill.cornell.edu/mri/pages/qsm.html)
addpath(genpath('your_path/to/MEDItoolbox'))

% SEGUE toolbox (https://xip.uclb.com/product/SEGUE)
addpath(genpath('your_path/to/SEGUE'))

% mritools toolbox (https://github.com/korbinian90/CompileMRI.jl/releases)
addpath(genpath('your_path/to/mritools'))

%% Input data
% mag_multi_echo - multi-echo magnitude data (x, y, z, te)
% phs_multi_echo - multi-echo phase data (x, y, z, te)

%% Data paramters
% B0_strength, B0_direction, CF (central frequency), TE (echo time), delta_TE, voxel_size

% B0_strength = 3;
% B0_direction = [0, 0, 1];
% CF = 123200000;
% TE = [0.00xx, 0.00xx, 0.00xx, 0.00xx, ...];
% delta_TE = 0.00xx;
% voxel_size = [dx, dy, dz];

%% Preprocessing
% Compute single magnitude and phase data

mag = sqrt(sum(abs(mag_multi_echo).^2,4));
[phase, N_std] = Preprocessing4Phase(mag_multi_echo, phs_multi_echo);

%% Generate Mask
% BET from MEDI toolbox

matrix_size = size(mag);
mask_brain = BET(mag,matrix_size,voxel_size);

%% Phase Unwrapping
% Laplacian-based method from STI Suite

pad_size=[12 12 12];
[field_map, ~] = MRPhaseUnwrap(phase,'voxelsize',voxel_size,'padsize',pad_size);
field_map_hz = field_map / (2*pi*delta_TE); % convert rad to hz

%% Background field removal
% V-SHARP from STI Suite

smv_size=12;
[local_field, mask_brain_new]=V_SHARP(field_map, mask_brain,'voxelsize',voxel_size,'smvsize',smv_size);
local_field_hz = local_field / (2*pi*delta_TE); % convert rad to hz

%% QSM
% Compute R2* (needed multi-echo magnitude)
r2star = arlo(TE, mag_multi_echo);


% 1. iLSQR from STI Suite

pad_size = [12, 12, 12];
QSM = QSM_iLSQR(local_field,mask_brain_new,'TE',delta_TE*1e3,'B0',B0_strength,'H',B0_direction,'padsize',pad_size,'voxelsize',voxel_size);


% 2. QSMnet

% Compute CSF mask (needed R2*)
mask_CSF = extract_CSF(r2star, mask_brain_new, voxel_size);

% mask_reference = mask_brain_new; % reference region (or mask_CSF)
% QSM = QSMnet_general(home_directory, local_field_hz, mask_brain_new, mask_reference, B0_direction, CF, voxel_size, matrix_size);  

%% χ-separation
% Parameters for using r2
have_r2map = false;
if ~have_r2map
    % Compute pseudo R2map (If you don't have r2map)
    nominal_value = 13;
    r2 = mask_brain;
    r2(r2~=0) = nominal_value;
end

% Compute R2'
r2prime = r2star - r2;
r2prime(r2prime<0) = 0; 


% 1. MEDI-regularized Chi-separation
% regularization parameters for chi_sep_MEDI

% params.b0_dir = B0_direction;
% params.CF = CF;
% params.voxel_size = voxel_size;
% params.lambda = 1;
% params.lambda_CSF = 1;
% option_data.qsm = QSM;
% option_data.mask_CSF = mask_CSF;
% option_data.N_std = N_std;
% [x_pos, x_neg, x_tot] = chi_sep_MEDI(mag, local_field_hz, r2prime, N_std, mask_brain_new, params, option_data);


% 2. iLSQR
% parameters for chi_sep_iLSQR

params.b0_dir = B0_direction;
params.CF = CF;
params.voxel_size = voxel_size;
option_data.qsm = QSM;
option_data.N_std = N_std;
[x_pos, x_neg, x_tot] = chi_sep_iLSQR(mag, local_field_hz, r2prime, mask_brain_new, params, option_data);


% 3. chi_sepnet

% if have_r2map
%     map = r2prime;
% else
%     map = r2star;
% end
% Dr = 137;
% [x_pos, x_neg, x_tot] = chi_sepnet_general(home_directory, local_field_hz, map, mask_brain_new, Dr, B0_direction, CF, voxel_size, matrix_size, have_r2map);











