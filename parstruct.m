function [structed] = parstruct(structed,nvars,varname,n,varargin)

if size(varname,1) ~= 1
    varname = varname.';
end

n_field = size(varname,2);

if nvars ~= n_field
    error("Can not match variables and fields")
end

if n == 1
    varargin = varargin.';
    structed = cell2struct(varargin,varname,1);
else
    for i = 1:nvars
        structed.(varname(i)) = cat(ndims(varargin(i))+1,structed.(varname(i)),cell2mat(varargin(i)));
    end
end

end