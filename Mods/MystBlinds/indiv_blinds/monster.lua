local blind = {
    name = "The Monster",
    slug = "monster", 
    dollars = 5, 
    mult = 2, 
    vars = {}, 
    debuff = {},
    boss = {min = 2, max = 10},
    color = HEX('3C074D')
}

blind.localization = {
    name = "恶兽",
    text = {
        "摧毁所有消耗牌",
        "消耗牌槽位归零"
    }
}

blind.set_blind = function(self, blind, reset, silent)
    G.GAME.consumeable_buffer = 0
    self.hands_sub = 0

    ---- check for Chicot
    if not next(find_joker("Chicot")) then
        for k, v in ipairs(G.consumeables.cards) do
            v:start_dissolve(nil, (k ~= 1))
        end

        G.E_MANAGER:add_event(Event({trigger = 'immediate', func = function()
            self.hands_sub = G.consumeables.config.card_limit
            G.consumeables.config.card_limit = G.consumeables.config.card_limit - self.hands_sub
            return true
        end}))
    end
end
blind.disable = function(self)
    G.consumeables.config.card_limit = G.consumeables.config.card_limit + self.hands_sub
end
blind.defeat = function(self, silent)
    G.consumeables.config.card_limit = G.consumeables.config.card_limit + self.hands_sub
end

return blind