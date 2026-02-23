require 'directorys';
require('files');
require 'io';
local lfs = require 'lfs'

local optionsDir = [[
------------- File System ( Sistema de arquivos ) --------------

    1 - Criar Diretório
    2 - Alterar diretório atual
    3 - Excluir diretório
    4 - Acessar opções de arquivos
    5 - Sair do sistema
]]
local optionsFile = [[
    1 - Criar arquivo
    2 - Escrever arquivo
    3 - Ler arquivo
    4 - Excluir arquivo
    5 - Volta para o sistema principal
]]

local function SystemFile()
    while true do
        print(optionsDir)
        io.write('\n\nPor favor digite uma opção - ');
        local option = io.read();
        if (option == '1') then
            print('\n\n---- Você está no diretório: ' .. lfs.currentdir() .. '\n\n');
            io.write('Nome do diretório que deseja criar - ');
            local directory = io.read()

            local message, bool = CreateDirectory(directory);

            print(message);
        end
        if (option == '2') then
            print('\n---- Exemplo de utilização: /home/user/Desktop ----- \n\n')
            print('\n\n---- Você está no diretório: ' .. lfs.currentdir() .. '\n\n');

            io.write('Digite o diretório que deseja ir - ');
            local directory = io.read();

            local message = DirectoryAlter(directory);

            print(message)
        end
        if option == '3' then
            print('\n\n---- Você está no diretório: ' .. lfs.currentdir() .. '\n\n');
            ListItemsDirectory();
            io.write('Digite um diretório que deseja remover - ');

            local directory = io.read();
            local message, bool = RemoveDirectory(directory);

            print(message);
        end
        if option == '4' then
            print('\n\n---- Você está no diretório: ' .. lfs.currentdir() .. '\n\n');

            while true do
                print(optionsFile)
                io.write('Digite uma opção - ');
                local optionFile = io.read();

                if optionFile == '1' then
                    io.write('Nome do arquivo - ');
                    local file = io.read();
                    io.write('Escrevar algo para o arquivo - ');
                    local content = io.read();
                    print(CreateFile(file, content))
                end
                if optionFile == '2' then
                    io.write('Nome do arquivo - ');
                    local file = io.read();
                    while true do
                        io.write('Escrevendo no arquivo ' .. file .. ' - ');
                        local text = io.read()
                        if text == 'sair' then
                            break
                        end;

                        WriteFile(file, text)
                    end
                end
                if optionFile == '3' then
                    io.write('Digite o nome do arquivo - ');
                    local file = io.read();
                    local content = ReadFile(file);

                    print(content)
                end
                if optionFile == '4' then
                    io.write('Digite o nome do arquivo - ');
                    local file = io.read();

                    local message = RemoveFile(file);

                    print(message);
                end
                if optionFile == '5' then
                    print('Voltando ao menu principal...');
                    break
                end
            end
        end
        if option == '5' then
            print('Saindo do sistema...');
            break
        end
    end
end

SystemFile();