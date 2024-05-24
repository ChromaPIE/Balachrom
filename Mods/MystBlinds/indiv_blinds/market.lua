local blind = {
    name = "The Market",
    slug = "market", 
    dollars = 5, 
    mult = 2, 
    vars = {}, 
    debuff = {},
    boss = {min = 2, max = 10},
    color = HEX('76C860')
}

blind.localization = {
    name = "市集",
    text = {
        "每次出牌后损失25%已得分数"
    }
}

blind.set_blind = function(self, blind, reset, silent)
    self.prepped = nil
end

blind.press_play = function(self)
    self.prepped = true
end

blind.drawn_to_hand = function(self)
    if G.GAME.current_round.hands_played == self.discards_sub and self.prepped then
        self:wiggle()
        G.E_MANAGER:add_event(Event({
            trigger = 'ease',
            blocking = false,
            ref_table = G.GAME,
            ref_value = 'chips',
            ease_to = G.GAME.chips - math.floor(G.GAME.chips/4),
            delay =  0.5,
            func = (function(t) return math.floor(t) end)
        }))
    end
end

return blind