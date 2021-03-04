function img=I_Or(I1,I2)
[row1,col1]=size(I1);
[row2,col2]=size(I2);
img=uint8(zeros(row1,col1/3));
if row1==row2
    if col1==col2
        
        for p=1:row1
            for q=1:col2/3
                var1=dec2bin(I1(p,q));
                var2=dec2bin(I2(p,q));
                var3=Or(var1,var2);
                var4=bin2dec(var3,size(var3));
                img(p,q)=var4;
            end
        end
    end
end
end
