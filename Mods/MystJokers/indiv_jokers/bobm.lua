local joker = {
    name = "bobm", slug = "bobm",
    config = { extra = 300 }, rarity = 1, cost = -4, 
    blueprint_compat = false, 
    eternal_compat = true
}

joker.localization = {
    name = "炸惮",
    text = {
        "{C:dark_edition}负片{}、{C:dark_edition}永恒",
        "{C:attention}300{}秒后输掉赛局",
        "{C:inactive}（剩余时间：#1#s）"
    }
}

joker.yes_pool_flag = "this_flag_will_never_be_added_to_pools"

joker.set_ability = function(self, center, initial, delay_sprites)
    self:set_edition({ negative = true })
    self.ability.eternal = true
end

joker.loc_def = function(self)
    if not self.ability.extra then return { 300 } end
    return { math.floor(self.ability.extra) }
end

return joker