#  &chi;-separation toolbox

* The GUI-based MATLAB toolbox including algorithms for magnetic susceptibility source separation based on convex optimization (**&chi;-separation; Shin et al., Neuroimage, 2021**) and deep learning-based reconstruction (**&chi;-sepnet; Kim at al., 30th Annual Meeting of ISMRM, 2022**). The toolbox also offers phase preprocessing (e.g. phase unwrapping and background removal) powered by MEDI and STI Suite toolboxs (see https://www.dropbox.com/sh/3zafav50bfnruuu/AABVVYpdsznsRXKy8YKK4ybla?dl=0 for details). 

* The &chi;-separation toolbox includes the following features:
  - **&chi;-separation using R2' (or** **R2** * **)**: magnetic susceptibility source separation algorithms based on convex optimization that share similar contrasts and optimization parameters with either MEDI+0 (Liu et al., MRM, 2018) or iLSQR (Li et al., Neuroimage, 2015) algorithms. The toolbox also provides the option to use pseudo R2 map if R2 measurement is not availabe (using R2' is reconmmanded for accurate estimation).
  - **&chi;-sepnet using R2' (or** **R2** * **)**: a U-Net-based neural network that reconstructs &chi;-separation using R2' and phase. In case R2 is not measured, another neural network is trained to estimate &chi;-separation maps from R2* and phase.

* Last update: Mar-07-2023

# Download
* https://www.dropbox.com/sh/8q7y005opitpxlz/AABtsSJDbEjJpvQmfQRwtjdpa?dl=0

# Reference

* H. Shin, J. Lee, Y. H. Yun, S. H. Yoo, J. Jang, S.-H. Oh, Y. Nam, S. Jung, S. Kim, F. Masaki, W. Kim, H. J. Choi, J. Lee. &chi;-separation: Magnetic susceptibility source separation toward iron and myelin mapping in the brain. Neuroimage, 2021 Oct; 240:118371.
* M. Kim, H. Shin, C. Oh, H. Jeong, S. Ji, H. An, J. Kim, J. Jang, B. Bilgic, and J. Lee, "Chi-sepnet: Susceptibility source separation using deep neural network", 30th Annual Meeting of International Society of Magnetic Resonance in Medicine, 2022; 2464.


# Requirements

* Common
  - MATLAB (tested in ver. R2019a-R2021a)

* Additional
  - For &chi;-sepnet, Deep Learning MATLAB Toolbox Converter for ONNX Model Format (https://www.mathworks.com/matlabcentral/fileexchange/67296-deep-learning-toolbox-converter-for-onnx-model-format)
  - For DICOM read and phase processing, see https://www.dropbox.com/sh/3zafav50bfnruuu/AABVVYpdsznsRXKy8YKK4ybla?dl=0


# License
We provide software license for academic research purpose only and NOT for commercial or clinical use. To renew the license, please contact snu.list.software@gmail.com. For commercial use of our software, contact us (snu.list.software@gmail.com) with the following information:

Name:

Affiliation:

Software:

Purpose:


# Notes
The current &chi;-sepnet is  designed to process axial orientation image only (&chi;-sepnet for arbitrary orientation will be updated before Mar, 14, 2023).

# Contact
* snu.list.software@gmail.com
