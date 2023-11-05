-- Dependencias
local perseu = require("Lua_Projects.Simulador_de_batalha.hero.perseu")
local medusa = require("Lua_Projects.Simulador_de_batalha.creature.medusa")
local utils = require("Lua_Projects.Simulador_de_batalha.utils")
local heroActions = require("Lua_Projects.Simulador_de_batalha.hero.actions")

-- Habilita UTF-8 no terminal e limpa
utils.enableUtf8()

-- Header
utils.printHeader()

-- Obter definição tanto do herói quanto da criatura
local hero = perseu
local creature = medusa

-- Apresenta o monstro
utils.printCreature(creature)

-- Loop da batalha
while true do
    -- Mostrar ações para o jogador
    -- Simular o turno do jogador
    -- Ponto de saida: a criatura ficou sem vida
    if creature.health <= 0 then
        break
    end
    -- Simular o turno da criatura
    -- Ponto de saida: o jogador ficou sem vida
    if hero.health <= 0 then
        break
    end
end