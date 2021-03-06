hold on

axis([-50 50 -50 50]);   %設邊界
axis equal;

[X,Y,BUTTON] = ginput(3);  %隨機點三點

X=[X(1) X(2) X(3) X(1)];   
Y=[Y(1) Y(2) Y(3) Y(1)];
plot(X,Y) ;     %將三點連起來
plot(0,0,'.b');   %點出原點
plot(X,Y,'.b');    %點出三點

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
    A = [X(2)-X(1) Y(2)-Y(1) ; X(3)-X(1) Y(3)-Y(1)];   %找兩條向量弄成矩陣
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
sum = 0;
if a == 0   
    for ii = 1:10^5
        K1 = (Y(2)-Y(1))*X(1) - (X(2)-X(1))*Y(1);
        K2 = (Y(3)-Y(1))*X(1) - (X(3)-X(1))*Y(1);
        K3 = (Y(2)-Y(3))*X(3) - (X(2)-X(3))*Y(3);

        %L1 = abs(K1/((X(2)-X(1))^2 + (Y(2)-Y(1))^2)^(1/2));
        %L2 = abs(K2/((X(3)-X(1))^2 + (Y(3)-Y(1))^2)^(1/2));
        %L3 = abs(K3/((X(2)-X(3))^2 + (Y(2)-Y(3))^2)^(1/2));
        
        %if (L1<L2)&&(L1<L3)
        %(x-X(3))*(X(2)-X(1)) + (y-Y(3))*(Y(2)-Y(1)) = 0
        D1 = ((Y(2)-Y(1))*X(3)-(X(2)-X(1))*Y(3)-K1)*(-K1);
        D2 = ((Y(3)-Y(1))*X(2)-(X(3)-X(1))*Y(2)-K2)*(-K2);
        D3 = ((Y(2)-Y(3))*X(1)-(X(2)-X(3))*Y(1)-K3)*(-K3);
        
        b = 0;
        
        if D1<0
            A = [X(2)-X(1) Y(2)-Y(1) ; Y(2)-Y(1) -X(2)+X(1)];
            B = [(X(2)-X(1))*X(3) + (Y(2)-Y(1))*Y(3) K1];
            C = B/A;
            
            X(3) = X(3) + 2*(C(1) - X(3));
            Y(3) = Y(3) + 2*(C(2) - Y(3));
            b = 1;
            sum = sum +1;
            X=[X(1) X(2) X(3) X(1)];   
            Y=[Y(1) Y(2) Y(3) Y(1)];
            plot(X,Y) ;     %將三點連起來
            plot(0,0,'.b');   %點出原點
            plot(X,Y,'.b');    %點出三點
        end
        %if (L2<L1)&&(L2<L3)
        if (b == 0)&&(D2<0)
            A = [X(3)-X(1) Y(3)-Y(1) ; Y(3)-Y(1) -X(3)+X(1)];
            B = [(X(3)-X(1))*X(2) + (Y(3)-Y(1))*Y(2) K2];
            C = B/A;
            
            X(2) = X(2) + 2*(C(1) - X(2));
            Y(2) = Y(2) + 2*(C(2) - Y(2));
            b = 1;
            sum = sum +1;
            X=[X(1) X(2) X(3) X(1)];   
            Y=[Y(1) Y(2) Y(3) Y(1)];
            plot(X,Y) ;     %將三點連起來
            plot(0,0,'.b');   %點出原點
            plot(X,Y,'.b');    %點出三點
        end
        %if (L3<L1)&&(L3<L2)
            %(x-X(3))*(X(2)-X(1)) + (y-Y(3))*(Y(2)-Y(1)) = 0
        if (b == 0)&&(D3<0)
            A = [X(2)-X(3) Y(2)-Y(3) ; Y(2)-Y(3) -X(2)+X(3)];
            B = [(X(2)-X(3))*X(1) + (Y(2)-Y(3))*Y(1) K3];
            C = B/A;
            
            X(1) = X(1) + 2*(C(1) - X(1));
            Y(1) = Y(1) + 2*(C(2) - Y(1));
            b = 1;
            sum = sum +1;
            X=[X(1) X(2) X(3) X(1)];   
            Y=[Y(1) Y(2) Y(3) Y(1)];
            plot(X,Y) ;     %將三點連起來
            plot(0,0,'.b');   %點出原點
            plot(X,Y,'.b');    %點出三點
        end
        A = [X(2)-X(1) Y(2)-Y(1) ; X(3)-X(1) Y(3)-Y(1)];   %找兩條向量弄成矩陣
        B = [-X(1) -Y(1)];
        C = B/A;
        if C(1)>0 && C(2)>0 && (C(1)+C(2) < 1)
            X=[X(1) X(2) X(3) X(1)];   
            Y=[Y(1) Y(2) Y(3) Y(1)];
            plot(X,Y) ;     %將三點連起來
            plot(0,0,'.b');   %點出原點
            plot(X,Y,'.b');    %點出三點
            disp(sum);
            break;
        end
    end
end