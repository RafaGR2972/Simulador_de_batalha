local utils = require "Lua_Projects.Simulador_de_batalha.utils"

local actions = {}
-- Reset list
actions.list = {}

---
--- Cria uma lista de ações armazenadas internamente
---
function actions.build()
    actions.list = {}
    -- Usar um item dado pelos deuses
    local getItem = {
        description = "Usar item dado pelos deuses.",
        requirement = nil,
        execute = function (heroData, creatureData)
            -- Escolha do item
            print("Qual item vai usar? 1 para elmo, 2 para sandálias aladas ou 3 para escudo: ")
            local item = io.read("*n")
            -- Efeito do item escolhido
            if heroData.item[1] then
                heroData.attack = heroData.attack + 3
            elseif heroData.item[2] then
                heroData.speed = heroData.speed + 3
            elseif heroData.item[3] then
                heroData.defense = heroData.defense + 3
            end
            return heroData.item[item]        
        end
    }

    -- Atacar com espada
    local swordAttack = {
        description = "Atacar com espada.",
        requirement = nil,
        execute = function (heroData, creatureData)
            -- 1. Definir chance de sucesso
            local successChance = creatureData.speed == 0 and 1 or heroData.speed / creatureData.speed
            local success = math.random() <= successChance

            -- 2. Calcular dano
            local rawDamage = heroData.attack - math.random() * creatureData.defense
            local damage = math.max(1, math.ceil(rawDamage))

          
            if success then
                -- 3. Aplicar o dano em caso de sucesso
                creatureData.health = creatureData.health - damage

                -- 4. Apresentar resultado 
                print(string.format("%s atacou e deu %d pontos de dano", heroData.name, damage))
                local healthRate = math.floor((creatureData.health / creatureData.maxHealth) * 10)
                print(string.format("%s: %s", creatureData.name, utils.getProgressBar(healthRate)))
            else
                print(string.format("%s tentou atacar, mas errou.", heroData.name))
            end
        end
    }

    -- Populate lista
    actions.list[#actions.list + 1 ] = swordAttack
    actions.list[#actions.list + 1 ] = getItem
end


--- Retorna uma lista de ações válidas
---@param heroData table Definição do jogador
---@param creatureData table Definição da criatura
---@return table
function actions.getValidActions(heroData, creatureData)
    local validActions = {}
    for _, action in pairs(actions.list) do
        local requirement = action.requirement
        local isValid = requirement == nil or requirement(heroData, creatureData)
        if isValid then
            validActions[#validActions+1] = action
        end
    end
    return validActions
end

return actions