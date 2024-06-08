--- STEAMODDED HEADER
--- MOD_NAME: FJInfo
--- MOD_ID: FJInfo
--- MOD_AUTHOR: [ChromaPIE]
--- MOD_DESCRIPTION: Attaching infoboxes to fusable jokers
--- PRIORITY: 19999999

----------------------------------------------
------------MOD CODE -------------------------

for _, t in ipairs(Fusables) do
    G.localization.descriptions.Other[t[1]] = {
        name = "_",
        text = {'{s:1.2,E:1,C:dark_edition}' .. localize{type = 'name_text', key = t[1], set = 'Joker'} .. '{}'}
    }
    G.localization.descriptions.Other[t[2]] = {
        name = "_",
        text = {'{s:1.2,E:1,C:dark_edition}' .. localize{type = 'name_text', key = t[2], set = 'Joker'} .. '{}'}
    }
end

init_localization()
function SMODS.INIT.FJInfo()
    function FJInfo(card)
        for _, t in ipairs(Fusables) do
            if card.config.center_key == t[1] or card.config.center_key == t[2] then
                local pal = (card.config.center_key == t[1]) and t[2] or t[1]
                    table.insert(card.ability_UIBox_table.info, 1, {})
                    localize{
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