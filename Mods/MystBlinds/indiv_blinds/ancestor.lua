local blind = {
    name = "The Ancestor",
    slug = "ancestor", 
    dollars = 5, 
    mult = 2, 
    vars = {localize('ph_ancestor')}, 
    debuff = {},
    boss = {min = 1, max = 10},
    color = HEX('D274CD')
}

blind.localization = {
    name = "先祖",
    text = {
        "牌组中的#1#张牌",
        "被抽到时将背面朝上"
    }
}

blind.set_blind = function(self, blind, reset, silent)
    self.discards_sub = math.ceil(G.GAME.round * 1.5)
    local available_cards = {}

    for _, v in ipairs(G.playing_cards) do
        available_cards[#available_cards+1] = v
    end

    for i = 1, math.min(self.discards_sub, math.ceil(#available_cards / 2)) do
        local chosen_card, chosen_card_key = pseudorandom_element(available_cards, pseudoseed("random_card"))
        chosen_card.ability.wheel_flipped = true
        table.remove(available_cards, chosen_card_key)
        -- sendDebugMessage("debuffed a "..chosen_card.base.value.." of "..chosen_card.base.suit)
    end
end

blind.stay_flipped = function(self, area, card)
    if area == G.hand and card.ability.wheel_flipped then
        return true
    end
end

blind.disable = function(self)
    for i = 1, #G.hand.cards do
        if G.hand.cards[i].facing == 'back' then
            G.hand.cards[i]:flip()
        end
    end
    for k, v in pairs(G.playing_cards) do
        v.ability.wheel_flipped = nil
    end
end

blind.loc_def = function(self)
    if self.discards_sub then 
        return {self.discards_sub} 
    end

    if G.GAME and G.GAME.round then 
        return { math.ceil(G.GAME.round * 1.5) } 
    end

    return { localize('ph_ancestor') }
end


return blind