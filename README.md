#  &chi;-separation 

* The MATLAB toolbox includes convex optimization-based algorithms for magnetic susceptibility source separation (&chi;-separation; **Shin et al., Neuroimage, 2021**) and deep learning-based reconstruction of &chi;-separation (&chi;-sepnet; **Kim at al., 30th Annual Meeting of ISMRM (2464), 2022**). The phase preprocessing of the &chi;-separation toolbox (e.g. phase unwrapping and background removal) is powered by MEDI toolbox and STI Suite (see [https://www.dropbox.com/sh/3zafav50bfnruuu/AABVVYpdsznsRXKy8YKK4ybla?dl=0]). The convex optimization-based algorithm shares similar contrasts and optimization parameters with either MEDI+0 (Liu et al., MRM, 2018) or iLSQR (Li et al., Neuroimage, 2015) algorithm.
* Last update: Mar,07,2023



# Reference

* H.-G. Shin, J. Lee, Y. H. Yun, S. H. Yoo, J. Jang, S.-H. Oh, Y. Nam, S. Jung, S. Kim, F. Masaki, W. Kim, H. J. Choi, J. Lee. &chi;-separation: Magnetic susceptibility source separation toward iron and myelin mapping in the brain. Neuroimage, 2021 Oct; 240:118371.
* M. Kim, H. Shin, C. Oh, H. Jeong, S. Ji, H. An, J. Kim, J. Jang, B. Bilgic, and J. Lee, "Chi-sepnet: Susceptibility source separation using deep neural network", 30th Annual Meeting of International Society of Magnetic Resonance in Medicine, 2022; 2464.


# Requirements

* MATLAB (tested in ver. R2019a-R2021a)
* Required MATLAB toolbox for &chi;-sepnet     : Deep Learning Toolbox Converter for ONNX Model Format (https://www.mathworks.com/matlabcentral/fileexchange/67296-deep-learning-toolbox-converter-for-onnx-model-format)
* Requirements for DICOM read and phase processing: see [https://www.dropbox.com/sh/3zafav50bfnruuu/AABVVYpdsznsRXKy8YKK4ybla?dl=0]


# License
We provide software license for academic research purpose only and NOT for commercial or clinical use (please contact snu.list.software@gmail.com for license). For commercial use of our software, contact us (snu.list.software@gmail.com) for licensing via Seoul National University.Please email to “snu.list.software@gmail.com” with the following information:
Name:
Affiliation:
Software:
Purpose:

# Notes
The current &chi;-sepnet is only designed to process axial orientation image (&chi;-sepnet for arbitrary orientation will be updated before Apr, 2023).

# Contact
* primary:   snu.list.software@gmail.com
* secondary: sin4109@gmail.com (Hyeong-Geol Shin, Ph.D. @ Johns Hopkins University)
