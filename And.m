function A=And(a,b)
for i=8:-1:1
    if (a(i)+b(i))==2
        A(i)=1;
    end
    if(a(i)+b(i))~=2
        A(i)=0;
    end
end
end
