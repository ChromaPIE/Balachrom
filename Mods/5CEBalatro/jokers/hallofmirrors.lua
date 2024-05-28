local jokerInfo = {
	name = 'Hall of Mirrors',
	config = {},
	text = {'Mult is locked',
		'to its highest',
		'value.',
		'{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)',
		'{C:attention}Chance to fail if Negative!{}',
	},
	rarity = 3,
	cost = 6,
	canBlueprint = false,
	canEternal = true
}


--IMPL NOTES
--[[
Does it work like this, or too op? 
Assume player is playing a hand that has base 1 mult,
(+2) (x2) (hom)

Mult = 3
     Mult = 6
	      Mult = 6; HOM = 6
		  
Player re-arranges cards

(hom) (+2) (x2)

Mult = 6; as 6 is greater than 1; HOM = 6
      Mult = 8
           Mult = 16
]]

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
	