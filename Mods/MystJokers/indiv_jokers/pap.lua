local joker = {
    name = "Pictured as Perfect", slug = "pap",
    config = {extra = 1}, rarity = 5, cost = 11, 
    blueprint_compat = false, 
    eternal_compat = true
}

joker.localization = {
    name = "人造完美",
    text = {
        "出牌后，本盲注内弃牌次数{C:red}+1",
        "弃牌后，额外抽{C:attention}3{}张牌",
        "{C:inactive}（选项 + 鸣谢）"
    }
}

joker.set_ability = function(self, center, initial, delay_sprites)
    self.ability.extra = G.GAME.current_round.discards_used + 1
end

joker.calculate = function(self, context)
    if context.setting_blind and not self.getting_sliced and not context.blueprint then
        self.ability.extra = 1
    end
    if context.cardarea == G.jokers and context.after and not context.blueprint then
        ease_discard(1)
    end
end

joker.fusion = {
    joker1 = "j_myst_options",
    stat1 = nil,
    extra1 = false,
    joker2 = "j_myst_credits",
    stat2 = "extra",
    extra2 = false,
}

return joker