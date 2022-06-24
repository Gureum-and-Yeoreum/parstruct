function [structed] = parstruct(structed,nvars,varname,n,varargin)

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