-- Dependencias
local perseu = require("Lua_Projects.Simulador_de_batalha.Definitions.perseu")
local medusa = require("Lua_Projects.Simulador_de_batalha.Definitions.medusa")
local utils = require("Lua_Projects.Simulador_de_batalha.utils")

-- Habilita UTF-8 no terminal e limpa
utils.enableUtf8()

-- Header
utils.printHeader()

-- Obter definição tanto do herós quando da criatura
-- local hero = perseu
local creature = medusa

-- Apresentão 
utils.printCreature(creature)
