local blind = {
    name = "Scarlet Mist",
    slug = "final_mist", 
    dollars = 8, 
    mult = 2, 
    vars = {}, 
    debuff = {},
    boss = {showdown = true, min = 10, max = 10},
    color = HEX('CA1C1C')
}

blind.localization = {
    name = "绯红之雾",
    text = {
        "基础倍率减半",
        "将基础筹码设为基础倍率"
    }
}

blind.modify_hand = function(self, cards, poker_hands, text, mult, hand_chips)
    self.triggered = true
    return math.max(math.floor(mult*0.5 + 0.5), 1), math.max(math.floor(mult*0.5 + 0.5), 1), true
end

return blind