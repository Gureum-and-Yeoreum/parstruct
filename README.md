# parstruct
Returns for loop data within parfor loop to a structure.

[structed] = parstruct(structed,nvars,varname,n,varargin)

-----
Input variables

structed: name of the structure  
nvars: number of input variables  
varname: fieldnames of the structure  
n: for loop index (use n = 1 to save noniterative data or to define fieldname for the first time and save data. n must be an positive integer)  
varargin: data to be structed, Variable-length input argument  

-----
Output variable

structed: structed data of each parfor loop

-----
Caution

nvars and the size of varargin, and varname must be the same  
n IS NOT the index of parfor loop  
must define fieldname before save date (read description of input variable n)  

-----
How to use & Example

![image](https://user-images.githubusercontent.com/106311219/175457973-a47035b0-9b6d-4421-b71a-9fa903e1acaa.png)

-----
parfor loop condition: initVal = 1, endVal = 3  
for loop condition: n_end = 5  

the result struct is 

![image](https://user-images.githubusercontent.com/106311219/175456626-dc1a1b8f-a1a4-4fd3-9b22-6593109f17d0.png)

Field1 and Field2 is iterative data of 17 * 17 matrix with 5 for loop iterations. hence it becomes 17 * 17 * 5 matrix  
Noniter1 and Noniter2 is noniterative data
