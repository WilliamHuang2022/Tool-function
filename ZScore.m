function vectors=ZScore(data_matrix)
%输入列向量矩阵
d=size(data_matrix,1);
n=size(data_matrix,2);
vectors=zeros(d,n);
for i=1:d
    row=data_matrix(i,:);
    if std(row,1)~=0
        row=(row-mean(row))/std(row,1);
    else
        row=row/mean(row);
    end
    vectors(i,:)=row;
end