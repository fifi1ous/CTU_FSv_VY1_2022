function [SS,BODY]=vypocet(OP,STAN,body,SS)
for m=1:size(body,1)
    OP1=OP+body(m,6);
    if OP1>2*pi
        OP1=OP1-2*pi;
    elseif OP1<0
        OP1=OP1+2*pi;
    end
    BODY(m,1)=body(m,1);
    BODY(m,2)=STAN(2)+sin(OP1)*body(m,8);
    BODY(m,3)=STAN(3)+cos(OP1)*body(m,8);
end
SS=[SS;BODY];
end