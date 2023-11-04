-- Dependencias
local player = require("Lua_Projects.Simulador_de_batalha.Definitions.player")
local medusa = require("Lua_Projects.Simulador_de_batalha.Definitions.medusa")

-- Habilita UTF-8 no terminal e limpa
os.execute("chcp 65001")  
os.execute("cls")

-- Header
print([[
=======================================================================
            _
 _         | |
| | _______| |---------------------------------------------\
|:-)_______|==[]============================================>
|_|        | |---------------------------------------------/
           |_|

                --------------------------------

                   ⚔ SIMULADOR DE BATALHA ⚔

=======================================================================

            Você empunha a sua espada e se prepara para lutar.
                         É hora da batalha!
                        
]])

local boss = medusa
