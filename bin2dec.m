function D=bin2dec(arr,Size)
    var=1;
    S=Size(2);
    D=0;
    for i=S:-1:1
        D=D+arr(i)*var;
        var=var*2;
    end
end
