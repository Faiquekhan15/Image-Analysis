function O=Or(a,b)
for i=8:-1:1
    if (a(i)+b(i))==2
        O(i)=1;
    end
    if (a(i)+b(i))==1
        O(i)=1;
    end
    if(a(i)+b(i))==0
        O(i)=0;
    end
end
end
