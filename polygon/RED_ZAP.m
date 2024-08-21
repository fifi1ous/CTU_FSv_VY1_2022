function [zap]=RED_ZAP(body,OR)
body1=body(:,1);
OR1=OR(:,1);

q=1;
for m=1:length(body1)
    if OR1~=body1(m)
        zap(q,:)=body(m,:);
        q=q+1;
    end
end
end