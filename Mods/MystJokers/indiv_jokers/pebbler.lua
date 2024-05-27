local joker = {
    name = "Pebbler Joker", slug = "pebbler",
    config = {}, rarity = 2, cost = 6,
    blueprint_compat = false,
    eternal_compat = true
}

joker.localization = {
    name = "飞石小丑",
    text = {
        "{C:attention}石头牌{}无视选牌",
        "和出牌张数上限"
    }
}

joker.tooltip = function(self, info_queue)
    info_queue[#info_queue+1] = G.P_CENTERS.m_stone
end

joker.enhancement_gate = "m_stone"

return joker