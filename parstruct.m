function [structed] = parstruct(structed,nvars,varname,n,varargin)

% Returns for loop data within parfor loop to a structure.
%
% Input variables
% 
% structed: name of the structure
% nvars: number of input variables
% varname: fieldnames of the structure
% n: for loop index (use n = 1 to save noniterative data or to define fieldname for the first time and save data. n must be an positive integer)
% varargin: data to be structed, Variable-length input argument
% 
% Output variable
% 
% structed: structed data of each parfor loop
% 
% Caution
% 
% nvars and the size of varargin, and varname must be the same
% n IS NOT the index of parfor loop
% must define fieldname before save date (read description of input variable n)
%
%
% BSD 3-Clause License
% 
% Copyright (c) 2022, Gureum-and-Yeoreum
% All rights reserved.
% 
% Redistribution and use in source and binary forms, with or without
% modification, are permitted provided that the following conditions are met:
% 
% 1. Redistributions of source code must retain the above copyright notice, this
%    list of conditions and the following disclaimer.
% 
% 2. Redistributions in binary form must reproduce the above copyright notice,
%    this list of conditions and the following disclaimer in the documentation
%    and/or other materials provided with the distribution.
% 
% 3. Neither the name of the copyright holder nor the names of its
%    contributors may be used to endorse or promote products derived from
%    this software without specific prior written permission.
% 
% THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
% AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
% IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
% DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
% FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
% DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
% SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
% CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
% OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
% OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

n_field = size(varname,2);

if size(varname,1) ~= 1
    varname = varname.';
end

if size(varargin,2) ~= nvars
    error("nvars and varargin size does not same")
end

if nvars ~= n_field
    error("nvars and varname size does not same")
end

if n == 1
    for i = 1:nvars
        structed.(varname(i)) = cell2mat(varargin(i));
    end
else
    for i = 1:nvars
        structed.(varname(i)) = cat(ndims(varargin(i))+1,structed.(varname(i)),cell2mat(varargin(i)));
    end
end

end