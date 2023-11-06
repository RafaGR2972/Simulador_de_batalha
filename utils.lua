local hero = require("Lua_Projects.Simulador_de_batalha.hero.perseu")

local utils = {}

---
--- Habilita o modo UTF8 no terminal e limpa
---
function utils.enableUtf8()
    os.execute("chcp 65001")
    os.execute("cls")
end

---
--- Print da apresentação do simulador.
---
function utils.printHeader()
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
]])
   print(string.format("-----Oh, %s, empunhe a sua espada e se prepare para a batalha!-----", hero.name)) 
   print()               
end

---
--- Função que recebe um atributo e nos retorna uma barra de progresso em string / texto
---
function utils.getProgressBar(attribute)
    local fullChar = "◻️"
    local emptyChar = "◼️"
    local result = ""
    for i = 1, 10, 1 do
        result = result .. (i <= attribute and fullChar or emptyChar)
    end
    return result
end

---
--- Print das informações da criatura
---
function utils.printCreature(creature)
    -- Calculate health rate
    local healthRate = math.floor((creature.health / creature.maxHealth) * 10)

    -- Cartão
    print("| " .. creature.name)
    print("|")
    print("| " .. creature.description)
    print("|")
    print("| Atributos")
    print("|    Ataque:           " .. utils.getProgressBar(creature.attack))
    print("|    Defesa:           " .. utils.getProgressBar(creature.defense))
    print("|    Vida:             " .. utils.getProgressBar(healthRate))
    print("|    Velocidade:       " .. utils.getProgressBar(creature.speed))
    print("|")
end

---
--- Print das informações de do herói
---
function utils.printHero(hero)
    -- Calculate health rate
    local healthRate = math.floor((hero.health / hero.maxHealth) * 10)

    -- Cartão
    print("|======================================================================")
    print("|")
    print("| " .. hero.name)
    print("|")
    print("| " .. hero.description)
    print("|")
    print("| Atributos")
    print("|    Ataque:           " .. utils.getProgressBar(hero.attack))
    print("|    Defesa:           " .. utils.getProgressBar(hero.defense))
    print("|    Vida:             " .. utils.getProgressBar(healthRate))
    print("|    Velocidade:       " .. utils.getProgressBar(hero.speed))
    print("|")
end

--- Pergunta ao usuário por um número, que é retornado pela função
---@return any
function utils.ask()
    io.write("> ")
    local answer = io.read("*n")
    return answer
end

return utils