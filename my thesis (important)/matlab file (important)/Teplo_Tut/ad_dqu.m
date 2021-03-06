function dy=ad_dqu(t,y);% script file ABC_dqu.m
global A  Rs Rr Rmu pol Jr Mnom w1 Km Kj Un k OMEG
%===================================
% Variable potokosceplenia PSI:
% Potokosceplenia of stator
% y(1)=PsiA; y(2)=PsiB; y(3)=PsiC;
% Potokosceplenia of rotora
% y(4)=Psid;  y(5)=Psiq; 
% Paschet tokov Ia,Ib,Ic,Id,Iq
%===================================
Ia=A(1,1)*y(1)+A(1,2)*y(2)+A(1,3)*y(3)+A(1,4)*y(4)+A(1,5)*y(5);
Ib=A(2,1)*y(1)+A(2,2)*y(2)+A(2,3)*y(3)+A(2,4)*y(4)+A(2,5)*y(5);
Ic=A(3,1)*y(1)+A(3,2)*y(2)+A(3,3)*y(3)+A(3,4)*y(4)+A(3,5)*y(5);
Id=A(4,1)*y(1)+A(4,2)*y(2)+A(4,3)*y(3)+A(4,4)*y(4)+A(4,5)*y(5);
Iq=A(5,1)*y(1)+A(5,2)*y(2)+A(5,3)*y(3)+A(5,4)*y(4)+A(5,5)*y(5);
Ima=(Ia+Id);
Imb=(Ib-Id/2+Iq*sqrt(3)/2);
Imc=(Ic-Id/2-Iq*sqrt(3)/2);
%================================================================
% Diff. equet. for current statora 
dy(1)=Un*sin(w1*t)-Rs*Ia -Rmu*Ima;
dy(2)=Un*sin(w1*t-2*pi/3)-Rs*Ib-Rmu*Imb;
dy(3)=Un*sin(w1*t+2*pi/3)-Rs*Ic-Rmu*Imc;
%=====================================
dy(4)=-Rr*Id-y(5)*OMEG;
dy(5)=-Rr*Iq+y(4)*OMEG;
%=====================================
k=k+1;
if k==500 ;
disp('     < Callculation Diff. Equetion >... N=500');
end;
if k==1500 ;
disp('     < Callculation Diff. Equetion > ... N=1500');
end;
if k==5000
  disp('   < Callculation Diff. Equetion > ... N=5000');
end;  
%  dy=[dy(1),dy(2),dy(3),dy(4),dy(5),dy(6)]';
  dy=[dy(1),dy(2),dy(3),dy(4),dy(5)]';
return
%The  end program.