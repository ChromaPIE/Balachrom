local blind = {
    name = "The Insect",
    slug = "insect", 
    dollars = 5, 
    mult = 2, 
    vars = {}, 
    debuff = {},
    boss = {min = 3, max = 10},
    color = HEX('873E2C')
}

blind.localization = {
    name = "The Insect",
    text = {
        "Debuff leftmost Joker",
        "whenever cards are drawn"
    }
}

blind.drawn_to_hand = function(self)
    if G.jokers and G.jokers.cards[1] and not G.jokers.cards[1].debuffed then
        G.jokers.cards[1]:set_debuff(true)
        G.jokers.cards[1]:juice_up()
        self:wiggle()
    end
end

return blind