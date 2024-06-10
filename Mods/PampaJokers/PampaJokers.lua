--- STEAMODDED HEADER
--- MOD_NAME: Pampa Joker Pack
--- MOD_ID: mtl_jkr
--- MOD_AUTHOR: [Matelote]
--- MOD_DESCRIPTION: Adds 28 Jokers in the game


----------------------------------------------
------------MOD CODE -------------------------



function table_length(table)
    local count = 0
    for _ in pairs(table) do count = count + 1 end
    return count
end





function SMODS.INIT.MtlJokers()

     -- Localization
    G.localization.misc.dictionary.pampa_bye = "拜拜！"
    G.localization.misc.dictionary.k_upgrade_ex_claw = "升级所有3！"
    G.localization.misc.dictionary.ph_black_star = "黑色五芒星拯救了你"
    G.localization.misc.v_dictionary.sliding_joker = {"+#1#倍率！+#2#筹码！"}

    init_localization()
    
    local mtlJokers = {
        j_jazztrio = {
            order = 151,
            unlocked = true,
            discovered = true,
            blueprint_compat = true,
            eternal_compat = true,
            rarity = 1,
            cost = 4,
            name = "Jazz Trio",
            set = "Joker",
            config = { extra = {}},
            pos = { x = 0, y = 0 },
            atlas = "MTLJoker"
        },
        j_subway = {
            order = 152,
            unlocked = true,
            discovered = true,
            blueprint_compat = true,
            eternal_compat = true,
            rarity = 1,
            cost = 5,
            name = "Subway Map",
            set = "Joker",
            config = { extra = {mult_gain=4, mult=0, hand=0}},
            pos = { x = 3, y = 0 },
            atlas = "MTLJoker"
        },
        j_snecko = {
            order = 153,
            unlocked = true,
            discovered = true,
            blueprint_compat = false,
            eternal_compat = true,
            rarity = 2,
            cost = 6,
            name = "Snecko Eye",
            set = "Joker",
            config = {h_size=0,extra ={deck=false}},
            pos = { x = 5, y = 1 },
            atlas = "MTLJoker"
        },
        j_sealbouquet = {
            order = 154,
            unlocked = true,
            discovered = true,
            blueprint_compat = true,
            eternal_compat = true,
            rarity = 2,
            cost = 7,
            name = "Seal Bouquet",
            set = "Joker",
            config = {},
            pos = {x=0,y=2},
            atlas = "MTLJoker"
        },
        j_mixtape = {
            order = 155,
            unlocked = true,
            discovered = true,
            blueprint_compat = true,
            eternal_compat = true,
            rarity = 2,
            cost = 7,
            name = "Mixtape",
            set = "Joker",
            config = {extra={money_gain=2, money=0}},
            pos = {x=1,y=2},
            atlas = "MTLJoker"
        },
        j_bikini = {
            order = 156,
            unlocked = true,
            discovered = true,
            blueprint_compat = true,
            eternal_compat = true,
            rarity = 2,
            cost = 7,
            name = "Tiger Bikini",
            set = "Joker",
            config = { extra = {mult=3, threshold=13}},
            pos = { x = 1, y = 0 },
            atlas = "MTLJoker"
        },
        j_flamingo = {
            order = 157,
            unlocked = true,
            discovered = true,
            blueprint_compat = true,
            eternal_compat = true,
            rarity = 2,
            cost = 7,
            name = "Flamingo",
            set = "Joker",
            config = {extra={odds=30}},
            pos = {x=2,y=2},
            atlas = "MTLJoker"
        },
        j_sliding = {
            order = 158,
            unlocked = true,
            discovered = true,
            blueprint_compat = true,
            eternal_compat = true,
            rarity = 1,
            cost = 4,
            name = "Sliding Joker",
            set = "Joker",
            config = {extra={mult=0, chips=0,mult_gain=5,chip_gain=25}},
            pos = {x=4,y=0},
            atlas = "MTLJoker"
        },
        j_claw = {
            order = 159,
            unlocked = true,
            discovered = true,
            blueprint_compat = true,
            eternal_compat = true,
            rarity = 2,
            cost = 6,
            name = "Claw",
            set = "Joker",
            config = {extra= {chip_gain=1}},
            pos = {x=4,y=1},
            atlas = "MTLJoker"
        },
        j_mahjong = {
            order = 160,
            unlocked = true,
            discovered = true,
            blueprint_compat = true,
            eternal_compat = true,
            rarity = 2,
            cost = 6,
            name = "Mahjong Joker",
            set = "Joker",
            config = {extra={xmult_gain=0.3,frequency=3,counter=0}, Xmult = 1},
            pos = {x=6,y=0},
            atlas = "MTLJoker"
        },
        j_blackstar = {
            order = 161,
            unlocked = true,
            discovered = true,
            blueprint_compat = false,
            eternal_compat = false,
            rarity = 3,
            cost = 8,
            name = "Black Star",
            set = "Joker",
            config = {},
            pos = {x=7,y=0},
            atlas = "MTLJoker"
        },
        j_moon = {
            order = 162,
            unlocked = true,
            discovered = true,
            blueprint_compat = true,
            eternal_compat = true,
            rarity = 1,
            cost = 5,
            name = "Moon Rabbit",
            set = "Joker",
            config = {extra={odds=2}},
            pos = {x=0,y=1},
            atlas = "MTLJoker"
        },
        j_bell = {
            order = 163,
            unlocked = true,
            discovered = true,
            blueprint_compat = true,
            eternal_compat = true,
            rarity = 1,
            cost = 5,
            name = "Bell Curve",
            set = "Joker",
            config = {},
            pos = {x=3,y=1},
            atlas = "MTLJoker"
        },
        j_konbini = {
            order = 164,
            unlocked = true,
            discovered = true,
            blueprint_compat = true,
            eternal_compat = true,
            rarity = 1,
            cost = 4,
            name = "Konbini",
            set = "Joker",
            config = {extra={mult=2}},
            pos = {x=3,y=2},
            atlas = "MTLJoker"
        },
        j_3776 = {
            order = 165,
            unlocked = true,
            discovered = true,
            blueprint_compat = true,
            eternal_compat = true,
            rarity = 2,
            cost = 6,
            name = "3776",
            set = "Joker",
            config = {extra={mult=6,repetitions=1}},
            pos = {x=4,y=2},
            atlas = "MTLJoker"
        },
        j_pampa = {
            order = 166,
            unlocked = true,
            discovered = true,
            blueprint_compat = false,
            eternal_compat = false,
            rarity = 1,
            cost = 5,
            name = "Pampa",
            set = "Joker",
            effect = "Bonus dollars",
            config = {extra={money=10,odds = 3}},
            pos = {x=5,y=2},
            atlas = "MTLJoker"
        } ,
        j_voodoo = {
            order = 10,
            unlocked = true,
            discovered = true,
            blueprint_compat = true,
            eternal_compat = true,
            rarity = 2,
            cost = 6,
            name = "Voodoo Doll",
            set = "Joker",
            config = {extra={hand="", hand_array={},x_mult_gain=0.8}},
            pos = {x=9,y=1},
            atlas = "MTLJoker"
        },
        j_cherry = {
            order = 0,
            unlocked = true,
            discovered = true,
            blueprint_compat = true,
            eternal_compat = false,
            rarity = 1,
            cost = 4,
            name = "Cherry",
            set = "Joker",
            config = {extra={mult_gain=2,pairs_discarded=0,hands_limit=12}},
            pos = {x=2,y=0},
            atlas = "MTLJoker"
        },
        j_cafeg = {
            order = 0,
            unlocked = true,
            discovered = true,
            blueprint_compat = true,
            eternal_compat = false,
            rarity = 1,
            cost = 4,
            name = "Café Gourmand",
            set = "Joker",
            config = {extra= {chips=80,n=3}},
            pos = {x=8,y=1},
            atlas = "MTLJoker"
        },
        j_pimpbus= {
            order = 0,
            unlocked = true,
            discovered = true,
            blueprint_compat = true,
            eternal_compat = true,
            rarity = 2,
            cost = 6,
            name = "Pimp The Bus",
            set = "Joker",
            config = {extra= {x_mult_gain=0.1}},
            pos = {x=7,y=1},
            atlas = "MTLJoker"
        },
        j_selfpaint= {
            order = 0,
            unlocked = true,
            discovered = true,
            blueprint_compat = false,
            eternal_compat = true,
            rarity = 2,
            cost = 6,
            name = "Self Portrait",
            set = "Joker",
            config = {extra= {}},
            pos = {x=8,y=2},
            atlas = "MTLJoker"
        },
        j_matry = {
            order = 0,
            unlocked = true,
            discovered = true,
            blueprint_compat = true,
            eternal_compat = true,
            rarity = 1,
            cost = 5,
            name = "Matryoshka",
            set = "Joker",
            config = {extra={chips=30,size_list={}}},
            pos = {x=2,y=1},
            atlas = "MTLJoker"
        },
        -- j_mathurine = {
        --     order = 6,
        --     unlocked = true,
        --     discovered = true,
        --     blueprint_compat = true,
        --     eternal_compat = true,
        --     rarity = 4,
        --     cost = 15,
        --     name = "Mathurine",
        --     set = "Joker",
        --     config = {extra={already_moved=false}},
        --     pos = {x=6,y=1},
        --     atlas = "MTLJoker"
        -- },
        j_trick = {
            order = 5,
            unlocked = true,
            discovered = true,
            blueprint_compat = true,
            eternal_compat = true,
            rarity = 3,
            cost = 8,
            name = "Trick or Treat",
            set = "Joker",
            config = {extra={x_mult_gain=1}},
            pos = { x = 9, y = 0 },
            atlas = "MTLJoker"
        },
        -- j_13 = {
        --     order = 3,
        --     unlocked = true,
        --     discovered = true,
        --     blueprint_compat = true,
        --     eternal_compat = true,
        --     rarity = 3,
        --     cost = 8,
        --     name = "Number 13",
        --     set = "Joker",
        --     config = {},
        --     pos = { x = 1, y = 1 },
        --     atlas = "MTLJoker"}
        -- ,
        j_fabric = {
            order = 3,
            unlocked = true,
            discovered = true,
            blueprint_compat = false,
            eternal_compat = true,
            rarity = 3,
            cost = 8,
            name = "Fabric Design",
            set = "Joker",
            config = {extra={added_to_deck=false}},
            pos = { x = 7, y = 2 },
            atlas = "MTLJoker"
        },
        j_open = {
                order = 0,
                unlocked = true,
                discovered = true,
                blueprint_compat = true,
                eternal_compat = true,
                rarity = 2,
                cost = 6,
                name = "Grand Slam",
                set = "Joker",
                config = {extra={xmult_gain=0.5,played_suits={},n_played_suits=0}},
                pos = {x=8,y=0},
                atlas = "MTLJoker"
        },
        j_thedream = {
            order = 0,
            unlocked = true,
            discovered = true,
            blueprint_compat = true,
            eternal_compat = true,
            rarity = 3,
            cost = 8,
            name = "The Dream",
            set = "Joker",
            config = {extra={}},
            pos = {x=0,y=3},
            atlas = "MTLJoker"
        },
        j_ishihara = {
            order = 0,
            unlocked = true,
            discovered = true,
            blueprint_compat = false,
            eternal_compat = true,
            rarity = 1,
            cost = 5,
            name = "Ishihara Test",
            set = "Joker",
            config = {extra={}},
            pos = {x=9,y=2},
            atlas = "MTLJoker"
        },
        j_scopedog = {
            order = 0,
            unlocked = true,
            discovered = true,
            blueprint_compat = false,
            eternal_compat = true,
            rarity = 2,
            cost = 6,
            name = "Scopedog",
            set = "Joker",
            config = {extra={}},
            pos = {x=5,y=0},
            atlas = "MTLJoker"
        },        
    }

    -- Add Jokers to center and rarity ppools
    for k, v in pairs(mtlJokers) do
        v.key = k
        v.order = table_length(G.P_CENTER_POOLS['Joker']) + 1
        G.P_CENTERS[k] = v
        table.insert(G.P_CENTER_POOLS['Joker'], v)
        table.insert(G.P_JOKER_RARITY_POOLS[v.rarity], v)
    end

    table.sort(G.P_CENTER_POOLS["Joker"], function (a, b) return a.order < b.order end)

    -- Localization
    local jokerLocalization = {

        j_jazztrio = {
            name = "爵士三重奏",
            text = {
                "如果打出的牌中包含",
                "计分的{C:attention}J{}、{C:attention}Q{}和{C:attention}K{}",
                "升级{C:attention}两{}个随机的{C:attention}牌型"
            }
        },
        j_bikini = {
            name = "虎纹比基尼",
            text = {
                "完整牌组内的{C:hearts}红桃{}牌",
                "每比{C:attention}#2#{}多一张",
                "本牌获得{C:red}+#1#{}倍率",
                "{C:inactive}（当前为{C:red}+#3#{C:inactive}倍率）"
            }
        },
        j_cherry = {
            name = "樱桃",
            text = {
                "每弃掉一个{C:attention}对子{}，{C:red}+#1#{}倍率",
                "弃掉{C:attention}#3#{}个对子时摧毁本牌",
                "{C:inactive}（当前为{C:red}+#2#{C:inactive}倍率）"

            }
        },
        j_subway = {
            name = "Subway Map",
            text = {
                "Gains {C:red}+#1#{} Mult if played hand",
                "contains the highest {C:attention}Straight{} so far.",
                "{C:inactsive}(Highest rank: #3#){}",
                "{C:inactive}(Currently: +#2#){}",
            }
        },
        j_13 = {
            name = "Number 13",
            text = {
                "When any {C:attention}Glass Card{} breaks",
                "add one {C:attention}Glass Rank 13{}",
                "card to your deck"
            }
        },
        j_snecko = {
            name = "异蛇之眼",
            text = {
                "随机改变每回合",
                "初始手牌的点数",
                "",
            }
        },
        j_trick = {
            name = "万圣捣蛋鬼",
            text = {
                "每使用一张{C:spectral}幻灵牌",
                "本牌获得{X:mult,C:white}X#1#{}倍率",
                "{C:inactive}（当前为{X:mult,C:white}X#2#{C:inactive}倍率）"
            }
        },
        j_mathurine = {
            name = "Mathurine",
            text = {
                "{C:attention}Pins{} all jokers and copies",
                "ability of joker to the right thrice.",
                "Each time a hand is played, move {C:dark_edition}Mathurine{}",
                "one step to the right.",
            }
        },
        j_sealbouquet = {
            name = "蜡封团簇",
            text = {
                "若打出的{C:clubs}黑桃{}同花中",
                "第一张牌拥有{C:attention}蜡封{}",
                "则随机为另一张牌",
                "打上一个蜡封"
            }
        },
        j_mixtape = {
            name = "混音带",
            text = {
                "牌组中每有一张增强的{C:clubs}梅花{}牌",
                "回合结束时获得{C:money}$#1#",
                "{C:inactive}（当前为{C:money}$#2#{C:inactive}）",
            }
        },
        j_flamingo = {
            name = "火烈鸟",
            text = {
                "打出的{C:diamonds}方片{}牌",
                "有{C:green}#1#/#2#{}的几率",
                "变为{C:dark_edition}多彩"
            }
        },
        j_voodoo = {
            name = "巫毒娃娃",
            text = {
                "出牌时，每有一张牌",
                "与当前回合内已出过的牌",
                "点数相同，给予{X:mult,C:white}X#1#{}倍率",
                "（已出点数：[{C:attention}#2#{}]）"

            }
        },
        j_sliding = {
            name = "滑块小丑",
            text = {
                "每打出一手包含{C:attention}同花{}的牌，{C:red}+#1#{}倍率",
                "每打出一手包含{C:attention}顺子{}的牌，{C:chips}+#2#{}筹码",
                "每个底注结束时重置",
                "（当前为{C:red}+#3#{}倍率，{C:chips}+#4#{}筹码）"
            }
        },
        j_claw = {
            name = "三指爪痕",
            text = {
                "打出任何一张{C:attention}3{}时",
                "牌组中的所有{C:attention}3",
                "永久{C:chips}+#1#{}筹码"
            }
        },
        j_matry = {
            name = "俄罗斯套娃",
            text = {
                "出牌时，若本回合内",
                "未打出过相同张数的出牌",
                "{C:blue}+#1#{}筹码"
            }
        },
        j_3776 = {
            name = "3776",
            text = {
                "打出的每张{C:attention}3{}、{C:attention}6{}和{C:attention}7",
                "在计分时给予{C:mult}+#1#{}倍率",
                "重新触发所有{C:attention}7"
            }
        },
        j_pampa = {
            name = "潘帕",
            text = {
                "回合结束时获得{C:money}$#1#",
                "但有{C:green}#2#/#3#{}的几率被摧毁"
            }
        },
        j_bell = {
            name = "正态分布",
            text = {
                "抽取第一手牌后，随机增强",
                "其中的一张牌为{C:attention}幸运牌"
            }
        },
        j_moon = {
            name = "玉兔",
            text = {
                "如果打出的牌中包含{C:attention}葫芦",
                "则有{C:green}#1#/#2#{}的几率",
                "生成一张{C:attention}愚者"
            }
        },
        j_mahjong = {
            name = "麻将小丑",
            text = {
                "每#2#次出牌",
                "包含{C:attention}三条{}时",
                "获得{X:mult,C:white} X#1# {}倍率",
                "{C:inactive}（#3#/#2#次）",
                "{C:inactive}（当前为{X:mult,C:white} X#4# {C:inactive}倍率）"
            }
        },
        j_blackstar = {
            name = "黑色五芒星",
            text = {
                "避免一次死亡",
                "摧毁所有小丑牌",
                "并生成2张随机的",
                "{C:attention}稀有{}小丑牌"
            }
        },
        j_cafeg = {
            name = "甜点配咖啡",
            text = {
                "若当前牌型打出的次数",
                "低于等于#2#",
                "{C:chips}+#1#{}筹码"
            }
        },
        j_konbini = {
            name = "日式便利店",
            text = {
                "本赛局中",
                "每使用一{C:attention}种{C:tarot}塔罗牌",
                "获得{C:mult}+#1#{}倍率",
                "{C:inactive}（当前为{C:mult}+#2#{}倍率）"
            }
        },

        j_fabric = {
            name = "锦织装饰",
            text = {
                "选择{C:attention}盲注{}时",
                "失去所有{C:red}弃牌次数",
                "并为整个牌组随机添加{C:attention}增强",
                "移除本牌时，所有卡牌退回原状"
            }
        },
        j_selfpaint = {
            name = "Self Portrait",
            text = {
                "First unscoring face card turns",
                "into a random non-face rank."
            }
        },
        j_pimpbus = {
            name = "拉客巴士",
            text = {
                "打出的牌若至少包含一张",
                "带有{C:attention}增强{}、{C:attention}版本{}或{C:attention}蜡封{}的卡牌",
                "本牌获得{X:mult,C:white}X#1#{}倍率",
                "不合要求的出牌将重置倍率",
                "{C:inactive}（当前为{X:mult,C:white}x#2#{C:inactive}倍率）"
            }
        },
        j_open = {
            name = "大满贯",
            text = {
                "本回合内",
                "每打出一种花色的同花",
                "本牌获得{X:mult,C:white}X#1#{}倍率",
                "{C:inactive}（已打出花色：#3#）",
                "{C:inactive}（当前为{X:mult,C:white}X#2#{}倍率）"
            }
        },       
        j_thedream = {
            name = "梦",
            text = {
                "打出秘密牌型时",
                "{C:attention}提升{}其等级"
            }
        },   
        j_ishihara = {
            name = "色盲检测图",
            text = {
                "打出的所有{C:attention}9{}和{C:attention}6",
                "变为{C:attention}百搭牌"
            }
        },
        j_scopedog = {
            name = "眼镜斗犬",
            text = {
                "在{C:attention}Boss盲注{}中",
                "如果打出的牌中",
                "包含{C:attention}3张A",
                "消除{C:attention}限制条件"
            }         
        }
    }

   
    for k, v in pairs(jokerLocalization) do
        G.localization.descriptions.Joker[k] = v
    end
  
    -- Update localization
    for g_k, group in pairs(G.localization) do
        if g_k == 'descriptions' then
            for _, set in pairs(group) do
                for _, center in pairs(set) do
                    center.text_parsed = {}
                    for _, line in ipairs(center.text) do
                        center.text_parsed[#center.text_parsed + 1] = loc_parse_string(line)
                    end
                    center.name_parsed = {}
                    for _, line in ipairs(type(center.name) == 'table' and center.name or { center.name }) do
                        center.name_parsed[#center.name_parsed + 1] = loc_parse_string(line)
                    end
                    if center.unlock then
                        center.unlock_parsed = {}
                        for _, line in ipairs(center.unlock) do
                            center.unlock_parsed[#center.unlock_parsed + 1] = loc_parse_string(line)
                        end
                    end
                end
            end
        end
    end

    -- Add Joker sprites
    local mtl_jkr_mod = SMODS.findModByID("mtl_jkr")
    local sprite_mtl = SMODS.Sprite:new("MTLJoker", mtl_jkr_mod.path, "Jokers_mtl.png", 71, 95, "asset_atli")
    sprite_mtl:register()


    -- Add Rank 13
    -- This rank can only be created by the joker Number 13
    -- Note: Suffix B will be picked by the function, for instance 13 of heart will be called "H_B"
    -- local cards_rank13 = SMODS.Sprite:new('cards_rank13', mtl_jkr_mod.path, 'cards_rank13.png', 71, 95, 'asset_atli')
    -- local cards_rank13_opt2 = SMODS.Sprite:new('cards_rank13_opt2', mtl_jkr_mod.path, 'cards_rank13_opt2.png', 71, 95, 'asset_atli')
    -- cards_rank13:register()
    -- cards_rank13_opt2:register()
    -- SMODS.Card:new_rank('13', 13, 'cards_rank13', 'cards_rank13_opt2', { x = 0 }, {
    --     Hearts = { y = 0 },
    --     Clubs = { y = 1 },
    --     Diamonds = { y = 2 },
    --     Spades = { y = 3 }
    -- }, {
    --     next= {},
    --     strength_effect = { ignore = true }
    -- })   


end





---------------------
-- Joker abilities --
---------------------
local set_abilityref = Card.set_ability
function Card.set_ability(self, center, initial, delay_sprites)
    set_abilityref(self, center, initial, delay_sprites)

    if self.ability.name == "Tiger Bikini" then
        self:set_sprites(center)
    elseif self.ability.name == "Subway Map" then
        self:set_sprites(center)
    elseif self.ability.name == "Cherry" then
        self:set_sprites(center)
    elseif self.ability.name == "Jazz Trio" then
        self:set_sprites(center)
    elseif self.ability.name == "Number 13" then
        self:set_sprites(center)
    elseif self.ability.name == "Snecko Eye" then
        self:set_sprites(center)
    elseif self.ability.name == "Trick or Treat" then
        self:set_sprites(center)
    elseif self.ability.name == "Mathurine" then
        self:set_sprites(center)
    elseif self.ability.name == "Mixtape" then
        self:set_sprites(center)
    elseif self.ability.name == "Seal Bouquet" then
        self:set_sprites(center)
    elseif self.ability.name == "Flamingo" then
        self:set_sprites(center)
    elseif self.ability.name == "Voodoo Doll" then
        self:set_sprites(center)
    elseif self.ability.name == "Sliding Joker" then
        self:set_sprites(center)
    elseif self.ability.name == "Claw" then
        self:set_sprites(center)
    elseif self.ability.name == "Matryoshka" then
        self:set_sprites(center)
    elseif self.ability.name == "Cherry" then
        self:set_sprites(center)
    elseif self.ability.name == "Café Gourmand" then
        self:set_sprites(center)
    elseif self.ability.name == "Mahjong Joker" then
        self:set_sprites(center)
    elseif self.ability.name == "Black Star" then
        self:set_sprites(center)
    elseif self.ability.name == "Grand Slam" then
        self:set_sprites(center)
    elseif self.ability.name == "Moon Rabbit" then
        self:set_sprites(center)
    elseif self.ability.name == "Bell Curve" then
        self:set_sprites(center)
    elseif self.ability.name == "Konbini" then
        self:set_sprites(center)
    elseif self.ability.name == "3776" then
        self:set_sprites(center)
    elseif self.ability.name == "Pampa" then
        self:set_sprites(center)
    elseif self.ability.name == "Pimp The Bus" then
        self:set_sprites(center)
    elseif self.ability.name == "The Dream" then
        self:set_sprites(center)
    end
end




local calculate_jokerref = Card.calculate_joker
function Card.calculate_joker(self, context)
    local calc_ref = calculate_jokerref(self, context)
    if self.ability.set == "Joker" and not self.debuff then
        if context.open_booster then
        elseif context.buying_card then
        elseif context.selling_self then
        elseif context.selling_card then
        elseif context.reroll_shop then
        elseif context.ending_shop then
        elseif context.skip_blind then
        elseif context.skipping_booster then
        elseif context.playing_card_added and not self.getting_sliced then
        elseif context.first_hand_drawn then
            if self.ability.name == 'Snecko Eye' and not context.blueprint then
                    sendDebugMessage("subsequent hand drawn")
                    -- Check if a hand or a discard was played
                    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                        play_sound('tarot1')
                        return true end }))
        
                    for i=1, #G.hand.cards do
                        local percent = 1.15 - (i-0.999)/(#G.hand.cards-0.998)*0.3
                        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.4,func = function() G.hand.cards[i]:flip();play_sound('card1', percent);G.hand.cards[i]:juice_up(0.3, 0.3);return true end }))
                    end
        
                    delay(0.5)
                    
                    G.E_MANAGER:add_event(Event({
                        func = function() 
                            for i=1, #G.hand.cards do
                                local _rank = pseudorandom_element({'2','3','4','5','6','7','8','9','T','J','Q','K','A'}, pseudoseed('ouija'))
                                local card = G.hand.cards[i]
                                local suit_prefix = string.sub(card.base.suit, 1, 1)..'_'
                                local rank_suffix =_rank
                                card:set_base(G.P_CARDS[suit_prefix..rank_suffix])
                            end  
                            G.hand:sort()
                            return true
                        end}))
                    
                    for i=1, #G.hand.cards do
                        local percent = 0.85 + (i-0.999)/(#G.hand.cards-0.998)*0.3
                        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.4,func = function() G.hand.cards[i]:flip();play_sound('tarot2', percent, 0.6);G.hand.cards[i]:juice_up(0.3, 0.3);return true end }))
                    end
                    delay(0.5)
            elseif self.ability.name == 'Bell Curve' then
                G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4,  func = function()
                        sendDebugMessage(#G.hand.cards)
                        --get non-enchanced cards in hand
                        local non_enh_list={}
                        for i=1, #G.hand.cards do
                            if G.hand.cards[i].config.center == G.P_CENTERS.c_base then table.insert(non_enh_list,G.hand.cards[i]) end
                        end
                        if #non_enh_list>0 then
                            enhanced_card = pseudorandom_element(non_enh_list, pseudoseed('bellcurve'))
                            enhanced_card:set_ability(G.P_CENTERS.m_lucky , nil, true)
                            play_sound('tarot1')
                            enhanced_card:juice_up()
                        end
                        return true
                    end
                })) 
            elseif self.ability.name == 'Fabric Design' then
                self.ability.extra.added_to_deck = true --not the right place for this but eh
                G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                    play_sound('tarot1')
                    return true end }))
                for i=1, #G.hand.cards do
                    local percent = 1.15 - (i-0.999)/(#G.hand.cards-0.998)*0.3
                    G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.4,func = function() G.hand.cards[i]:flip();play_sound('card1', percent);G.hand.cards[i]:juice_up(0.3, 0.3);return true end }))
                end
    
                delay(0.5)
                G.E_MANAGER:add_event(Event({
                    func = function() 
                        for i=1, #G.playing_cards do
                            local card = G.playing_cards[i]
                            local cen_pool = {}
                            for k, v in pairs(G.P_CENTER_POOLS["Enhanced"]) do
                                cen_pool[#cen_pool+1] = v
                            end
                            center = pseudorandom_element(cen_pool, pseudoseed('spe_card'))

                            card:set_ability(center, nil, true)
                        end  
                        return true
                    end}))
                
                for i=1, #G.hand.cards do
                    local percent = 0.85 + (i-0.999)/(#G.hand.cards-0.998)*0.3
                    G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.4,func = function() G.hand.cards[i]:flip();play_sound('tarot2', percent, 0.6);G.hand.cards[i]:juice_up(0.3, 0.3);return true end }))
                end
                delay(0.5)                


            end
        elseif context.setting_blind and not self.getting_sliced then
            if self.ability.name == 'Fabric Design' and not (context.blueprint_card or self).getting_sliced then
                G.E_MANAGER:add_event(Event({func = function()
                    ease_discard(-G.GAME.current_round.discards_left, nil, true)
                return true end }))
            end
        elseif context.destroying_card then
           
        elseif context.cards_destroyed then
            -- if self.ability.name == 'Number 13' then
            --     --count number of cards destroyed
            --     local glasses = 0
            --     for k, v in ipairs(context.glass_shattered) do
            --          if v.shattered then
            --              glasses = glasses + 1
            --          end
            --     end
            --     sendDebugMessage("entering cards_destroyed")
            --     sendDebugMessage(glasses)
            --     -- Create card(s) - CAN be blueprinted
            --     if glasses > 0 then
            --         for i=1, glasses do
            --             sendDebugMessage("create card")
            --             G.deck.config.card_limit = G.deck.config.card_limit + 1
            --             G.E_MANAGER:add_event(Event({
            --                 func = function() 
            --                     _suit = pseudorandom_element({'S','H','D','C'}, pseudoseed('13_create'))
            --                     local _card =  create_playing_card({front = G.P_CARDS[_suit..'_'..'B'], center = G.P_CENTERS.m_glass}, G.hand)
            --                     if context.blueprint_card then context.blueprint_card:juice_up() else self:juice_up() end
            --                     return true
            --             end}))  
            --         end
            --     end

            --     return {
            --         message = localize('k_copied_ex'),
            --         colour = G.C.CHIPS,
            --         card = self,
            --         playing_cards_created = {true}
            --     }
            -- end
        elseif context.remove_playing_cards then
            if self.ability.name == 'Number 13'  then
                --count number of cards destroyed
                local glasses = 0
                for k, val in ipairs(context.removed) do
                    if val.shattered then glasses = glasses + 1 end
                end
                sendDebugMessage("entering cards_removed")
                sendDebugMessage(glasses)
                -- Create card(s) - CAN be blueprinted
                if glasses > 0 then
                    for i=1, glasses do
                        sendDebugMessage("create card")
                        G.deck.config.card_limit = G.deck.config.card_limit + 1
                        G.E_MANAGER:add_event(Event({
                            func = function() 
                                _suit = pseudorandom_element({'S','H','D','C'}, pseudoseed('13_create'))
                                local _card =  create_playing_card({front = G.P_CARDS[_suit..'_'..'B'], center = G.P_CENTERS.m_glass}, G.hand)
                                if context.blueprint_card then context.blueprint_card:juice_up() else self:juice_up() end
                                return true
                        end}))  
                    end
                end

                return
            end
        elseif context.using_consumeable  then
            -- if self.ability.name == 'Number 13' and not context.blueprint and context.consumeable.ability.name == 'The Hanged Man' then
            --     --count number of cards destroyed
            --     local glasses = 0
            --     if not context.blueprint then
            --         for k, val in ipairs(G.hand.highlighted) do
            --             if val.ability.name == 'Glass Card' then glasses = glasses + 1 end
            --         end
            --     end
            --     sendDebugMessage("ok")
            --     sendDebugMessage(glasses)
            --     -- Create card(s) - CAN be blueprinted
            --     if glasses > 0 then
            --         for i=1, glasses do
            --             sendDebugMessage("create card")
            --             G.deck.config.card_limit = G.deck.config.card_limit + 1
            --             G.E_MANAGER:add_event(Event({
            --                 func = function() 
            --                     _suit = pseudorandom_element({'S','H','D','C'}, pseudoseed('13_create'))
            --                     local _card =  create_playing_card({front = G.P_CARDS[_suit..'_'..'B'], center = G.P_CENTERS.m_glass}, G.hand)
            --                     if context.blueprint_card then context.blueprint_card:juice_up() else self:juice_up() end
            --                     return true
            --             end}))  
            --         end
            --     end

            --     return
            -- end            
        elseif context.debuffed_hand then 
        elseif context.pre_discard then
            if self.ability.name == 'Cherry'  then
                local text,disp_text = G.FUNCS.get_poker_hand_info(G.hand.highlighted)
                if text=="Pair" then
                    self.ability.extra.pairs_discarded=self.ability.extra.pairs_discarded+1
                    if (self.ability.extra.hands_limit-self.ability.extra.pairs_discarded) <= 0 then 
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                play_sound('tarot1')
                                self.T.r = -0.2
                                self:juice_up(0.3, 0.4)
                                self.states.drag.is = true
                                self.children.center.pinch.x = true
                                G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
                                    func = function()
                                            G.jokers:remove_card(self)
                                            self:remove()
                                            self = nil
                                        return true; end})) 
                                return true
                            end
                        })) 
                        return {
                            message = localize('k_eaten_ex'),
                            colour = G.C.FILTER
                        }
                    else
                        card_eval_status_text(context.blueprint_card or self, 'extra', nil, nil, nil, {message = localize('k_upgrade_ex')})
                    end

                end

            end
        elseif context.discard then
        elseif context.end_of_round then
            if context.individual then
            elseif context.repetition then

            elseif not context.blueprint then
                if self.ability.name == 'Grand Slam' then
                    self.ability.extra.n_played_suits=0
                    self.ability.extra.played_suits={}
                end
                if self.ability.name == 'Voodoo Doll' then
                    self.ability.extra.hand_array={}
                    self.ability.extra.hand=""
                end
                if self.ability.name == 'Pampa'  then
                    if pseudorandom('Pampa') < G.GAME.probabilities.normal/self.ability.extra.odds then 
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                play_sound('tarot1')
                                self.T.r = -0.2
                                self:juice_up(0.3, 0.4)
                                self.states.drag.is = true
                                self.children.center.pinch.x = true
                                G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
                                    func = function()
                                            G.jokers:remove_card(self)
                                            self:remove()
                                            self = nil
                                        return true; end})) 
                                return true
                            end
                        })) 
                        return {
                            message = localize('pampa_bye')
                        }
                    else
                        return {
                            message = localize('k_safe_ex')
                        }
                    end
                elseif self.ability.name == 'Sliding Joker' and G.GAME.blind.boss then
                    self.ability.extra.mult = 0
                    self.ability.extra.chips = 0
                    return {
                        message = localize('k_reset'),
                        colour = G.C.RED
                    }
                elseif self.ability.name == 'Black Star' and context.game_over then
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.hand_text_area.blind_chips:juice_up()
                            G.hand_text_area.game_chips:juice_up()

                            --First remove all jokers and keep track of rarity, and edition and eternals
                            play_sound('tarot1')
                            n_jokers=#G.jokers.cards
                            local n_eternal=0
                            local n_negative=0
                            for i = 1, n_jokers do
                                --Check if the joker is eternal
                                if (G.jokers.cards[i].ability.eternal) then
                                    n_eternal=n_eternal+1
                                else
                                    G.jokers.cards[i]:start_dissolve()
                                end
                            end
                            
                            for i = 1, 2 do
                                    if ((i + n_eternal)  <= (G.jokers.config.card_limit)) then
                                    --create new rare jokers
                                    play_sound('timpani')
                                    --local card = create_card('Joker', G.jokers, False, nil, nil, nil, nil, True and 'jud' or 'sou')
                                    local card = create_card('Joker', G.jokers, nil, 0.99, nil, nil, nil, 'wra')
                                    card:add_to_deck()
                                    G.jokers:emplace(card)
                                    end
                            end
                            return true
                        end
                    })) 
                    return {
                        message = localize('ph_black_star'),
                        saved = true,
                        colour = G.C.RED
                    }
                end

            end
        elseif context.repetition then
            if context.cardarea == G.play then
                if self.ability.name == '3776' and (
                    context.other_card:get_id() == 7) then
                        return {
                            message = localize('k_again_ex'),
                            repetitions = self.ability.extra.repetitions,
                            card = self
                        }
                end
            end
        elseif context.other_joker then
        elseif context.adding_to_deck then
        elseif context.individual then
            if context.cardarea == G.play then
                -- if self.ability.name == 'Fibonacci' and (
                -- context.other_card:get_id() == 2 or 
                -- context.other_card:get_id() == 3 or 
                -- context.other_card:get_id() == 5 or 
                -- context.other_card:get_id() == 8 or 
                -- context.other_card:get_id() == 14 or
                -- context.other_card:get_id() == 15) then
                --     return {
                --         mult = self.ability.extra,
                --         card = self
                --     }
                -- end
                -- if self.ability.name == 'Odd Todd' and
                -- ((context.other_card:get_id() <= 10 and 
                -- context.other_card:get_id() >= 0 and
                -- context.other_card:get_id()%2 == 1) or
                -- (context.other_card:get_id() == 14) or
                -- (context.other_card:get_id() == 15))
                -- then
                --     return {
                --         chips = self.ability.extra,
                --         card = self
                --     }
                -- end
                if self.ability.name == '3776' and (
                    context.other_card:get_id() == 3 or 
                    context.other_card:get_id() == 7 or 
                    context.other_card:get_id() == 6) then
                        return {
                            mult = self.ability.extra.mult,
                            card = self
                        }
                    end
                if self.ability.name == 'Claw' then
                    if context.other_card:get_id() == 3 then
                        --loop on all cards 
                        for k, v in pairs(G.playing_cards) do
                            if v:get_id() == 3 then 
                                v.ability.perma_bonus = v.ability.perma_bonus or 0
                                v.ability.perma_bonus = v.ability.perma_bonus + self.ability.extra.chip_gain
                            end
                        end
                       
                        return {
                            extra = {message = localize('k_upgrade_ex_claw'), colour = G.C.CHIPS},
                            colour = G.C.CHIPS,
                            card = self
                        }
                    end
                end
            end
        else
            if context.cardarea == G.jokers then
                if context.before then
                    if self.ability.name == 'Scopedog' then
                        if G.GAME.blind and ((not G.GAME.blind.disabled) and (G.GAME.blind:get_type() == 'Boss')) then 
                            --check hand
                            local aces=0
                            for i = 1, #context.scoring_hand do
                                if context.scoring_hand[i]:get_id()==14 then
                                    aces=aces+1
                                end
                            end
                            if aces >2 then
                                card_eval_status_text(context.blueprint_card or self, 'extra', nil, nil, nil, {message = localize('ph_boss_disabled')})
                                G.GAME.blind:disable()
                            end

                        end
                    end
                    if self.ability.name == 'Ishihara Test' and not context.blueprint then
                        local found_cards = {}
                        for k, v in ipairs(context.full_hand) do
                            if v:get_id()==6 or v:get_id()==9 then 
                                found_cards[#found_cards+1] = v
                                v:set_ability(G.P_CENTERS.m_wild, nil, true)
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        v:juice_up()
                                        return true
                                    end
                                })) 
                            end
                        end
                        if #found_cards > 0 then 
                            return {
                                colour = G.C.MONEY,
                                card = self
                            }
                        end
                    end
                    if self.ability.name == 'Mathurine' then 
                        self.ability.extra.already_moved=false
                    end
                    if self.ability.name == 'Self Portrait' and not context.blueprint then
                        local first_face=true
                        for i = 1, #context.full_hand do
                            local scoring=false
                            if context.full_hand[i]:is_face() then
                                --check the card is not scoring
                                for j = 1, #context.scoring_hand do
                                    if (context.scoring_hand[j] == context.full_hand[i]) then
                                        scoring=true
                                    end
                                end
                                if not scoring then --do the effect
                                    if first_face then
                                        first_face=false
                                        local suit_prefix = string.sub(context.full_hand[i].base.suit, 1, 1)..'_'
                                        local percent = 1.15 - (1-0.999)/(#G.hand.cards-0.998)*0.3
                                        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() context.full_hand[i]:flip();play_sound('card1', percent);context.full_hand[i]:juice_up(0.3, 0.3);return true end }))
                                        delay(0.5)
                                
                                        G.E_MANAGER:add_event(Event({
                                            func = function() 
                                                local _rank = pseudorandom_element({'2','3','4','5','6','7','8','9','T','A'}, pseudoseed('selfportrait'))
                                                local rank_suffix =_rank
                                                context.full_hand[i]:set_base(G.P_CARDS[suit_prefix..rank_suffix])
                                                return true
                                            end}))
                                        
                                        local percent = 0.85 + (1-0.999)/(#G.hand.cards-0.998)*0.3
                                        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() context.full_hand[i]:flip();play_sound('tarot2', percent, 0.6);context.full_hand[i]:juice_up(0.3, 0.3);return true end }))
                                    end
                                end
                            end
                        end


                    end

                    if self.ability.name == "The Dream" then
                        if next(context.poker_hands["Flush House"]) then
                            --level up flush house
                            level_up_hand(self, "Flush House", false)
                        elseif next(context.poker_hands["Five of a Kind"]) then
                            --check if that is also a flush five
                            if next(context.poker_hands["Flush Five"]) then
                                --level up flush five
                                level_up_hand(self, "Flush Five", false)
                            else
                                --level up 5oak
                                level_up_hand(self, "Five of a Kind", false)
                            end
                        end
                        if next(context.poker_hands["Spectrum"]) then
                            if next(context.poker_hands["Spectrum House"]) then
                                level_up_hand(self, "Spectrum House", false)
                            elseif next(context.poker_hands["Spectrum Five"]) then
                                level_up_hand(self, "Spectrum Five", false)
                            elseif next(context.poker_hands["Straight Spectrum"]) then
                                level_up_hand(self, "Straight Spectrum", false)
                            else level_up_hand(self, "Spectrum", false)
                            end
                        end
                    end

                    if self.ability.name == 'Jazz Trio' then
                        -- check if one scoring king, queen and jack are in the played hand
                        local has_j = 0
                        local has_q = 0
                        local has_k = 0
                        for i = 1, #context.scoring_hand do
                            if context.scoring_hand[i]:get_id() == 11 then has_j=1 end
                            if context.scoring_hand[i]:get_id() == 12 then has_q=1 end
                            if context.scoring_hand[i]:get_id() == 13 then has_k=1 end
                        end
                        if has_j==1 and has_q==1 and has_k==1 then
                            --Get the current poker hand
                            --local k_hand,disp_text = G.FUNCS.get_poker_hand_info(G.hand.highlighted)
                            local k_hand,disp_text,poker_hands,scoring_hand,non_loc_disp_text = G.FUNCS.get_poker_hand_info(G.play.cards)
                            -- Upgrade two random poker hands
                            local possible_hands={}
                            -- Check which poker hands can be upgraded
                            for k, v in pairs(G.GAME.hands) do
                                if G.GAME.hands[k].visible then
                                    table.insert(possible_hands,k)
                                end
                            end
                            -- Choose two random hands to upgrade (can be the same hand twice)
                            for i=1,2 do
                                local k_chosen = pseudorandom_element(possible_hands, pseudoseed('jazz'))
                                update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=localize(k_chosen, 'poker_hands'),chips = G.GAME.hands[k_chosen].chips, mult = G.GAME.hands[k_chosen].mult, level=G.GAME.hands[k_chosen].level})
                                level_up_hand(self, k_chosen, false)
                                update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=localize(k_hand, 'poker_hands'),chips = G.GAME.hands[k_hand].chips, mult = G.GAME.hands[k_hand].mult, level=G.GAME.hands[k_hand].level})
                            end
                            return {
                                message = localize('k_level_up_ex')
                            }
                        end
                    elseif self.ability.name == 'Moon Rabbit' and next(context.poker_hands["Full House"]) and (pseudorandom('moonrabbit') < G.GAME.probabilities.normal/self.ability.extra.odds) and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                        --generate The Fool
                        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                        G.E_MANAGER:add_event(Event({
                            func = (function()
                                G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4,
                                    func = function() 
                                        local card = create_card('Tarot',G.consumeables, nil, nil, nil, nil, 'c_fool', 'car')
                                        card:add_to_deck()
                                        G.consumeables:emplace(card)
                                        G.GAME.consumeable_buffer = 0
                                        return true
                                    end}))   
                                    card_eval_status_text(context.blueprint_card or self, 'extra', nil, nil, nil, {message = localize('k_plus_tarot'), colour = G.C.PURPLE})                       
                                return true
                            end)}))
                    elseif self.ability.name == 'Sliding Joker'  and not context.blueprint then

                        if next(context.poker_hands["Straight Flush"]) then
                            self.ability.extra.mult = self.ability.extra.mult + self.ability.extra.mult_gain
                            self.ability.extra.chips = self.ability.extra.chips + self.ability.extra.chip_gain
                            return {
                                message = localize('k_upgrade_ex'),
                                card = self
                            }
                        elseif next(context.poker_hands["Flush"]) then
                            self.ability.extra.mult = self.ability.extra.mult + self.ability.extra.mult_gain
                            return {
                                message = localize('k_upgrade_ex'),
                                card = self
                            }
                        elseif next(context.poker_hands["Straight"]) then
                            self.ability.extra.chips = self.ability.extra.chips + self.ability.extra.chip_gain
                            return {
                                message = localize('k_upgrade_ex'),
                                card = self
                            }
                        end

                    elseif self.ability.name == 'Seal Bouquet' and next(context.poker_hands["Flush"]) then
                            --check if first card is a spade and has a seal
                            if context.scoring_hand[1]:is_suit('Spades') and context.scoring_hand[1].seal then

                                --get a random number from 2 to 5 or 4
                                possible_cards={}
                                for i = 2, #context.scoring_hand do
                                    table.insert(possible_cards,i)
                                end
                                local i_card=pseudorandom_element(possible_cards)
                                local seal_type = pseudorandom(pseudoseed('sealbouquet'..G.GAME.round_resets.ante))
                                    G.E_MANAGER:add_event(Event({
                                        func = function()
                                            context.scoring_hand[i_card]:juice_up()
                                            if seal_type > 0.75 then context.scoring_hand[i_card]:set_seal('Red')
                                            elseif seal_type > 0.5 then context.scoring_hand[i_card]:set_seal('Blue')
                                            elseif seal_type > 0.25 then context.scoring_hand[i_card]:set_seal('Gold')
                                            else context.scoring_hand[i_card]:set_seal('Purple')
                                            end
                                            return true
                                        end
                                    })) 
                                return {
                                        message = localize("b_seals"),
                                        card = self
                                    }
                            end
                    elseif self.ability.name == 'Flamingo'  then
                        for i = 1, #context.scoring_hand do
                            if context.scoring_hand[i]:is_suit('Diamonds') and (pseudorandom('flamingo') < G.GAME.probabilities.normal/self.ability.extra.odds) then
                                sendDebugMessage("diamond")
                                context.scoring_hand[i]:set_edition({polychrome = true}, true,false)
                            end
                        end
                    elseif self.ability.name == 'Subway Map' and next(context.poker_hands["Straight"]) and not context.blueprint then
                        local broadway_check=false
                        local rank_table={}
                        for i = 1, #context.scoring_hand do
                            table.insert(rank_table,context.scoring_hand[i]:get_id())
                            if context.scoring_hand[i]:get_id()==11 or context.scoring_hand[i]:get_id()==12 or context.scoring_hand[i]:get_id()==13 then broadway_check=true end 
                        end
                        table.sort(rank_table, function(a,b) return a>b end)
                        local highest_rank=rank_table[1]
                        if highest_rank==14 and not broadway_check then
                            highest_rank=rank_table[2]
                        end
                        sendDebugMessage("Highest rank "..highest_rank)

                        sendDebugMessage("previoous rank "..self.ability.extra.hand)
                        if (highest_rank> self.ability.extra.hand) then
                            self.ability.extra.mult = self.ability.extra.mult + self.ability.extra.mult_gain
                            sendDebugMessage("update")
                            self.ability.extra.hand=highest_rank
                            return {
                                message = localize('k_upgrade_ex'),
                                colour = G.C.MULT,
                                card = self
                            }
                        end
                    
                    elseif self.ability.name == "Mahjong Joker" and next(context.poker_hands["Three of a Kind"]) then
                        --check the counter
                        self.ability.extra.counter=self.ability.extra.counter+1
                        if (self.ability.extra.counter == self.ability.extra.frequency) then
                            self.ability.extra.counter=0
                            self.ability.x_mult=self.ability.x_mult+self.ability.extra.xmult_gain
                            G.E_MANAGER:add_event(Event({
                                func = function() card_eval_status_text(self, 'extra', nil, nil, nil, {message = localize{type='variable',key='a_xmult',vars={self.ability.x_mult}}}); return true
                                end}))
                            return 
                        end


                    elseif self.ability.name == 'Pimp The Bus' and not context.blueprint then
                            local enhanced = false
                            for i = 1, #context.scoring_hand do
                                if context.scoring_hand[i].config.center ~= G.P_CENTERS.c_base then enhanced=true end
                                if context.scoring_hand[i].edition then enhanced=true end
                                if context.scoring_hand[i].seal then enhanced=true end
                            end
                            if not enhanced then
                                local last_mult = self.ability.x_mult
                                self.ability.x_mult = 1
                                if last_mult > 1 then 
                                    return {
                                        card = self,
                                        message = localize('k_reset')
                                    }
                                end
                            else
                                self.ability.x_mult = self.ability.x_mult + self.ability.extra.x_mult_gain
                            end
                    end

                elseif context.after then
                    if self.ability.name == 'Mathurine' and not self.ability.extra.already_moved then --mathurine moves at the end of round, only once to prevent infinite moving loop
                            self.ability.extra.already_moved=true
                            G.E_MANAGER:add_event(Event({ func = function()
                                for i = 1, #G.jokers.cards do
                                    G.jokers.cards[i].pinned=false
                                end
                                local mathurine_pos
                                for i = 1, #G.jokers.cards do
                                    if G.jokers.cards[i].ability.name == 'Mathurine' then mathurine_pos=i end
                                end
                                if mathurine_pos <#G.jokers.cards then
                                    G.jokers.cards[mathurine_pos], G.jokers.cards[mathurine_pos+1] = G.jokers.cards[mathurine_pos+1], G.jokers.cards[mathurine_pos]
                                else
                                    G.jokers.cards[mathurine_pos], G.jokers.cards[1] = G.jokers.cards[1], G.jokers.cards[mathurine_pos]
                                end

                                play_sound('cardSlide1', 0.85)

                                for i = #G.jokers.cards,1,-1  do
                                    G.jokers.cards[i].pinned=true
                                end    
                                return true 
                            end })) 

                    end



                else
                    if context.cardarea == G.jokers then
                        if self.ability.name == 'Tiger Bikini' then
                            --Check the number of hearts in the deck
                            local heart_number=0
                            for k, v in pairs(G.playing_cards) do
                                if v:is_suit('Hearts') then heart_number = heart_number+1 end
                            end
                            sendDebugMessage(heart_number)
                            sendDebugMessage(self.ability.extra.threshold)
                            if (heart_number > self.ability.extra.threshold) then
                                return {
                                    message = localize{type='variable',key='a_mult',vars={self.ability.extra.mult*(heart_number - self.ability.extra.threshold)}},
                                    mult_mod = self.ability.extra.mult*(heart_number - self.ability.extra.threshold),
                                    colour = G.C.MULT
                                }
                            end
                        elseif  self.ability.name == 'Konbini' then 
                            local tarots_used = 0
                            for k, v in pairs(G.GAME.consumeable_usage) do
                                if v.set == 'Tarot' then tarots_used = tarots_used + 1 end
                            end
                            if tarots_used == 0 then return end
                            return {
                                message = localize{type='variable',key='a_mult',vars={self.ability.extra.mult*tarots_used}},
                                mult_mod = self.ability.extra.mult*tarots_used, 
                                colour = G.C.MULT
                            }
                        elseif self.ability.name == 'Sliding Joker' then
                            return {
                                message = localize{type='variable',key='sliding_joker',vars={self.ability.extra.mult,self.ability.extra.chips}},
                                mult_mod = self.ability.extra.mult,
                                chip_mod = self.ability.extra.chips,
                                colour = G.C.MULT
                            }
                        elseif self.ability.name == 'Café Gourmand' then
                            if (G.GAME.hands[context.scoring_name].played<(self.ability.extra.n+1)) then
                                return {
                                    message = localize{type='variable',key='a_chips',vars={self.ability.extra.chips}},
                                    chip_mod = self.ability.extra.chips, 
                                    colour = G.C.CHIPS
                                }
                            else
                                -- Nope !
                                return
                            end
                        elseif self.ability.name == 'Subway Map' then
                            return {
                                message = localize{type='variable',key='a_mult',vars={self.ability.extra.mult}},
                                mult_mod = self.ability.extra.mult,
                                colour = G.C.MULT
                            }
                        elseif self.ability.name == 'Voodoo Doll' then
                            local common_ranks={}
                            if G.GAME.current_round.hands_played == 0 then --first hand: scoring is not possible
                                --reset the round rank array
                                self.ability.extra.hand_array={}
                            else --scoring is possible
                                --Check if played cards are in the rank array
                                for i = 1, #context.scoring_hand do
                                    rank=context.scoring_hand[i]:get_id()
                                    --loop on ranks played in previous hands
                                    for j = 1, #self.ability.extra.hand_array do
                                        if self.ability.extra.hand_array[j] == rank then
                                            -- before adding the rank to the list of shared ranks, check if this is a duplicate 
                                            local duplicate_flag=false
                                            for k=1, #common_ranks do
                                                if common_ranks[k]==rank then duplicate_flag=true end
                                            end
                                            if not duplicate_flag then 
                                                table.insert(common_ranks,rank) 
                                            end
                                        end
                                    end
                                end
                            end
                            
                            -- Then, add played cards to this round rank array
                            for i = 1, #context.scoring_hand do
                                rank=context.scoring_hand[i]:get_id()
                                --check for duplicates already in the array
                                local duplicate_flag=false
                                for k=1, #self.ability.extra.hand_array do
                                    if self.ability.extra.hand_array[k]==rank then duplicate_flag=true end
                                end
                                if not duplicate_flag then 
                                    table.insert(self.ability.extra.hand_array, rank)
                                end
                            end

                            -- Update the string self.ability.extra.hand to indicate what ranks were played
                            --first sort the ranks
                            table.sort(self.ability.extra.hand_array)
                            --then convert to string
                            self.ability.extra.hand=""
                            for i = 1, #self.ability.extra.hand_array do
                                if i>1 then self.ability.extra.hand=self.ability.extra.hand .. "-" end
                                if (self.ability.extra.hand_array[i]<11) then
                                    self.ability.extra.hand=self.ability.extra.hand .. tostring(self.ability.extra.hand_array[i])
                                elseif (self.ability.extra.hand_array[i]==11) then
                                    self.ability.extra.hand=self.ability.extra.hand .. "J"
                                elseif (self.ability.extra.hand_array[i]==12) then
                                    self.ability.extra.hand=self.ability.extra.hand .. "Q"
                                elseif (self.ability.extra.hand_array[i]==13) then
                                    self.ability.extra.hand=self.ability.extra.hand .. "K"
                                elseif (self.ability.extra.hand_array[i]==14) then
                                    self.ability.extra.hand=self.ability.extra.hand .. "A"
                                end

                            end

                            --Finally, send the score using the number of ranks in common_ranks
                            return {
                                    message = localize{type='variable',key='a_xmult',vars={1+(#common_ranks * self.ability.extra.x_mult_gain)}},
                                    Xmult_mod = 1+(#common_ranks * self.ability.extra.x_mult_gain)
                            }

                        elseif self.ability.name == 'Cherry' then
                            return {
                                message = localize{type='variable',key='a_mult',vars={self.ability.extra.pairs_discarded*self.ability.extra.mult_gain}},
                                mult_mod = self.ability.extra.pairs_discarded*self.ability.extra.mult_gain, 
                                colour = G.C.MULT
                            }
                        elseif self.ability.name == 'Grand Slam' then
                            if G.GAME.current_round.hands_played == 0 then --first hand: reset
                                self.ability.extra.n_played_suits=0
                                self.ability.extra.played_suits={}
                            end

                            if next(context.poker_hands["Flush"]) then
                                --Get the flush suit
                                local suit
                                if context.scoring_hand[1]:is_suit('Hearts') then suit="Hearts" end
                                if context.scoring_hand[1]:is_suit('Spades') then suit="Spades" end
                                if context.scoring_hand[1]:is_suit('Clubs') then suit="Clubs" end
                                if context.scoring_hand[1]:is_suit('Diamonds') then suit="Diamonds" end
                                --check if suit is in the list
                                is_here=false
                                for k =1, #self.ability.extra.played_suits do
                                    if suit == self.ability.extra.played_suits[k] then
                                        is_here=true
                                    end
                                end
                                -- if it's not there, add the suit to the list
                                if not is_here then 
                                    table.insert(self.ability.extra.played_suits, suit)
                                    self.ability.extra.n_played_suits=self.ability.extra.n_played_suits+1
                                end
                            end
                            
                            -- compute score using the number of suits in the list
                            return {
                                message = localize{type='variable',key='a_xmult',vars={math.max(1+self.ability.extra.n_played_suits*self.ability.extra.xmult_gain,1)}},
                                Xmult_mod = math.max(1+self.ability.extra.n_played_suits*self.ability.extra.xmult_gain,1)
                            }

                        elseif self.ability.name== "Pimp The Bus" and self.ability.x_mult > 0 then
                                return {
                                    message = localize{type='variable',key='a_xmult',vars={self.ability.x_mult}},
                                    Xmult_mod = self.ability.x_mult
                                }
                        elseif self.ability.name == 'Trick or Treat' and G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.spectral > 0 then
                                    return {
                                        message = localize{type='variable',key='a_xmult',vars={math.max(1,self.ability.x_mult+G.GAME.consumeable_usage_total.spectral*self.ability.extra.x_mult_gain)}},
                                        Xmult_mod = math.max(1,self.ability.x_mult+G.GAME.consumeable_usage_total.spectral*self.ability.extra.x_mult_gain)
                                    }
                        elseif self.ability.name == 'Matryoshka' then
                            if G.GAME.current_round.hands_played == 0 then --first hand: reset
                                self.ability.extra.size_list={}
                            end
                            --get hand size
                            local duplicate_flag=false
                            for k =1, #self.ability.extra.size_list do
                                if #context.scoring_hand == self.ability.extra.size_list[k] then
                                    duplicate_flag=true
                                end
                            end
                            if not duplicate_flag then
                                table.insert(self.ability.extra.size_list, #context.scoring_hand )
                            end
                            -- compute score using the number of elements in the list
                            return {
                                message = localize{type='variable',key='a_chips',vars={#self.ability.extra.size_list*self.ability.extra.chips}},
                                chip_mod = #self.ability.extra.size_list*self.ability.extra.chips
                            }


                        end
                    end
                end
            end
        end
    end

    return calc_ref
end


local calculate_dollar_bonusref = Card.calculate_dollar_bonus
function Card:calculate_dollar_bonus()
    local calc_ref = calculate_dollar_bonusref(self)
    if self.debuff then return end
    if self.ability.set == "Joker" then
        if self.ability.name == 'Pampa' then
            return self.ability.extra.money
        elseif self.ability.name== "Mixtape" then
            -- compute the number of enhanced clubs in deck
            local n_clubs=0
            for k, v in pairs(G.playing_cards) do
                if v:is_suit('Clubs') and v.config.center ~= G.P_CENTERS.c_base then n_clubs = n_clubs+1 end
            end
            return n_clubs*self.ability.extra.money_gain
        end
    end
    return calc_ref
end





local remove_from_deckref = Card.remove_from_deck
function Card:remove_from_deck(from_debuff)
    sendDebugMessage("remove from deck")
    local rem_ref = remove_from_deckref(self, from_debuff)
    if self.ability.name== "Fabric Design" then
        if self.ability.extra.added_to_deck then --dirty workaround because self.added_to_deck doesn't work ??
            --turn cards to normal
            if (G.playing_cards) then
                for i=1, #G.playing_cards do
                    local card = G.playing_cards[i]
                    card:set_ability(G.P_CENTERS.c_base, nil, true)
                end  
            end
        end
    end
    if self.added_to_deck then
        sendDebugMessage("self added to deck")
        self.added_to_deck = false
            -- 

        if self.ability.h_size ~= 0 then
            G.hand:change_size(-self.ability.h_size)
        end
        if self.ability.d_size > 0 then
            G.GAME.round_resets.discards = G.GAME.round_resets.discards - self.ability.d_size
            ease_discard(-self.ability.d_size)
        end
        if self.ability.name == 'Credit Card' then
            G.GAME.bankrupt_at = G.GAME.bankrupt_at + self.ability.extra
        end
        if self.ability.name == 'Chaos the Clown' then
            G.GAME.current_round.free_rerolls = G.GAME.current_round.free_rerolls - 1
            calculate_reroll_cost(true)
        end
        if self.ability.name == 'Turtle Bean' then
            G.hand:change_size(-self.ability.extra.h_size)
        end
        if self.ability.name == 'Oops! All 6s' then
            for k, v in pairs(G.GAME.probabilities) do 
                G.GAME.probabilities[k] = v/2
            end
        end
        if self.ability.name == 'To the Moon' then
            G.GAME.interest_amount = G.GAME.interest_amount - self.ability.extra
        end
        if self.ability.name == 'Astronomer' then 
            G.E_MANAGER:add_event(Event({func = function()
                for k, v in pairs(G.I.CARD) do
                    if v.set_cost then v:set_cost() end
                end
                return true end }))
        end

        if self.ability.name == 'Troubadour' then
            G.hand:change_size(-self.ability.extra.h_size)
            G.GAME.round_resets.hands = G.GAME.round_resets.hands - self.ability.extra.h_plays
        end
        if self.ability.name == 'Stuntman' then
            G.hand:change_size(self.ability.extra.h_size)
        end
        if self.edition and self.edition.negative and not from_debuff and G.jokers then
            if self.ability.consumeable then
                G.consumeables.config.card_limit = G.consumeables.config.card_limit - 1
            else
                G.jokers.config.card_limit = G.jokers.config.card_limit - 1
            end 
        end
        if G.GAME.blind then G.E_MANAGER:add_event(Event({ func = function() G.GAME.blind:set_blind(nil, true, nil); return true end })) end
    end

    return rem_ref
end



   

-- handle joker description display
local generate_UIBox_ability_tableref = Card.generate_UIBox_ability_table
function Card.generate_UIBox_ability_table(self)
    local card_type, hide_desc = self.ability.set or "None", nil
    local loc_vars = nil
    local main_start, main_end = nil, nil
    local no_badge = nil

    if self.config.center.unlocked == false and not self.bypass_lock then -- For everyting that is locked
    elseif card_type == 'Undiscovered' and not self.bypass_discovery_ui then -- Any Joker or tarot/planet/voucher that is not yet discovered
    elseif self.debuff then
    elseif card_type == 'Default' or card_type == 'Enhanced' then
    elseif self.ability.set == 'Joker' then
        local customJoker = false
        if self.ability.name == 'Tiger Bikini' then
            --Check the number of hearts in the deck
            local heart_number=0
            if (G.playing_cards) then
                for k, v in pairs(G.playing_cards) do
                    if v:is_suit('Hearts') then heart_number = heart_number+1 end
                end
                loc_vars = {self.ability.extra.mult, self.ability.extra.threshold, math.max(0,self.ability.extra.mult*(heart_number-self.ability.extra.threshold))}
            else
                loc_vars = {self.ability.extra.mult, self.ability.extra.threshold, 0}

            end
            customJoker= true
        elseif self.ability.name=="Mixtape" then
            -- compute the number of enhanced clubs in deck
            local n_clubs=0
            if (G.playing_cards) then
                for k, v in pairs(G.playing_cards) do
                    if v:is_suit('Clubs') and v.config.center ~= G.P_CENTERS.c_base then n_clubs = n_clubs+1 end
                end
                loc_vars = {self.ability.extra.money_gain, self.ability.extra.money_gain*n_clubs}
            else
                loc_vars = {self.ability.extra.money_gain, 0}
            end
            customJoker = true
        elseif self.ability.name=="Pampa" then
            loc_vars = {self.ability.extra.money, ''..(G.GAME and G.GAME.probabilities.normal or 1), self.ability.extra.odds}
            customJoker = true            
        elseif self.ability.name=="Flamingo" then
            loc_vars = {''..(G.GAME and G.GAME.probabilities.normal or 1), self.ability.extra.odds}
            customJoker = true       
        elseif self.ability.name == 'Cherry' then
            loc_vars = {self.ability.extra.mult_gain, self.ability.extra.pairs_discarded*self.ability.extra.mult_gain, self.ability.extra.hands_limit-self.ability.extra.pairs_discarded}
            customJoker = true
        elseif self.ability.name == 'Subway Map' then
            if self.ability.extra.hand== 14 then loc_vars = {self.ability.extra.mult_gain, self.ability.extra.mult, "A"} 
            elseif self.ability.extra.hand== 11 then loc_vars = {self.ability.extra.mult_gain, self.ability.extra.mult, "J"} 
            elseif self.ability.extra.hand== 12 then loc_vars = {self.ability.extra.mult_gain, self.ability.extra.mult, "Q"} 
            elseif self.ability.extra.hand== 13 then loc_vars = {self.ability.extra.mult_gain, self.ability.extra.mult, "K"} 
            else loc_vars = {self.ability.extra.mult_gain, self.ability.extra.mult, self.ability.extra.hand} end
            customJoker = true
        elseif self.ability.name == 'Sliding Joker' then
            loc_vars = {self.ability.extra.mult_gain, self.ability.extra.chip_gain, self.ability.extra.mult, self.ability.extra.chips}
            customJoker = true
        elseif self.ability.name == 'Moon Rabbit' then
            loc_vars = {''..(G.GAME and G.GAME.probabilities.normal or 1), self.ability.extra.odds}
            customJoker = true
        elseif self.ability.name == 'Claw' then
            loc_vars = {self.ability.extra.chip_gain}
            customJoker = true
        elseif self.ability.name == 'Mahjong Joker' then
            loc_vars = {self.ability.extra.xmult_gain,self.ability.extra.frequency,self.ability.extra.counter,self.ability.x_mult }
            customJoker = true
        elseif self.ability.name == 'Mixtape' then
            loc_vars = {self.ability.extra.money_gain,self.ability.extra.money }
            customJoker = true
        elseif self.ability.name == 'Konbini' then
            if G.GAME.consumeable_usage then
                local tarots_used = 0
                for k, v in pairs(G.GAME.consumeable_usage) do
                    if v.set == 'Tarot' then tarots_used = tarots_used + 1 end
                end
                loc_vars = {self.ability.extra.mult, self.ability.extra.mult*tarots_used}
            else
                loc_vars = {self.ability.extra.mult, 0}
            end
            customJoker = true
        elseif self.ability.name == 'Voodoo Doll' then
            loc_vars = {self.ability.extra.x_mult_gain,self.ability.extra.hand}
            customJoker = true
        elseif self.ability.name == 'Café Gourmand' then
            loc_vars = {self.ability.extra.chips,self.ability.extra.n}
            customJoker = true
        elseif self.ability.name == 'Grand Slam' then
            -- Get the string
            local suit_string=""
            if (self.ability.extra.played_suits) then
                for i=1, #self.ability.extra.played_suits do
                    suit_string=suit_string .. self.ability.extra.played_suits[i] .. " "
                end
            end
            loc_vars = {self.ability.extra.xmult_gain,math.max(1+self.ability.extra.n_played_suits*self.ability.extra.xmult_gain,1),suit_string}
            customJoker = true
        elseif self.ability.name == 'Snecko Eye' then
            loc_vars = {self.ability.h_size}
            customJoker = true
        elseif self.ability.name == '3776' then
            loc_vars = {self.ability.extra.mult}
            customJoker = true       
        elseif self.ability.name == 'Matryoshka' then
            loc_vars = {self.ability.extra.chips}
            customJoker = true      
        elseif self.ability.name == 'Pimp The Bus' then
            loc_vars = {self.ability.extra.x_mult_gain,self.ability.x_mult}
            customJoker = true
        elseif self.ability.name == 'Trick or Treat' then
             loc_vars = {self.ability.extra.x_mult_gain, (G.GAME.consumeable_usage_total and math.max(1,self.ability.x_mult+G.GAME.consumeable_usage_total.spectral*self.ability.extra.x_mult_gain) or 1)}
             customJoker = true
        end
        if customJoker then
            local badges = {}
            if (card_type ~= 'Locked' and card_type ~= 'Undiscovered' and card_type ~= 'Default') or self.debuff then
                badges.card_type = card_type
            end
            if self.ability.set == 'Joker' and self.bypass_discovery_ui and (not no_badge) then
                badges.force_rarity = true
            end
            if self.edition then
                if self.edition.type == 'negative' and self.ability.consumeable then
                    badges[#badges + 1] = 'negative_consumable'
                else
                    badges[#badges + 1] = (self.edition.type == 'holo' and 'holographic' or self.edition.type)
                end
            end
            if self.seal then
                badges[#badges + 1] = string.lower(self.seal) .. '_seal'
            end
            if self.ability.eternal then
                badges[#badges + 1] = 'eternal'
            end
            if self.pinned then
                badges[#badges + 1] = 'pinned_left'
            end

            if self.sticker then
                loc_vars = loc_vars or {};
                loc_vars.sticker = self.sticker
            end

            return generate_card_ui(self.config.center, nil, loc_vars, card_type, badges, hide_desc, main_start,
                main_end)
        end
    end

    return generate_UIBox_ability_tableref(self)
end



----------------------------------------------
------------MOD CODE END----------------------
