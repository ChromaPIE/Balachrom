local jokerInfo = {
	name = '保证小丑',
	config = {},
	text = {'保证给{C:chips}+#1#{}筹码'},
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
	