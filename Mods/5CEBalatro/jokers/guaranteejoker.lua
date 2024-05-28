local jokerInfo = {
	name = 'Guarantee Joker',
	config = {},
	text = {'{C:chips}+#1#{} Chips'},
	rarity = 1,
	cost = 2,
	canBlueprint = true,
	canEternal = true
}


function jokerInfo.locDef(self)
	return {self.ability.extra.chips}
end


function jokerInfo.init(self)
	self.ability.extra = {
		chips = 30
	}
end

function jokerInfo.calculate(self, context)
	if SMODS.end_calculate_context(context) then
		return {
			message = localize{type='variable',key='a_chips',vars={self.ability.extra.chips}},
			chip_mod = self.ability.extra.chips, 
			colour = G.C.CHIPS
		}
	end
end



return jokerInfo
	