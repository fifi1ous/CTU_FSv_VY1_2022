clc; clear; format long G
%% načítnání + otevření protokolu
fid=fopen("bp_m.txt",'r');
SS=fscanf(fid,'%f %f %f',[3,inf])';
fclose(fid);
fid=fopen("zapisnik.txt",'r');
mer=fscanf(fid,'%d %f %f %f %f %f',[6,inf])';
fclose(fid);
fid=fopen("protokol.txt",'w');
fprintf(fid,'Seznam souřadnic:              [x]              [Y]           \n');
fprintf(fid,'                    %4.f   %10.4f      %11.4f      \n',SS');
%%  výpočet souřadnic
[st]=find(mer(:,1)~=0); d=length(st);
[st2]=find(mer(:,1)==0);
cislovani_vypoctu=1;

if d==1
    stan=mer(st(1),1:2);
    body=mer(st(1)+1:end,2:end);
    fprintf(fid,'\n\n[%d]',cislovani_vypoctu);
    fprintf(fid,' zápisník měření');
    fprintf(fid,'                                       stanovisko:     %4.f    %6.4f\n\n',stan);
    fprintf(fid,'    bod     šikmá délka     vodorovný úhel      zenitový úhel      výška cíle\n');
    fprintf(fid,'   %4.f  %10.4f         %8.4f            %8.4f            %6.4f\n',body');
    body=[body,body(:,3:4)./200.*pi];
    body=[body,body(:,2).*sin(body(:,7))];
    [OR,STAN,zap]=VYH_OR(stan,SS,body);
    [OP,orientace,op,roz]=orientacni_posun(zap,OR,STAN);
    fprintf(fid,'\nSměrník:       %8.4f\n',orientace(3));
    roz=[OR(:,1),roz];
    if length(roz)~=1
        fprintf(fid,'\nOrientační posun:       %8.4f\n',op);
        roz=[OR(:,1),roz];
        fprintf(fid,'Směr na orientaci      Rozdíl od orientačního posunu            Rozdíl od délek ze souřadnic\n');
        fprintf(fid,'   %6d                     %10.4f                              %10.3f\n',roz')
    else
        roz=[OR(:,1),roz];
        fprintf(fid,'\nSměrník:       %8.4f\n',op);
        fprintf(fid,'Směr na orientaci            Rozdíl od délek ze souřadnic\n');
        fprintf(fid,'   %6d                          %10.3f\n',roz')
    end
    [zap]=RED_ZAP(body,OR);
    [SS,BODY]=vypocet(OP,STAN,zap,SS);
    fprintf(fid,'\nVypočtené souřadnice:            [x]              [Y]           \n');
    fprintf(fid,'                    %4.f   %10.4f      %11.4f      \n',BODY');
    %graf měření
    %graf vsšech bodů 2D
else
    for n=1:(d-1)
        stan=mer(st(n),1:2);
        [f]=find(st(n)<st2 & st(n+1)>st2);  bd=st2(f);
        body=mer(st(n)+1:st(n)+(length(bd)),2:end);
        fprintf(fid,'\n\n[%d]',cislovani_vypoctu);
        cislovani_vypoctu=cislovani_vypoctu+1;
        fprintf(fid,' zápisník měření');
        fprintf(fid,'                                       stanovisko:     %4.f    %6.4f\n\n',stan);
        fprintf(fid,'    bod     šikmá délka     vodorovný úhel      zenitový úhel      výška cíle\n');
        fprintf(fid,'   %4.f  %10.4f         %8.4f            %8.4f            %6.4f\n',body');
        body=[body,body(:,3:4)./200.*pi];
        body=[body,body(:,2).*sin(body(:,7))];
        [OR,STAN,zap]=VYH_OR(stan,SS,body);
        [OP,orientace,op,roz]=orientacni_posun(zap,OR,STAN);
        if length(roz)~=1
            fprintf(fid,'\nOrientační posun:       %8.4f\n',op);
            roz=[OR(:,1),roz];
            fprintf(fid,'Směr na orientaci      Rozdíl od orientačního posunu            Rozdíl od délek ze souřadnic\n');
            fprintf(fid,'   %6d                     %10.4f                              %10.3f\n',roz')
        else
            roz=[OR(:,1),roz];
            fprintf(fid,'\nSměrník:       %8.4f\n',op);
            fprintf(fid,'Směr na orientaci            Rozdíl od délek ze souřadnic\n');
            fprintf(fid,'   %6d                          %10.3f\n',roz')
        end
        [zap]=RED_ZAP(body,OR);
        [SS,BODY]=vypocet(OP,STAN,zap,SS);
        fprintf(fid,'\nVypočtené souřadnice:            [x]              [Y]           \n');
        fprintf(fid,'                    %4.f   %10.4f      %11.4f      \n',BODY');
    end
    stan=mer(st(d),1:2);
    body=mer(st(d)+1:end,2:end);
    fprintf(fid,'\n\n[%d]',cislovani_vypoctu);
    fprintf(fid,' zápisník měření');
    fprintf(fid,'                                       stanovisko:     %4.f    %6.4f\n\n',stan);
    fprintf(fid,'    bod     šikmá délka     vodorovný úhel      zenitový úhel      výška cíle\n');
    fprintf(fid,'   %4.f  %10.4f         %8.4f            %8.4f            %6.4f\n',body');
    body=[body,body(:,3:4)./200.*pi];
    body=[body,body(:,2).*sin(body(:,7))];
    [OR,STAN,zap]=VYH_OR(stan,SS,body);
    [OP,orientace,op,roz]=orientacni_posun(zap,OR,STAN);
    if length(roz)~=1
        fprintf(fid,'\nOrientační posun:       %8.4f\n',op);
        roz=[OR(:,1),roz];
        fprintf(fid,'Směr na orientaci      Rozdíl od orientačního posunu            Rozdíl od délek ze souřadnic\n');
        fprintf(fid,'   %6d                     %10.4f                              %10.3f\n',roz')
    else
        roz=[OR(:,1),roz];
        fprintf(fid,'\nSměrník:       %8.4f\n',op);
        fprintf(fid,'Směr na orientaci            Rozdíl od délek ze souřadnic\n');
        fprintf(fid,'   %6d                          %10.3f\n',roz')
    end
    [zap]=RED_ZAP(body,OR);
    [SS,BODY]=vypocet(OP,STAN,zap,SS);
    fprintf(fid,'\nVypočtené souřadnice:            [x]              [Y]           \n');
    fprintf(fid,'                    %4.f   %10.4f      %11.4f      \n',BODY');
end
figure (2)
plot((-SS(:,2)),(-SS(:,3)),'-r*','LineStyle','none')