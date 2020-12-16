hold on
axis([-50 50 -50 50]);

[X,Y,BUTTON] = ginput(3);

X=[X(1) X(2) X(3) X(1)];
Y=[Y(1) Y(2) Y(3) Y(1)];
plot(X,Y) ;
plot(0,0,'.b');
plot(X,Y,'.b');

a = 0;
if ((X(1)==X(2))&&(Y(1)==Y(2)))||((X(2)==X(3)&&(Y(2)==Y(3))))||((X(3)==X(1)&&(Y(3)==Y(1))))
    disp('共點');
    a = 1;
end

if a==0
    if abs(X(2)-X(1)) / (Y(2)-Y(1)) == abs(X(3)-X(1)) / (Y(3)-Y(1))
        disp('共線');
        a = 1;
    end
end

if a==0
    A = [X(2)-X(1) Y(2)-Y(1) ; X(3)-X(1) Y(3)-Y(1)];
    B = [-X(1) -Y(1)];
    C = B/A;
    if C(1)>0 && C(2)>0 && (C(1)+C(2) < 1)
        disp('inside');
        a = 1;
    end
end
if a == 0
    disp('outside');
end