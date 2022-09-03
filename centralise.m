function matrix=centralise(matrix1)
%输入列向量矩阵
matrix=matrix1-mean(matrix1,2);