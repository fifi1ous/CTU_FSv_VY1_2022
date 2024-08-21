function [OR,STAN,zap]=VYH_OR(ST,SS,ZAP)

SS1=SS(:,1); ZAP1=ZAP(:,1); ST1=ST(:,1);
%% orientace 
q=1;
for n=1:length(ZAP1)
    for m=1:length(SS1)
        if SS1(m)==ZAP1(n)
            OR(q,:)=SS(m,:);
            zap(q,:)=ZAP(n,:);
            q=q+1;
        end
    end
end

%% stanovisko
r=1;n=length(SS1);
while r==1
    if ST1==SS1(n)
        STAN=SS(n,:);
        r=0;
        n=n+1;
    end
    n=n-1;
    if n==0
        error('stanovisko není v seznamu souřadnic, použito protínání zpět')
    end
end