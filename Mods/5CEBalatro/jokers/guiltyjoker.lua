local jokerInfo = {
	name = '遭罪小丑',
	config = {},
	text = {
		'每拥有{C:money}$1{}，本牌获得{C:mult}+1{}倍率',
		'上限为{C:mult}+40{}倍率',
		'{C:attention}售出本牌时失去所有资金',
		'{C:inactive}（当前为{C:mult}+#1#{C:inactive}倍率）'
	},
	rarity = 2,
	cost = 4,
	canBlueprint = true,
	canEternal = true
}


function jokerInfo.locDef(self)
	return {math.min(40,G.GAME.dollars)}
end

local function updateSellCost(self)
	self.sell_cost = -1 * G.GAME.dollars
	sell_cost_label = -1 * G.GAME.dollars
end

function jokerInfo.init(self)
	updateSellCost(self)
end

function jokerInfo.update(self,dt)
	updateSellCost(self)
end

function jokerInfo.calculate(self, context)
	updateSellCost(self)
	if SMODS.end_calculate_context(context) then
		return {
			message = localize { type = 'variable', key = 'a_mult', vars = { math.min(40,G.GAME.dollars) } },
			mult_mod = math.min(40,G.GAME.dollars),
		}
	end
end



return jokerInfo
	