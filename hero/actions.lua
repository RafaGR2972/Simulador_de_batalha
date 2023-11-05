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
        requirement = nil,--function (heroData, creatureData) 
            -- Escolha do item
            --print("Qual item vai usar? Digite 1 para elmo, 2 para sandálias aladas ou 3 para escudo: ")
            ---local item = io.read("*n")
            --return heroData.item[item]
        --end,
        execute = function (heroData, creatureData)
            -- Efeito do item escolhido
            if heroData.item[1] then
                heroData.invisibility = heroData.invisibility + 5
            elseif heroData.item[2] then
                heroData.speed = heroData.speed + 2
            elseif heroData.item[3] then
                heroData.defense = heroData.defense + 2
            end               
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

            -- 3. Apresentar resultado 
            if success then
                print(string.format("Você atacou a criatura e deu %d pontos de dano", damage))
                -- 4. Aplicar o dano em caso de sucesso
                creatureData.health = creatureData.health - damage
            else
                print("Você tentou atacar, mas errou.")
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