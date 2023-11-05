local actions = {}

actions.list = {}

function actions.build()
    actions.list = {}
    -- Atacar com espada
    local swordAttack = {
        description = "Atacar com espada.",
        requirement = nil,
        execute = function (heroData, creatureData)
            local successChance = creatureData.speed == 0 and 1 or heroData.speed / creatureData.speed
            local success = math.random() <= successChance
        end
    }
end

function actions.getValidActions()
    
end

return actions