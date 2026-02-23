# 📁 Lua File Manager

Um poderoso manipulador de arquivos e diretórios desenvolvido em Lua, com interface interativa via terminal. O sistema permite realizar operações completas de gerenciamento de arquivos e pastas de forma simples e intuitiva.

## 🚀 Características

- **Manipulação completa de arquivos** (criar, ler, escrever, copiar, mover, renomear, excluir)
- **Gerenciamento avançado de diretórios** (criar, listar, navegar, remover)
- **Interface interativa** via terminal com menu dinâmico
- **Operações seguras** com validações e tratamento de erros
- **Suporte a permissões** de sistema operacional

## 📋 Pré-requisitos

- Lua 5.4 ou superior
- LuaFileSystem (lfs)
- Sistema operacional Linux/Unix (recomendado) ou Windows

### Instalação das dependências

#### Linux (Ubuntu/Debian)
```bash
# Instalar Lua 5.4
sudo apt update
sudo apt install lua5.4

# Instalar LuaFileSystem
sudo apt install lua-filesystem
# ou via luarocks
sudo luarocks install luafilesystem
