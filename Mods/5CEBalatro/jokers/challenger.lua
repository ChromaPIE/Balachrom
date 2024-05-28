local jokerInfo = {
	name = 'Challenger',
	config = {},
	text = {
		"When {C:attention}Blind{} is selected,",
		"create {C:attention}1{C:attention} Joker",
		"{C:inactive}(Must have room)"
	},
	rarity = 3,
	cost = 6,
	canBlueprint = true,
	canEternal = true
}


function jokerInfo.locDef(self)
	return {}
end


function jokerInfo.init(self)
	self.ability.extra = {
	}
end

function jokerInfo.calculate(self, context)
	if context.setting_blind and not self.getting_sliced then
		if not (context.blueprint_card or self).getting_sliced and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
			G.GAME.joker_buffer = G.GAME.joker_buffer + 1
			G.E_MANAGER:add_event(Event({
				func = function() 
						local card = create_card('Joker', G.jokers)
						card:add_to_deck()
						G.jokers:emplace(card)
						card:start_materialize()
						G.GAME.joker_buffer = 0
					return true
				end}))   
			card_eval_status_text(context.blueprint_card or self, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE}) 
		
		end
	end
end



return jokerInfo