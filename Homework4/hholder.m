function Hk = hholder(u)
    Hk = eye(length(u))- ((2 / (u' * u))*(u * u')); 
end

