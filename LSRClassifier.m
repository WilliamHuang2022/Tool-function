function accuracy=LSRClassifier(X,testX,tranum,tesnum)
[d,n]=size(X);
c=n/tranum;
X=[X;ones(1,n)];
testX=[testX;ones(1,c*tesnum)];
[d,n]=size(X);

Y=zeros(n,c);
for i=1:c
    Y(1+(i-1)*tranum:i*tranum,i)=1;
end
W=(X*X')^(-1)*X*Y;

testY=testX'*W;
accuratenumber=0;
for i=1:n
    testy=testY(i,:);
    site=find(testy==max(testy));
    if site==ceil(i/tesnum)
        accuratenumber=accuratenumber+1;
    end
end
accuracy=accuratenumber/n;

end