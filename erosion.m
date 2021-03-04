function eroded_image=erosion(image)
image1=image;
image2=rgb2gray(image1);
image3=im2bw(image2);
[r ,c]=size(image3);
w=ones(3,3);
output=[];
for x=2:1:r-1
    for y= 2:1:c-1
        g=[w(1)*image3(x-1,y-1) w(2)*image3(x-1,y) w(3)*image3(x-1,y+1) w(4)*image3(x,y-1) w(5)*image3(x,y) w(6)*image3(x,y+1) w(7)*image3(x+1,y-1) w(8)*image3(x+1,y) w(9)*image3(x+1,y+1)];
        output(x,y)=max(g);
    end
end
eroded_image=output;
end