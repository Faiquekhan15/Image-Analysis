function result = NOT(I)
    [r1,c1]=size(I);
    result=I;
 
  for i=1:r1
    for j=1:c1
           l=dec2bin(I(i,j));
           [x,y]=size(l);
         X=logical([0 0 0 0 0 0 0 0]);
         Z=logical([0 0 0 0 0 0 0 0]);
         
         for u=1:y
             X(1,u)=l(1,u);
         end
         for u=1:8
             Z(1,u)=~X(1,u);
         end
         d=bin2dec(Z,size(Z));
         result(i,j)=d ;
    end        
  end 
result=double(result)/255;
end
