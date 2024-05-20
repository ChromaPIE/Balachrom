local joker = {
    name = "Autism Creature", slug = "autism_creature",
    config = {extra = 0}, rarity = 1, cost = 4, 
    blueprint_compat = true, 
    eternal_compat = true
}

joker.localization = {
    name = "孤独症画作",
    text = {
        "每有一个空的{C:attention}小丑牌{}槽位",
        "本牌获得{C:mult}+6{}倍率",
        "{C:inactive}（当前为{C:mult}+#1#{C:inactive}倍率）"
    }
}

joker.calculate = function(self, context)
    if SMODS.end_calculate_context(context) then
        if self.ability.extra > 0 then
            return {
                message = localize { type = 'variable', key = 'a_mult', vars = { self.ability.extra } },
                mult_mod = self.ability.extra,
            }
        end
    end
end

joker.loc_def = function(self)
    return { self.ability.extra }
end

return joker