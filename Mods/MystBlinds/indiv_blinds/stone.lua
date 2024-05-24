local blind = {
    name = "The Stone",
    slug = "stone", 
    dollars = 5, 
    mult = 2, 
    vars = {}, 
    debuff = {},
    boss = {min = 2, max = 10},
    color = HEX('85898C')
}

blind.localization = {
    name = "石头",
    text = {
        "增强卡牌全部失效"
    }
}

blind.debuff_card = function(self, card, from_blind)
    if card.area ~= G.jokers and card.config.center ~= G.P_CENTERS.c_base then
        card:set_debuff(true)
        return
    end
end

return blind