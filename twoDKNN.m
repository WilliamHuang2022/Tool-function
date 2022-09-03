function accuracy=twoDKNN(train_set,test_set,train_number,test_number,k)
%输入的都是三维矩阵数据集
accurate_number=0;
for i=1:size(test_set,3)
    distance_list=[];
    for j=1:size(train_set,3)
        dist=norm(train_set(:,:,j)-test_set(:,:,i),'fro');
        distance_list=[distance_list dist];
    end
    arranged_distance_list=sort(distance_list);
    chosed_distance_list=arranged_distance_list(1:k);
    kind_list_of_train=[];
    for m=1:k
        site=find(distance_list==chosed_distance_list(m));
        kind=ceil(site/train_number);                                              %训练集一类的个数
        kind_list_of_train=[kind_list_of_train kind];
    end
    kind_of_train=mode(kind_list_of_train);
    kind_of_test=ceil(i/test_number);                                                %测试集一类的个数
    if(kind_of_train==kind_of_test)
        accurate_number=accurate_number+1;
    end
end
accuracy=accurate_number/size(test_set,3);