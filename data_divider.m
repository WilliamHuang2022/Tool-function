function [X,testX]=data_divider(data_X,tranum,tesnum)
X=[];
testX=[];
len=size(data_X);
if length(len)==3
    c=len(3)/(tranum+tesnum);
    X=zeros(size(data_X,1),size(data_X,2),c*tranum);
    testX=zeros(size(data_X,1),size(data_X,2),c*tesnum);
    for i=1:c
        choose_list=randperm(tranum+tesnum);
        X(:,:,(i-1)*tranum+1:i*tranum)=data_X(:,:,((i-1)*(tranum+tesnum)+choose_list(1:tranum)));
        testX(:,:,(i-1)*tesnum+1:i*tesnum)=data_X(:,:,((i-1)*(tranum+tesnum)+choose_list((tranum+1):end)));
    end
    X=matrix2vectors(X);
    testX=matrix2vectors(testX);
elseif length(len)==2
    if size(data_X,1)==1024 %判断为向量为竖放
        c=len(2)/(tranum+tesnum);
        X=zeros(size(data_X,1),c*tranum);
        testX=zeros(size(data_X,1),c*tesnum);
        for i=1:c
            choose_list=randperm(tranum+tesnum);
            X(:,(i-1)*tranum+1:i*tranum)=data_X(:,((i-1)*(tranum+tesnum)+choose_list(1:tranum)));
            testX(:,(i-1)*tesnum+1:i*tesnum)=data_X(:,((i-1)*(tranum+tesnum)+choose_list((tranum+1):end)));
        end

    elseif  size(data_X,2)==1024 %判断为向量横放
        c=len(1)/(tranum+tesnum);
        X=zeros(size(data_X,2),c*tranum);
        testX=zeros(size(data_X,2),c*tesnum);
        for i=1:c
            choose_list=randperm(tranum+tesnum);
            X(:,(i-1)*tranum+1:i*tranum)=data_X(((i-1)*(tranum+tesnum)+choose_list(1:tranum)),:)';
            testX(:,(i-1)*tesnum+1:i*tesnum)=data_X(((i-1)*(tranum+tesnum)+choose_list((tranum+1):end)),:)';
        end
    end
end

end