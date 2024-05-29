local mod = SMODS.findModByID('fiveceb')

local jokerInfo = {
	name = '小蹦蹦',
	config = {},
	text = {
		'如果在移动本牌后出牌',
		'本牌获得{C:mult}+2{}倍率',
		'若未进行移动，重置倍率',
		'{C:inactive}（当前为{C:mult}+#1#{C:inactive}倍率）',
		'{s:0.8,C:inactive}#2#'
	},
	rarity = 3,
	cost = 5,
	canBlueprint = false,
	canEternal = true
}

mod.addLocalization('k_scamperTaunt', '咿呀吼！')

local function updateFlavorText(self)
	local flavorText = {
		'他怎么长这样啊',
		'他丑到我了',
		'……',
		'你看了不难受？',
		'这鬼样子我一眼都不想看',
		'他真的“有点”丑！',
		':(',
		'把他赶走，求求了',
		'我他妈……'
	}
	self.ability.extra.flavorText = flavorText[math.random(1,#flavorText)]

end

function jokerInfo.locDef(self)
	return {self.ability.extra.mult,self.ability.extra.flavorText}
end

function jokerInfo.init(self)
	self.ability.extra = {
		mult = 0,
		movedYet = false,
		position = -1
	}
	updateFlavorText(self)
end

function jokerInfo.calculate(self, context)
	updateFlavorText(self)
	
	if context.before and context.cardarea == G.jokers and context.scoring_hand and (not context.repetition) then
		if self.ability.extra.movedYet then --was moved
			self.ability.extra.movedYet = false
			self.ability.extra.mult = self.ability.extra.mult + 2
		else --was not moved
			self.ability.extra.mult = 0
			return {
				message = localize('k_scamperTaunt'),
				colour = G.C.RED,
				card = self
			}
		end
	end
	
	if SMODS.end_calculate_context(context) then
		if self.ability.extra.mult ~= 0 then
			return {
				message = localize { type = 'variable', key = 'a_mult', vars = {self.ability.extra.mult} },
				mult_mod = self.ability.extra.mult,
			}
		end
	end
end

function jokerInfo.update(self, dt)
	if self.ability.extra.position == -1 then -- init
		self.ability.extra.position = mod.getCardPosition(self)
	else
		local newPosition = mod.getCardPosition(self)
		if self.ability.extra.position ~= newPosition and (not self.ability.extra.movedYet) then
			self.ability.extra.movedYet = true
		end
		self.ability.extra.position = newPosition
	end
end


return jokerInfo
	