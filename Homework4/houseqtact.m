function y = houseqtact(Qu,u1,b)

[m,n]=size(Qu);
    c = b;
    for j = 1:min(m,n)
        c = hholder(vertcat(u1(j),Qu(:,j))).*c;
    end
    y = c;
end