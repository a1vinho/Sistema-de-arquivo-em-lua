local file = io.open('teste.js','r');

local content = file:read("*a");

print(content)