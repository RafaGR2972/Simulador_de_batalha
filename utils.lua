local utils = {}

---
--- Habilita o modo UTF8 no terminal.
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

            Oh, herói, empunhe a sua espada e se prepare para lutar!
                        
]])
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
--- Print das informações de uma criatura
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
    --print("|    Invisibilidade:   " .. utils.getProgressBar(creature.invisibility))
    print("|")
end

return utils