--- STEAMODDED HEADER
--- MOD_NAME: 5CEBalatro
--- MOD_ID: fiveceb
--- MOD_AUTHOR: [DPS2004, The 5CEB server]
--- MOD_DESCRIPTION: do jokers have meat?
--- DISPLAY_NAME: 5CEB
--- BADGE_COLOUR: FF7519

local conf_5ceb = {
	jokersToLoad = {
		'guaranteejoker',
		'guiltyjoker',
		'lilscamperer',
		'dunnoker',
		--'hallofmirrors', unfinished
		'challenger'
	},

	loadDebugDeck = true,
	debugDeckCards = {
		'guaranteejoker',
		'guiltyjoker',
		'lilscamperer',
		'dunnoker',
		--'hallofmirrors', unfinished
		'challenger'
	}
}

local jokerInfoDefault = {
	name = 'NONE',
	config = nil,
	text = {'text'},
	baseEffect = nil,
	rarity = 1,
	cost = 1,
	canBlueprint = true,
	canEternal = true,
	--functions
	locDef = nil,
	init = nil,
	calculate = nil,
	update = nil
}

local function fillInDefaults(t,d)
	for k,v in pairs(d) do
		if t[k] == nil then t[k] = v end
	end
end


function SMODS.INIT.fiveceb()
	local mod = SMODS.findModByID('fiveceb')
	
	--functions that are used by many cards go here.
	localizations = {}
	function mod.addLocalization(key,str)
		localizations[key] = str
	end
	
	function mod.getCardPosition(card)
		for i = 1, #G.jokers.cards do
			if G.jokers.cards[i] == card then
				return i
			end
		end
		return nil
	end
	
	
	local jokerUpdates = {}
	
	for i,v in ipairs(conf_5ceb.jokersToLoad) do
		local jokerInfo = love.filesystem.load(mod.path .. 'jokers/'..v..'.lua')()
		fillInDefaults(jokerInfo,jokerInfoDefault)
		
		joker = SMODS.Joker:new(
			jokerInfo.name,
			v, jokerInfo.config,
			{x=0,y=0},
			{name = jokerInfo.name,text = jokerInfo.text},
			jokerInfo.rarity,
			jokerInfo.cost,
			true,
			true,
			jokerInfo.canBlueprint,
			jokerInfo.canEternal,
			jokerInfo.baseEffect
		)
		
		joker:register()
		
		local jself = SMODS.Jokers['j_'..v]
		
		
		if jokerInfo.locDef then
			jself.loc_def = jokerInfo.locDef
		end
		if jokerInfo.init then
			jself.set_ability = jokerInfo.init
		end
		if jokerInfo.calculate then
			jself.calculate = jokerInfo.calculate
		end
		if jokerInfo.update then
			table.insert(jokerUpdates,{name = jokerInfo.name, func = jokerInfo.update})
		end
		
		
		--load sprite
		SMODS.Sprite:new('j_'..v,mod.path,v..'.png',71,95,'asset_atli'):register()
		
	end
	
	
	--updates
	local card_updateRef = Card.update
	function Card.update(self, dt)
		if G.STAGE == G.STAGES.RUN then
			for i,v in ipairs(jokerUpdates) do
				if self.ability.name == v.name then
					v.func(self,dt)
				end
			end
		end
		card_updateRef(self,dt)
	end
	
	for k,v in pairs(localizations) do
		G.localization.misc.dictionary[k] = v
	end
    init_localization()
	
	
	if conf_5ceb.loadDebugDeck then
		--Debug deck, for easy testing.
		local Backapply_to_runRef = Back.apply_to_run
		-- Function used to apply new Deck effects
		function Back.apply_to_run(arg_56_0)
			Backapply_to_runRef(arg_56_0)
			
			if arg_56_0.effect.config.debugdeck then
				G.E_MANAGER:add_event(Event({
					func = function()
						for i,v in ipairs(conf_5ceb.debugDeckCards) do
							local card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_'..v, nil)
							card:add_to_deck()
							G.jokers:emplace(card)
							card:start_materialize()
							G.GAME.joker_buffer = 0
						end

						return true
					end
				
				}))
			
			end
		end

		local debugDeckLoc = {
			name="5CEBalatro调试牌组",
			text={
				"爆笑如雷了家人们",
			},
		}
		
		local debugDeckSprite = SMODS.Sprite:new('centers', mod.path, 'Enhancers.png', 71, 95, "asset_atli")
		debugDeckSprite:register()

		local debugDeck = SMODS.Deck:new("5ceb debug deck", "5cebdebugdeck", {debugdeck = true}, {x = 0, y = 5}, debugDeckLoc)
		debugDeck:register()
	end

end