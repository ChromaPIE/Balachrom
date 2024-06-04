local joker = {
    name = "Lucky Seven", slug = "lucky_seven",
    config = {}, rarity = 1, cost = 3, 
    blueprint_compat = true, 
    eternal_compat = true
}

joker.localization = {
    name = "幸运7",
    text = {
        "选择{C:attention}盲注{}时",
        "若尚有无版本的小丑牌",
        "则失去{C:money}$3",
        "并使用{C:attention}命运之轮"
    }
}

joker.calculate = function(self, context)
    if context.setting_blind and not self.getting_sliced then
        local can_trigger = false
        for _, v in pairs(G.jokers.cards) do
            if v.ability.set == "Joker" and not v.edition then
                can_trigger = true
            end
        end

        if can_trigger then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.5,
                func = function()
                    local card = Card(G.play.T.x + G.play.T.w/2 - G.CARD_W/2, G.play.T.y + G.play.T.h/2-G.CARD_H/2, G.CARD_W, G.CARD_H, 
                    G.P_CARDS.empty, G.P_CENTERS["c_wheel_of_fortune"], {bypass_discovery_center = true, bypass_discovery_ui = true})
                    card.cost = 0
                    card:update()
                    G.FUNCS.use_card({config = {ref_table = card}})
                    card:start_materialize()

                    ease_dollars(-3)
                return true
                end
            }))
        end
    end
end

joker.tooltip = function(self, info_queue)
    info_queue[#info_queue+1] = G.P_CENTERS.c_wheel_of_fortune
end

return joker