local utils = require "Lua_Projects.Simulador_de_batalha.utils"

local actions = {}
actions.list = {}

---
--- Cria uma lista de ações armazenadas internamente
---
function actions.build()
    -- Reset list
    actions.list = {}
    -- Atacar com o olhar
    local gazeAttack = {
        description = "Olhar petrificante.",
        requirement = nil,
        execute = function (heroData, creatureData)
            -- 1. Definir chance de sucesso
            local successChance = heroData.speed == 0 and 1 or creatureData.speed / heroData.speed
            local success = math.random() <= successChance

            -- 2. Calcular dano
            local rawDamage = creatureData.attack - math.random() * heroData.defense
            local damage = math.max(1, math.ceil(rawDamage))
          
            if success then
                -- 3. Aplicar o dano em caso de sucesso
                heroData.health = heroData.health - damage

                -- 4. Apresentar resultado 
                print(string.format("%s atacou e deu %d pontos de dano", creatureData.name, damage))
                local healthRate = math.floor((heroData.health / heroData.maxHealth) * 10)
                print(string.format("%s: %s", heroData.name, utils.getProgressBar(healthRate)))
            else
                print(string.format("%s tentou atacar, mas %s evitou o seu olhar.", creatureData.name, heroData.name))
            end
        end
    }
    
    -- Ataque com a cauda
    local tailAttack = {
        description = "Atacar com a cauda.",
        requirement = nil,
        execute = function (heroData, creatureData)
            -- Calcular dano
            local rawDamage = creatureData.attack - math.random() * heroData.defense
            local damage = math.max(1, math.ceil(rawDamage * 0.2))

            -- Aplicar o dano 
            heroData.health = heroData.health - damage

            -- Apresentar resultado 
            print(string.format("%s atacou com a cauda e deu %d pontos de dano", creatureData.name, damage))
            local healthRate = math.floor((heroData.health / heroData.maxHealth) * 10)
            print(string.format("%s: %s", heroData.name, utils.getProgressBar(healthRate)))
            print(string.format("%s tentou atacar, mas %s evitou o impacto.", creatureData.name, heroData.name))
        end
    }

    -- Populate lista
    actions.list[#actions.list + 1 ] = gazeAttack
    actions.list[#actions.list + 1 ] = tailAttack
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