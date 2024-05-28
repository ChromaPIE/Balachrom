local mod = SMODS.findModByID('fiveceb')

local jokerInfo = {
	name = 'Dunnoker',
	config = {},
	text = {
		'{X:mult,C:white} X3.8 {} Mult if played',
		'hand is the same',
		'as the first hand',
		'of 5 cards played',
		'with this Joker.',
		'{C:attention}The hand to match is:{}',
		'{C:attention}#1#{}'
	},
	rarity = 2,
	cost = 5,
	canBlueprint = false,
	canEternal = true
}

mod.addLocalization('k_rememberthis_1', 'remebmer this tbh')
mod.addLocalization('k_rememberthis_2', 'rebember this tbh')
mod.addLocalization('k_rememberthis_3', 'remeber this tbh')
mod.addLocalization('k_rememberthis_4', 'rember this tbh')

mod.addLocalization('k_youremembered_1', 'You Remebmered! X3.8')
mod.addLocalization('k_youremembered_2', 'You Rebembered! X3.8')
mod.addLocalization('k_youremembered_3', 'You Remebered! X3.8')
mod.addLocalization('k_youremembered_4', 'You Rembered! X3.8')

local function idToString(x)
	local convert = {}
	convert[11] = 'j'
	convert[12] = 'q'
	convert[13] = 'k'
	convert[14] = 'a'
	return convert[x] or tostring(x)

end

function jokerInfo.locDef(self)
	local text = 'NONE YET'
	if self.ability.extra and self.ability.extra.hasHandYet then
		text = ''
		for i,v in ipairs(self.ability.extra.hand) do
			text = text .. idToString(v.id) .. string.sub(v.suit,1,1)
			if i ~= #self.ability.extra.hand then
				text = text .. ', '
			end
		end
	end
	return {text}
end

function jokerInfo.init(self)
	self.ability.extra = {
		hasHandYet = false,
		hand = {}
	}
end

function jokerInfo.calculate(self, context)
	if SMODS.end_calculate_context(context) then
	
		if context.full_hand and #context.full_hand == 5 then
			if self.ability.extra.hasHandYet then
				local matched = {}
				local matches = 0
				for i, remberCard in ipairs(self.ability.extra.hand) do
					for _i,handCard in ipairs(context.full_hand) do
						local id = handCard:get_id()
						if handCard.ability.effect == 'Stone Card' and not handCard.vampired then
							id = 'St'
						end
						if id == remberCard.id and handCard:is_suit(remberCard.suit, true, true) and not matched[_i] then
							--match found
							matched[_i] = true
							matches = matches + 1
							break
						end
					end
				end
				
				if matches == 5 then
					return {
						message = localize('k_youremembered_' .. math.random(1,4)),
						Xmult_mod = 3.8,
					}
				else
					print('only '.. matches ..' matches.')
				end
				
			else
				for i,v in ipairs(context.full_hand) do
					local card = {}
					if v.ability.effect == 'Stone Card' and not v.vampired then
						card.id = 'St'
						card.suit = ''
					else
						card.id = v:get_id()
						card.suit = v.base.suit
					end
					table.insert(self.ability.extra.hand, card)
				end
				
				self.ability.extra.hasHandYet = true
				
				return {
					message = localize('k_rememberthis_' .. math.random(1,4)),
					colour = G.C.RED,
					card = self
				}
			
			end
		end
	end
end

return jokerInfo
	