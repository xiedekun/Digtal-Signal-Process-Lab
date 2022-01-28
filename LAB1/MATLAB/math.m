function[add, sub, mul, div] = math(a,b)
%隐藏变脸：nargin函数输入数量，nargout函数输出数量
if(nargin ~= 2)
    disp('Usage: [add, sub, mul, div] = math(a,b)');
    return;
end

if(nargout >= 1)
    add = a + b;
end

if(nargout >=2)
    sub = a - b;
end

if(nargout >= 3)
    mul = a * b;
end

if(nargout >= 4)
    div = a / b;
end

if(nargout == 0)
    add = a + b;
    sub = a - b;
    mul = a * b;
    div = a / b;
    fprintf('add = %4.2f\n', add)
    fprintf('sub = %4.2f\n', sub)
    fprintf('mul = %4.2f\n', mul)
    fprintf('div = %4.2f\n', div)
end
return;
    
