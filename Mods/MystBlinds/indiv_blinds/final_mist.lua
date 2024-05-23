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
    name = "Scarlet Mist",
    text = {
        "Halves Base Mult, sets",
        "Base Chips to Base Mult"
    }
}

blind.modify_hand = function(self, cards, poker_hands, text, mult, hand_chips)
    self.triggered = true
    return math.max(math.floor(mult*0.5 + 0.5), 1), math.max(math.floor(mult*0.5 + 0.5), 1), true
end

return blind