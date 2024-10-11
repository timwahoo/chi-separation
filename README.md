#  ⭐New toolbox is now available for test!⭐

#  chi-separation toolbox (*&chi;*-separation, x-separation)

* The GUI-based MATLAB toolbox including algorithms for magnetic susceptibility source separation based on convex optimization (**_&chi;_-separation or chi-separation; H. Shin et al., Neuroimage, 2021**) and deep learning-based reconstruction. The toolbox also supports phase preprocessing (e.g. phase unwrapping and background removal) powered by MEDI, STI Suite, SEGUE, and mritools toolboxs (see the Chisep_script.m file for details). 

* The *&chi;*-separation toolbox includes the following features:
  - DICOM/NIFTI data compatibility
  - **QSMnet**: Quantitative susceptibility mapping (QSM) reconstruction algorithm based on deep neural network (QSMnet; J. Yoon et al., Neuroimage, 2018)
  - **_&chi;_-separation using _R_<sub>2</sub>' (or _R_<sub>2</sub>\* )**: Magnetic susceptibility source separation algorithms based on convex optimization (*&chi;*-separation; H. Shin et al., Neuroimage, 2021) that share similar contrasts and optimization parameters with either MEDI+0 (Liu et al., MRM, 2018) or iLSQR (Li et al., Neuroimage, 2015) algorithms. The toolbox also provides the option to use pseudo *R*<sub>2</sub> map if *R*<sub>2</sub> measurement is not availabe (using *R*<sub>2</sub>' is reconmmanded for accurate estimation).
  - **_&chi;_-sepnet using _R_<sub>2</sub>' (or _R_<sub>2</sub>\* )**: A U-Net-based neural network that reconstructs COSMOS-quality *&chi;*-separation using *R*<sub>2</sub>' and phase. In case *R*<sub>2</sub> is not measured, another neural network is trained to estimate *&chi;*-separation maps from *R*<sub>2</sub>\* and phase.

* Last update: June-11-2024 (Sooyeon Ji, Hyeong-Geol Shin, Jun-Hyeok Lee, Minjoon Kim, Kyeongseon Min)


## Reference

* H. Shin, J. Lee, Y. H. Yun, S. H. Yoo, J. Jang, S.-H. Oh, Y. Nam, S. Jung, S. Kim, F. Masaki, W. Kim, H. J. Choi, J. Lee. *&chi;*-separation: Magnetic susceptibility source separation toward iron and myelin mapping in the brain. Neuroimage, 2021 Oct; 240:118371.
* J. Yoon, E. Gong, I. Chatnuntawech, B. Bilgic, J. Lee, W. Jung, J. Ko, H. Jung, K. Setsompop, G. Zaharchuk, E.Y. Kim, J. Pauly, J. Lee. Quantitative susceptibility mapping using deep neural network: QSMnet. Neuroimage. 2018;179:199-206


## Requirements

* Common
  - MATLAB (tested in R2019a-R2021a)

