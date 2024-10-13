#  chi-separation toolbox (*&chi;*-separation, x-separation)

#  ⭐New version of the toolbox is now available for test! Don't hesitate to contact us for bugs and feedbacks: snu.list.software@gmail.com ⭐
#  ⭐This toolbox can process 3T datasets (other field stengths not properly processed. 7T processing will be updated soon). ⭐
#  ⭐If you have both GRE and SE data, you have options for conventional optimization (MEDI, iLSQR) and neural network (chi-sepnet-R2', better quality) ⭐
#  ⭐If you only have GRE data, neural network (chi-sepnet-R2*) will deliver high quality chi-separation maps ⭐
#  ⭐Neural networks can process resolution > 0.6 mm ⭐

* A toolbox for magnetic susceptibility source separation (**_&chi;_-separation or chi-separation; H. Shin et al., Neuroimage, 2021**). 

* The *&chi;*-separation toolbox includes the following features:
  - DICOM/NIFTI data compatibility
  - **QSMnet**: Quantitative susceptibility mapping (QSM) reconstruction algorithm based on deep neural network (QSMnet; J. Yoon et al., Neuroimage, 2018)
  - **_&chi;_-separation using _R_<sub>2</sub>' (or _R_<sub>2</sub>\* )**: Magnetic susceptibility source separation algorithms based on convex optimization (*&chi;*-separation; H. Shin et al., Neuroimage, 2021) that share similar contrasts and optimization parameters with either MEDI+0 (Liu et al., MRM, 2018) or iLSQR (Li et al., Neuroimage, 2015) algorithms. The toolbox also provides the option to use pseudo *R*<sub>2</sub> map if *R*<sub>2</sub> measurement is not availabe (using *R*<sub>2</sub>' is reconmmanded for accurate estimation).
  - **_&chi;_-sepnet using _R_<sub>2</sub>' (or _R_<sub>2</sub>\* )**: A U-Net-based neural network that reconstructs COSMOS-quality *&chi;*-separation using *R*<sub>2</sub>' and phase. In case *R*<sub>2</sub> is not measured, another neural network is trained to estimate *&chi;*-separation maps from *R*<sub>2</sub>\* and phase.
  - The toolbox also supports phase preprocessing (e.g. phase unwrapping and background removal) powered by MEDI, STI Suite, SEGUE, and mritools toolboxs (see the Chisep_script.m file for details). 

* Last update: June-11-2024 (Sooyeon Ji, Hyeong-Geol Shin, Jun-Hyeok Lee, Minjoon Kim, Kyeongseon Min)


## Requirements
* Common
  - MATLAB (tested in R2019a-R2021a and toolbox will fail any version before R2019a)

* Additional
  - For QSMnet and *&chi;*-sepnet, Deep Learning MATLAB Toolbox Converter for ONNX Model Format (https://www.mathworks.com/matlabcentral/fileexchange/67296-deep-learning-toolbox-converter-for-onnx-model-format)
  - For DICOM/NIFTI read and phase processing, see https://www.dropbox.com/sh/3zafav50bfnruuu/AABVVYpdsznsRXKy8YKK4ybla?dl=0

## Reference
* H. Shin, J. Lee, Y. H. Yun, S. H. Yoo, J. Jang, S.-H. Oh, Y. Nam, S. Jung, S. Kim, F. Masaki, W. Kim, H. J. Choi, J. Lee. *&chi;*-separation: Magnetic susceptibility source separation toward iron and myelin mapping in the brain. Neuroimage, 2021 Oct; 240:118371.
Please refer to [[link](https://github.com/SNU-LIST/chi-separation/blob/main/LIST_OF_PAPERS.md)]


## Contacts
* snu.list.software@gmail.com
* sin4109@gmail.com (Hyeong-Geol Shin, PhD)
