% The COBRAToolbox: testPrintFluxVector.m
%
% Purpose:
%     - testPrintFluxVector tests the functionality of printFluxVector
%       and compares it to expected data.
%
% Authors:
%     - Sylvain Arreckx March 2017
%

% save the current path
currentDir = pwd;

% initialize the test
initTest(fileparts(which(mfilename)));

load('ecoli_core_model', 'model');

% remove old generated file
delete('printFluxVector.txt');

% initialize the random number generator to make the results in this test repeatable.
rng('default');
flux = randn(length(model.rxns), 1);

diary('printFluxVector.txt');
printFluxVector(model, flux);
diary off

text1 = fileread('refData_printFluxVector.txt');
text2 = fileread('printFluxVector.txt');
assert(isequal(text1, text2));

printFluxVector(model, flux, true, false, 1, 'printFluxVector.txt', [], true);
text1 = fileread('refData_printFluxVectorFormula.txt');
text2 = fileread('printFluxVector.txt');
assert(isequal(text1, text2));

% remove the generated file
delete('printFluxVector.txt');

% change the directory
cd(currentDir)
