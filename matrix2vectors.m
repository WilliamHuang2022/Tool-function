function vectors=matrix2vectors(data_set)
amount=size(data_set,3);
vectors=[];
for i=1:amount
    matrix=data_set(:,:,i);
    vector=matrix(:);
    vectors=[vectors vector];
end
vectors=vectors;