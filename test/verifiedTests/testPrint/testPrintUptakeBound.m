% The COBRAToolbox: testPrintUptakeBound.m
%
% Purpose:
%     - testPrint tests the functionality of printUptakeBound
%       and compares it to expected data.
%
% Authors:
%     - Lemmer El Assal March 2017
%

% save the current path
currentDir = pwd;

% initialize the test
cd(fileparts(which(mfilename)));

load([CBTDIR, filesep, 'test' filesep 'models' filesep 'ecoli_core_model.mat'], 'model');

% remove old generated file
delete('printUptakeBound.txt');

diary('printUptakeBound.txt');
ref_upInd = [23; 28; 31; 32; 35; 36; 37];
upInd = printUptakeBound(model);
diary off;

assert(isequal(ref_upInd, upInd));
text1 = fileread('printUptakeBound.txt');
text2 = fileread('refData_printUptakeBound.txt');
assert(isequal(text1, text2));

% remove the generated file
delete('printUptakeBound.txt');

% change the directory
cd(currentDir)
