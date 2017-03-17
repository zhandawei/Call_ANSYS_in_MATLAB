# Call ANSYS in MATLAB
This code try to use MATLAB to call the ANSYS software to do FEM anlysis, which can save you a lot of times when you want to do multiple design computations using ANSYS, especially for tasks like approximation and optimization. 

It works as following:

1. MATLAB write the design parameters X into input file (e.g. para_in.txt);
2. MATLAB call ANSYS software to excute the APDL file (e.g. apdl.txt). 
3. The APDL file reads the parameters from the input file and writes the analysis result to the output file (e.g. para_out.txt).
4. MATLAB reads the  results from the output file.

