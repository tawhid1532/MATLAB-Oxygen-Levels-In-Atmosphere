function r=OxygenLevelsInAtmosphere(X)
% X=input('Enter a Year = ');
x=[1992 1996 2000 2004 2008 2012 2016];
y=[-114.02 -198.79 -243.06 -343.49 -452.19 -489.99 -642.13];

if( X>= 1990 && X <= 2050)
        
dely0=y(2)-y(1);
dely1=y(3)-y(2);
dely2=y(4)-y(3);
dely3=y(5)-y(4);
dely4=y(6)-y(5);
dely5=y(7)-y(6);
%fprintf('\n%f\n%f\n%f\n%f\n%f\n%f\n\n',dely0,dely1,dely2,dely3,dely4,dely5);


del2y0=dely1-dely0;
del2y1=dely2-dely1;
del2y2=dely3-dely2;
del2y3=dely4-dely3;
del2y4=dely5-dely4;
% fprintf('%f\n%f\n%f\n%f\n%f\n\n',del2y0,del2y1,del2y2,del2y3,del2y4);

del3y0=del2y1-del2y0;
del3y1=del2y2-del2y1;
del3y2=del2y3-del2y2;
del3y3=del2y4-del2y3;
% fprintf('%f\n%f\n%f\n%f\n\n',del3y0,del3y1,del3y2,del3y3);

del4y0=del3y1-del3y0;
del4y1=del3y2-del3y1;
del4y2=del3y3-del3y2;
% fprintf('%f\n%f\n%f\n\n',del4y0,del4y1,del4y2);

del5y0=del4y1-del4y0;
del5y1=del4y2-del4y1;
% fprintf('%f\n%f\n\n',del5y0,del5y1);

del6y0=del5y1-del5y0;
% fprintf('%f\n\n',del6y0);

xn=2016;
h=4;
u=(X-xn)/h;

backward_law=(-642.13)+(u*dely5)+((u*(u+1)*del2y4)/2)+((u*(u+1)*(u+2)*del3y3)/6)+((u*(u+1)*(u+2)*(u+3)*del4y2)/24)+((u*(u+1)*(u+2)*(u+3)*(u+4)*del5y1)/120)+((u*(u+1)*(u+2)*(u+3)*(u+4)*(u+5)*del6y0)/720);
% fprintf('The decreasing of Oxygen level is: %.2f Per Meg Unit\nReduce Pollution.\n',backward_law);
r=backward_law;
end
end