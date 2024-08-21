function [OP,orientace,op,roz]=orientacni_posun(zap,OR,ST)
s=size(zap,1);
if s>1
    for n=1:s
        orientace(n,1)=atan2(OR(n,2)-ST(:,2),OR(n,3)-ST(:,3));
        if orientace(n,1)<0
            orientace(n,1)=orientace(n,1)+2*pi;
        end
        orientace(n,2)=orientace(n,1)-zap(n,6);
        if orientace(n,2)<0
            orientace(n,2)=orientace(n,2)+2*pi;
        end
        orientace(n,3)=norm(ST(:,2:3)-OR(n,2:3));
    end
    orientace=[orientace,orientace(:,1:2)./pi*200];
    op=mean(orientace(:,5));
    OP=mean(orientace(:,2));
    for n=1:s
        roz(n,1)=op-orientace(n,5);
        roz(n,2)=orientace(n,3)-zap(n,8);
    end
else
    orientace=atan2(OR(:,2)-ST(:,2),OR(:,3)-ST(:,3));
        if orientace<0
            orientace=orientace+2*pi;
        end
    orientace(2)=norm(ST(:,2:3)-OR(:,2:3));
    orientace(3)=orientace(1)/pi*200;
    OP=orientace(1)-zap(:,6);
    if OP<0
        OP=OP+2*pi;
    end
    roz=orientace(2)-zap(:,8);
    op=orientace(3);
end
end