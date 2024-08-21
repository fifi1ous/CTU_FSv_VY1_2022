clc; clear; format long G
fid=fopen("vysledky_matlab.txt",'r');
bodym=fscanf(fid,'%f %f %f',[3,inf])';
fclose(fid);

fid=fopen("bp.txt",'r');
body=fscanf(fid,'%f %f %f',[3,inf])';
fclose(fid);
body=sortrows(body,1);
bodym=sortrows(bodym,1);

T_m=[(bodym(3,2)+bodym(5,2))/2,(bodym(3,3)+bodym(5,3))/2];
T=[(body(3,2)+body(5,2))/2,(body(3,3)+body(5,3))/2];

M=bodym(3,2:3);
H=body(3,2:3);

smerM=atan2(M(1)-T_m(1),M(2)-T_m(2));
smerH=atan2(H(1)-T(1),H(2)-T(2));
toc=smerH-smerM;
tocg=toc/pi*200

ty=H(1)-(M(2)*sin(toc)+M(1)*cos(toc));
tx=H(2)-(M(2)*cos(toc)-M(1)*sin(toc));

Y=ty+(bodym(:,3).*sin(toc)+bodym(:,2).*cos(toc));
X=tx+(bodym(:,3).*cos(toc)-bodym(:,2).*sin(toc));


p=[bodym(:,1),Y,X]
fid=fopen('souradnice.txt','w')
fprintf(fid,'%d %10.4f %11.4f\n',p')
fclose(fid)
