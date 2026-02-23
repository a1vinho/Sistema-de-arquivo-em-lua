require('io');
require('os');
local lfs = require('lfs');
-- directory
local dir = lfs.currentdir();

lfs.touch('index.js')
-- function for directory create
function CreateDirectory(path)
    if not path or type(path) ~= 'string' then
        return "Diretório invalído,tente novamente"
    end
    local attr = lfs.attributes(path);
    if not attr then
        local dir, error = lfs.mkdir(path);
        if dir then
            return "Diretório cirado com sucesso", true;
        else
            return "Erro ao criar diretório: " .. error, false
        end
    end
    return "Esse diretório já existe", false
end

function ListItemsDirectory()
    local items = {}
    for item in lfs.dir(lfs.currentdir()) do
        local attr = lfs.attributes(item);
        if attr.mode ~= 'file' then
            table.insert(items, "Diretorio: " .. item)
        else
            table.insert(items, 'Arquivo: ' .. item);
        end
    end
    for key, value in pairs(items) do
        print(value);
    end
end

function RemoveDirectory(path)
    if not path or path == '' then
        return "Diretório invalído,tente novamente";
    end
    local sucess, error = lfs.rmdir(path);
    if not sucess and error then
        if (error == 'Directory not empty') then
            return "Erro o diretório precisa está vazio";
        end;
        return "Erro ao remover diretório: " .. error,false
    end
    return "Diretório removido com sucesso",true;
end

function DirectoryAlter(path)
    if not path or path == '' then
        print('---- Nenhum diretório especificado \n---- listando o diretório atual: ' .. dir);
        for item in lfs.dir(dir) do
            local fullPath = dir .. '/' .. item
            local attr = lfs.attributes(fullPath);
        end
        ListItemsDirectory();
        return "Diretório listado com sucesso.";
    end;
    local user = os.getenv('USER') or os.getenv('USERNAME');
    if not user then
        return "Não conseguimos recuperar o usuário do sistema.";
    end
    local alter = lfs.chdir(path);
    if not alter then
        return 'Nenhum diretório encontrado,tente seguir o exemplo acima'
    end
    ListItemsDirectory()
    return "Diretório acessado com sucesso.";
end
