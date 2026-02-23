require 'io';
local lfs = require 'lfs';
require 'os';

function CreateFile(path, content)
    local file = io.open(path, 'w');
    if file then
        file:write(content);
        file:flush();
        file:close();

        return "Arquivo criado com sucesso"
    else
        return "Erro ao criar arquivo,Verifique o seu diretório"
    end
end

function WriteFile(path, content)
    local file, err = io.open(path, 'a');
    if file then
        file:write(content);
        file:flush();
        file:close();
    end
    return true;
end

function RemoveFile(path)
    local sucess, message = os.remove(path);
    if sucess then
        return "Arquivo removido com sucesso.";
    else
        return "Erro ao remover arquivo", message
    end
end
