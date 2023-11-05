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

-- Ações
heroActions.build()

-- Loop da batalha
while true do
    -- Mostrar ações para o jogador
    print()
    print("O que deseja fazer?: ")
    local validHeroActions = heroActions.getValidActions(hero, creature)
    for index, action in pairs(validHeroActions) do
        print(string.format("%d: %s", index, action.description))
    end
    local chosenIndex = utils.ask()
    print("Chosen Index:" .. chosenIndex)
    local chosenAction = validHeroActions[chosenIndex]
    local isActionValid = chosenAction ~= nil

    -- Simular o turno do jogador
    if isActionValid then
        chosenAction.execute(hero, creature)
    else
        print("A sua opção não é válida. Perdeu a sua vez.")
    end
    
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