* Additional
  - For QSMnet and *&chi;*-sepnet, Deep Learning MATLAB Toolbox Converter for ONNX Model Format (https://www.mathworks.com/matlabcentral/fileexchange/67296-deep-learning-toolbox-converter-for-onnx-model-format)
  - For DICOM/NIFTI read and phase processing, see https://www.dropbox.com/sh/3zafav50bfnruuu/AABVVYpdsznsRXKy8YKK4ybla?dl=0


## Awesome - *&chi;*-separation related papers

**Susceptibility source separation method**

* ***&chi;*-separation**
  - *&chi;*-separation: Magnetic susceptibility source separation toward iron and myelin mapping in the brain (2021), H.-G Shin et al. [[Paper](https://www.sciencedirect.com/science/article/pii/S1053811921006479)]
  - On the separation of susceptibility sources in quantitative susceptibility mapping: Theory and phantom validation with an in vivo application to multiple sclerosis lesions of different age (2021), J. Emmerich et al. [[Paper](https://www.sciencedirect.com/science/article/pii/S1090780721001221)]
  - A novel phantom with dia- and paramangetic substructure for quantitative susceptibility mapping and relaxometry (2021), J. Emmerich et al. [[Paper](https://www.sciencedirect.com/science/article/pii/S1120179721002593)]
* **DECOMPOSE-QSM**
  - DECOMPOSE quantitative susceptibility mapping (QSM) to sub-voxel diamagnetic and paramagnetic components based on gradient-echo MRI data (2021), J. Chen et al. [[Paper](https://www.sciencedirect.com/science/article/pii/S1053811921007503)]
* ***&chi;*-separation with only GRE (linear scaling)**
  - Susceptibility source separation from gradient echo data using magnitude decay modeling (2021), A. V. Dimov et al. [[Paper](https://onlinelibrary.wiley.com/doi/full/10.1111/jon.13014)]
  - Magnetic Susceptibility Source Separation Solely from Gradient Echo Data: Histological Validation (2022) A. V. Dimov et al. [[Paper](https://www.mdpi.com/2379-139X/8/3/127)]
* ***&chi;*-separataion-COSMOS**
  - chi-separation using multi-orientation data in invivo and exvivo brains: Visualization of  histology up to the resolution of 350 μm (2022), H.-G Shin et al. [[Paper](https://archive.ismrm.org/2022/0771.html)]
* **BUDA-SAGE**
  - Blip up-down acquisition for spin- and gradient-echo imaging (BUDA-SAGE) with self-supervised denoising enables efficient T2, T2*, para- and dia-magnetic susceptibility mapping (2022), Z. Zhang et al. [[Paper](https://onlinelibrary.wiley.com/doi/full/10.1002/mrm.29219)]
* **APART-QSM**
  - APART-QSM: An improved sub-voxel quantitative susceptibility mapping for susceptibility source separation using an iterative data fitting method (2023), Z. Li et al. [[Paper](https://www.sciencedirect.com/science/article/pii/S1053811923002999)]
* **WaveSep**
  - WaveSep: A Flexible Wavelet-Based Approach for Source Separation in Susceptibility Imaging (2023), Z. Fang et al. [[Paper](https://link.springer.com/chapter/10.1007/978-3-031-44858-4_6)]
* **Comparison between R2' based- and R2\* based-*&chi;*-separation**
  - Comparison between R2′-based and R2*-based χ-separation methods: A clinical evaluation in individuals with multiple sclerosis (2024), S. Ji et al. [[Paper](https://analyticalsciencejournals.onlinelibrary.wiley.com/doi/full/10.1002/nbm.5167)]
* **QSM-ARCS**
  - Quantitative susceptibility mapping for susceptibility source separation with adaptive relaxometric constant estimation (QSM-ARCS) from solely gradient-echo data (2024), H. Kan et al. [[Paper](https://www.sciencedirect.com/science/article/pii/S105381192400171X)] 
* ***&chi;*-sepnet**
  - *&chi;*-sepnet: Deep neural network for magnetic susceptibility source separation (2024), M. Kim et al. [[Paper](https://arxiv.org/abs/2409.14030)]
<br/>

**Application**

* **Multiple sclerosis**
  - χ-Separation Imaging for Diagnosis of Multiple Sclerosis versus Neuromyelitis Optica Spectrum Disorder (2022), W. Kim et al. [[Paper](https://pubs.rsna.org/doi/full/10.1148/radiol.220941)]
  - Quantitative magnetic resonance imaging biomarkers for cortical pathology in multiple sclerosis at 7 T (2022), S. Straub et al. [[Paper](https://github.com/SNU-LIST/chi-separation/edit/main/README.md)]
  - MR Susceptibility Separation for Quantifying Lesion Paramagnetic and Diamagnetic Evolution in Relapsing–Remitting Multiple Sclerosis (2024), Z. Zhu et al. [[Paper](https://onlinelibrary.wiley.com/doi/full/10.1002/jmri.29266)]
  - Quantifying Remyelination Using χ-Separation in White Matter and Cortical Multiple Sclerosis Lesions (2024), J. Muller et al. [[Paper](https://www.neurology.org/doi/full/10.1212/WNL.0000000000209604)]
  - χ-Separation as a Novel MRI Biomarker for Assessing Disease Progression in Multiple Sclerosis (2024), A, Rovira et al. [[Paper](https://www.neurology.org/doi/full/10.1212/WNL.0000000000209735)]
* **Depth-wise laminar profile**
  - Depth-wise profiles of iron and myelin in the cortex and white matter using χ-separation: A preliminary study (2023), S. Lee et al. [[Paper](https://www.sciencedirect.com/science/article/pii/S1053811923002045)]
* **Atlas**
  - Sub-voxel quantitative susceptibility mapping for assessing whole-brain magnetic susceptibility from ages 4 to 80 (2023), G. Lao et al. [[Paper](https://onlinelibrary.wiley.com/doi/full/10.1002/hbm.26487)]
  - A human brain atlas of χ-separation for normative iron and myelin distributions (2024), K. Min et al. [[Paper](https://analyticalsciencejournals.onlinelibrary.wiley.com/doi/full/10.1002/nbm.5226)]
* **Normal brain development**
  - Quantitative susceptibility mapping with source separation in normal brain development of newborns (2024), M. Jang et al. [[Paper](https://www.ajnr.org/content/early/2024/09/04/ajnr.A8488.abstract)]
<br/>

**Review**
  + So You Want to Image Myelin Using MRI: Magnetic Susceptibility Source Separation for Myelin Imaging (2024), J. Lee et al. [[Paper](https://www.jstage.jst.go.jp/article/mrms/advpub/0/advpub_rev.2024-0001/_article/-char/ja/)]

## Contacts
* snu.list.software@gmail.com
* sin4109@gmail.com (Hyeong-Geol Shin, PhD)
