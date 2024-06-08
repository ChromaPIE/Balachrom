--- STEAMODDED HEADER
--- MOD_NAME: FJInfo
--- MOD_ID: FJInfo
--- MOD_AUTHOR: [ChromaPIE]
--- MOD_DESCRIPTION: Attaching infoboxes to fusable jokers
--- PRIORITY: 19999999

----------------------------------------------
------------MOD CODE -------------------------

if SMODS.INIT.Vultbines_Joker then
    function FJInfoVultbine()
        for _, t in ipairs(Vultbines_Joker.fusions) do
            local j1 = t.jokers[1].name
            local j2 = t.jokers[2].name
            table.insert(Fusables, { j1, j2 })
        end
    end

    FJInfoVultbine()
end

init_localization()
function SMODS.INIT.FJInfo()
    for _, t in ipairs(Fusables) do
        local n1 = (SMODS.Jokers[t[1]] ~= nil and SMODS.Jokers[t[1]].loc_txt.name) or
        localize { type = 'name_text', key = t[1], set = 'Joker' }
        local n2 = (SMODS.Jokers[t[2]] ~= nil and SMODS.Jokers[t[2]].loc_txt.name) or
        localize { type = 'name_text', key = t[2], set = 'Joker' }
        G.localization.descriptions.Other[t[1]] = {
            name = "_",
            text = { '{s:1.2,E:1,C:dark_edition}' .. n1 .. '{}' }
        }
        G.localization.descriptions.Other[t[2]] = {
            name = "_",
            text = { '{s:1.2,E:1,C:dark_edition}' .. n2 .. '{}' }
        }
    end
    function FJInfo(card)
        for _, t in ipairs(Fusables) do
            if card.config.center_key == t[1] or card.config.center_key == t[2] then
                local pal = (card.config.center_key == t[1]) and t[2] or t[1]
                table.insert(card.ability_UIBox_table.info, 1, {})
                localize {
                    type = "other",
                    key = pal,
                    nodes = card.ability_UIBox_table.info[1]
                }
                card.ability_UIBox_table.info[1].name = "合体目标"
            end
        end
    end
end

----------------------------------------------
------------MOD CODE END----------------------