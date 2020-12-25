# final_project-tony050290
final_project-tony050290 created by GitHub Classroom

project 5

**題目**

任意點平面上三點, 判斷原點是否在這三點所圍成的三角形內.

在裡面，輸出inside;在外面，輸出outside;若三點共線，輸出共線；出現共點，輸出共點

若判斷在外面，便透過鏡射的方式移動三角形，使原點在裡面

**做法**

Fix一個點，找出到另兩點與原點的向量
到兩點的向量線性組合成到原點的向量(反除

A = [X(2)-X(1) Y(2)-Y(1) ; X(3)-X(1) Y(3)-Y(1)]
B = [-X(1) -Y(1)];
C = B/A;
 
如果係數均大於0 且相加小於1，就在裡面，其餘在外面
如果在外面的話，任兩頂點組成一條線，若第三點與原點不同側，就鏡射第三個點，直到原點落在裡面

1. 先找出三條線的常數

   K1 = (Y(2)-Y(1))*X(1) - (X(2)-X(1))*Y(1);

2. 再將第三點與原點帶入線的方程，相乘小於0就代表異側

   D1 = ((Y(2)-Y(1))*X(3)-(X(2)-X(1))*Y(3)-K1)*(-K1);

3. 假設(x,y)在線上，與第三點所形成的向量跟線的向量內積=0，得到的方程式與線的方程解聯立(反除


   A = [X(2)-X(1) Y(2)-Y(1) ; Y(2)-Y(1) -X(2)+X(1)];

   B = [(X(2)-X(1))*X(3) + (Y(2)-Y(1))*Y(3) K1];
            
   C = B/A;

4. 得到(x,y)值後與第三點形成向量，將第三點移動兩倍向量形成鏡射

   X(3) = X(3) + 2*(C(1) - X(3));
            
   Y(3) = Y(3) + 2*(C(2) - Y(3));

5. 最後輸出鏡射幾次
