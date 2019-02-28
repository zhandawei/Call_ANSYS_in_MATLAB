% -----------------------------------------------------------------
% This code try to use MATLAB to call the ANSYS software to do FEM anlysis.
% First, the MATLAB write the design parameters X into input file (e.g. para_in.txt);
% Then, MATLAB call ANSYS software to excute the APDL file (e.g. apdl.txt). 
% The APDL file reads the parameters from the input file and writes the analysis 
% result to the output file (e.g. para_out.txt).
% Last, MATLAB reads the results from the output file.
% -----------------------------------------------------------------
% This code can save you a lot of times when multiple designs should be
% computed using ANSYS, especially for tasks like approximation and optimization.
% -----------------------------------------------------------------
% Note: you should replace the apdl.txt with your own code.
% Be careful with the beginning and end of the apdl.txt.
% -----------------------------------------------------------------
% Dawei Zhan
% zhandawei{at}swjtu.edu.cn
% 25/09/2015   First submit
% 10/03/2017   update this code to do multiple analysis 
% -----------------------------------------------------------------
clc;clearvars;
% the design point, each row represent a design point
design_point=[1,2,3,4,5,6;
             10,20,30,40,50,60;
             100,200,300,400,500,600];
% replace by your ANSYS path
ANSYS_path='C:\Program Files\ANSYS Inc\v121\ansys\bin\WINX64\ANSYS121';
% the file name of APDL code
APDL_name='apdl.txt';
% the file name of the input parameter
input_file_name='para_in.txt';
% the file name of the out parameter
output_file_name='para_out.txt';
% add the quotes to ansys path
ANSYS_path=strcat('"',ANSYS_path,'"');
% number of analysis
num_design = size(design_point,1);

for ii = 1:num_design
    % write the ii th design point to para_in.txt
    dlmwrite(input_file_name,design_point(ii,:),'delimiter',' ','precision','%8.3f','newline','pc');
    % call the ANSYS software, do the FEM anlysis
    system(sprintf('%s -b -p ane3fl -i %s -o out.txt',ANSYS_path,APDL_name));
    % read the result from para_out.txt
    Result(ii,:)=load(output_file_name)';
end




