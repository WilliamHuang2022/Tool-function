function accuracy=regressionclassifier(testdata,W,b,withinnumber)
%输入二维测试集
accuratenumber=0;
n=size(testdata,2);
%testvectors=matrix2vectors(testdata);
testY=testdata'*W+b';
for i=1:n
    testy=testY(i,:);
    site=find(abs(testy-1)==min(abs(testy-1)));
    if site==ceil(i/withinnumber)
        accuratenumber=accuratenumber+1;
    end
end
accuracy=accuratenumber/n;