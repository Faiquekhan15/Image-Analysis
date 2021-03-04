function dilated_image= dilation(img)
a=rgb2gray(img);
b=im2bw(a);
[row, col]=size(b);
w=ones(3,3);
output=[];
for x=2:1:row-1
    for y= 2:1:col-1
        g=[w(1)*b(x-1,y-1) w(2)*b(x-1,y) w(3)*b(x-1,y+1) w(4)*b(x,y-1) w(5)*b(x,y) w(6)*b(x,y+1) w(7)*b(x+1,y-1) w(8)*b(x+1,y) w(9)*b(x+1,y+1)];
        output(x,y)=min(g);
    end
end
dilated_image=output;
end