function B=dec2bin(val)
    m=1;
    counter=0;
    while val>=2
        if mod(val,2)==0
            C(m)=0;
            m=m+1;
            counter=counter+1;
        end
        if mod(val,2)==1
            C(m)=1;
            m=m+1;
            counter=counter+1;
        end
        temp=val;
        val=val/2;
        val=round(val);
        if val*2>temp
            val=val-1;
        end
    end
    C(m)=1;
    B=[0,0,0,0,0,0,0,0];
    var=8-(counter);
    n=1;
    for i=counter+1:-1:1
        if var==0
            var=1;
        end
        B(var)=C(i);
        var=var+1;
    end
end
