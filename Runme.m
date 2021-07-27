%%%%%%%%%%%%%%%%%%%%%%%%%
%% Read Me
%%%%%%%%%%%%%%%%%%%%%%%%%

% Two matlab functions are implemented for x-separation method 
% (Shin et al., Neuroimage, 2021)

% Implementations of the two functions are based on conventional QSM algorithms,
% "MEDI+0" (Liu, Magnetic Resonance in Medicine, 2018)
% and "iLSQR" (Li, Neuroimage, 2015).

% Regarding optimization parameters of x-separation, please refer to MEDI toolbox for x_sep_l1norm 
% and Suite toolbox for x_sep_SA

% The RDF N_std, wG, wG_r2p, mask_CSF can be obtained using MEDI toolbox.
% For R2, carefully consider the data acquisition and the effects of stimulated echo


%%%%%%%%%%%%%%%%%%%%%%%%%
%% For test, delete this section before sharing
%%%%%%%%%%%%%%%%%%%%%%%%%

txt_data = 'invivo'; % 'phantom' or 'invivo'

if strcmp( txt_data, 'phantom') == 1
    if ismac || isunix
    load ../Do_Not_Share/Data_phantom.mat
    elseif ispc
    load ..\Do_Not_Share\Data_phantom.mat
    end
    
    clear params
    
    
elseif strcmp( txt_data, 'invivo') == 1
    
    if ismac || isunix
    load ../Do_Not_Share/Data_Invivo.mat
    elseif ispc
    load ..\Do_Not_Share\Data_Invivo.mat
    end
    
    clear params
    
    
end

% example
% % essential parameters
% params.voxel_size = [1 1 1]; % [mm unit]
% params.CF = 123e6; % 3T case [Hz unist]
% params.b0_dir = [0 0 1]; % transverse slice
% params.Dr_pos = 137; % invivo human brain @ 3T 
% params.Dr_neg = params.Dr_pos;
% params.lambda = 1; % regularization parameters for x_sep_l1norm
% params.lambda_CSF = 1; % regularization parameters for x_sep_l1norm
% 

%%%%%%%%%%%%%%%%%%%%%%%%%
%% Run L1 norm-regularized x-separation (similar contrast with MEDI(+0))
%%%%%%%%%%%%%%%%%%%%%%%%%

mkdir('result')
addpath('functions_for_xsep')
local_f = -RDF/(2*pi*delta_TE); % for Hz unit
r2prime(r2prime<0) = 0; % enforce physics (i.e., R2* >= R2)
% params.lambda = 1; params.lambda = 1; % used parameters for in-vivo x-sep


[x_pos_l1, x_neg_l1, x_tot_l1] = x_sep_l1norm(local_f, r2prime,mag, N_std, mask_qsm, params);


save result/x_l1 x_pos_l1 x_neg_l1

% advanced options
% [x_pos_l1, x_neg_l1, x_tot_l1] = x_sep_l1norm(local_f, r2prime,mag, N_std, mask_qsm, params...
%     , mask_CSF, wG, wG_r2p, x_qsm_init);
% [x_pos_l1, x_neg_l1, x_tot_l1] = x_sep_l1norm(local_f, r2prime,mag, N_std, mask_qsm, params...
%     , mask_CSF, wG, wG_r2p, x_qsm_init,...
%     mask_FastRelax, mask_SlowRelax);
%%%%%%%%%%%%%%%%%%%%%%%%%
%% Run streaking artifact-supressed x-separation (similar contrast with iLSQR )
%%%%%%%%%%%%%%%%%%%%%%%%%


[x_pos_sa, x_neg_sa, x_tot_sa]= x_sep_SA(local_f,r2prime, mask_qsm,params);

save result/x_SA x_pos_sa x_neg_sa

% To compensate for strong susceptibility (e.g, hemorrhage) as STAR-QSM (Wei, NMR Bio. 2015)
% If conventional QSM map is provided, the processing time is reduced.
params_strongx = params;
params_strongx.flag_strong_x_correction = 1; 
params_strongx.strong_x_thresh = 0.2; % susceptibility threshold for masking strong susceptibility [ppm unit]
[x_pos_sa_s, x_neg_sa_s, x_tot_sa_s]= x_sep_SA(local_f,r2prime, mask_qsm,params_strongx, []);% automaticall generate x_qsm_init

save result/x_SA_s x_pos_sa_s x_neg_sa_s


% advanced options
%[x_pos_sa, x_neg_sa, x_tot_sa] =  x_sep_SA(local_f,r2prime, mask_qsm,params, x_qsm_init);
%[x_pos_sa, x_neg_sa, x_tot_sa] = x_sep_SA(local_f,r2prime, mask_qsm,params, x_qsm_init, mask_unrel_mag, mask_unrel_phs);
%[x_pos_sa_s, x_neg_sa_s, x_tot_sa_s]= x_sep_SA(local_f,r2prime, mask_qsm,params_strongx, x_qsm_init, mask_unrel_mag, mask_unrel_phs);









