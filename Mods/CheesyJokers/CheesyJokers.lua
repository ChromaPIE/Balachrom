--- STEAMODDED HEADER
--- MOD_NAME: Cheesy Jokers
--- MOD_ID: CheesyJokers
--- MOD_AUTHOR: [ilikecheese]
--- MOD_DESCRIPTION: Might as well make my own joker pack since so many other people are doing it. 
--- BADGE_COLOUR: C9A926

----------------------------------------------
------------MOD CODE -------------------------

function SMODS.INIT.CheesyJokers()

    local joker_sprites = SMODS.Sprite:new('new_jokers', SMODS.findModByID("CheesyJokers").path, "sprites.png", 71, 95, "asset_atli")
    joker_sprites:register()

    local universe_sprite = SMODS.Sprite:new('cj_universe', SMODS.findModByID("CheesyJokers").path, "universe.png", 284, 95, "asset_atli")
    universe_sprite:register()
    local letters = SMODS.Sprite:new('letters', SMODS.findModByID("CheesyJokers").path, "letters.png", 71, 95, "asset_atli")
    letters:register()

    local jokers = {
        {
            name = "Title Card",
            slug = 'cj_title_card',
            desc = {
                "{X:red,C:white}X#1#{} Mult on {C:attention}first",
                "{C:attention}hand{} of round"
            },
            config = {
                extra = 2
            },
            pos = {x = 0, y = 0},
            rarity = 1,
            cost = 4,
            loc_def = function(card) return {
                card.ability.extra} end,
            blueprint_compat = true,
            eternal_compat = true
        }, 
        {
            name = "Frozen Joker",
            dispname = "冰封小丑",
            slug = 'cj_frozen',
            desc = {
                "出牌后，本牌获得{C:attention}两倍{}于",
                "所出{C:attention}牌型{}等级的{C:chips}筹码",
                "{C:inactive}（当前为{C:chips}+#1#{C:inactive}筹码）"
            },
            config = {
                extra = {
                    chips = 10,
                    chip_mod = 2
                }
            },
            pos = {x = 1, y = 0},
            rarity = 2,
            cost = 5,
            loc_def = function(card) return {
                card.ability.extra.chips} end,
            blueprint_compat = true,
            eternal_compat = true
        },
        {
            name = "Rainbow Joker",
            dispname = "彩虹小丑",
            slug = 'cj_rainbow',
            desc = {
                "每弃掉一手{C:attention}顺子{C:inactive}顺直",
                "本牌获得{X:mult,C:white} X0.25 {} 倍率",
                "{C:inactive}（当前为{X:mult,C:white} X#1# {C:inactive}倍率）"
            },
            config = {
                x_mult = 1,
                extra = 0.25
            },
            pos = {x = 2, y = 0},
            rarity = 2,
            cost = 6,
            loc_def = function(card) return {
                card.ability.x_mult, 
                card.ability.extra} end,
            blueprint_compat = true,
            eternal_compat = true
        },
        {
            name = "Treasure Map",
            dispname = "寻宝之路",
            slug = 'cj_treasure_map',
            desc = {
                "Earn {C:money}$#3#{} if played hand",
                "contains a scoring {C:attention}#1#{} and {C:attention}#2#{},",
                "ranks change every round"
            },
            config = {
                extra = 10
            },
            pos = {x = 3, y = 0},
            rarity = 1,
            cost = 6,
            loc_def = function(card) return {
                localize(G.GAME.current_round.treasure_card.rank1, 'ranks'), 
                localize(G.GAME.current_round.treasure_card.rank2, 'ranks'), 
                card.ability.extra} end,
            blueprint_compat = true,
            eternal_compat = true
        }, 
        {
            name = "Dithered Joker",
            dispname = "抖色小丑",
            slug = 'cj_dithered',
            desc = {
                "如果打出的牌",
                "{C:inactive}（包含不计分的牌）",
                "正好有{C:attention}3{}种花色",
                "{C:chips}+#1#{}筹码"
            },
            config = {
                extra = {chip_mod = 99}
            },
            pos = {x = 5, y = 0},
            rarity = 1,
            cost = 4,
            loc_def = function(card) return {
                card.ability.extra.chip_mod} end,
            blueprint_compat = true,
            eternal_compat = true
        },
        {
            name = "Businessman",
            slug = 'cj_businessman',
            desc = {
                "Earn {C:money}$#1#{} when skipping {C:attention}Blind",
                "and increase this value by {C:money}$#2#"
            },
            config = {
                extra = {dollars = 4, increase = 4}
            },
            pos = {x = 6, y = 0},
            rarity = 1,
            cost = 3,
            loc_def = function(card) return {
                card.ability.extra.dollars, 
                card.ability.extra.increase} end,
            blueprint_compat = true,
            eternal_compat = true
        }, 
        {
            name = "Corrugated Iron",
            slug = 'cj_corrugated_iron',
            desc = {
                "Earn {C:money}$#1#{} if this",
                "Joker is destroyed"
            },
            config = {
                extra = 50
            },
            pos = {x = 7, y = 0},
            rarity = 2,
            cost = 4,
            loc_def = function(card) return {
                card.ability.extra} end,
            blueprint_compat = false,
            eternal_compat = false
        }, 
        {
            name = "Piggy Bank",
            slug = 'cj_piggy_bank',
            desc = {
                "Gains sell value of",
                "all {C:attention}Jokers{} and",
                "{C:attention}Consumables{} sold"
            },
            config = {},
            pos = {x = 0, y = 1},
            rarity = 2,
            cost = 6,
            blueprint_compat = false,
            eternal_compat = true
        },
        {
            name = "Vault",
            slug = 'cj_vault',
            desc = {
                "At end of shop, set money",
                "to {C:money}$0{} and gain {C:chips}+#2#{} Chips",
                "for each dollar lost",
                "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)"
            },
            config = {
                extra = {
                    chips = 20,
                    chip_mod = 4
                }
            },
            pos = {x = 1, y = 1},
            rarity = 3,
            cost = 7,
            loc_def = function(card) return {
                card.ability.extra.chips, 
                card.ability.extra.chip_mod} end,
            blueprint_compat = true,
            eternal_compat = true
        }, 
        {
            name = "Facial Recognition",
            dispname = "人脸识别",
            slug = 'cj_facial_recognition',
            desc = {
                "所有{C:attention}人头牌",
                "同时视为{C:attention}K{}、{C:attention}Q{}和{C:attention}J"
            },
            config = {},
            pos = {x = 2, y = 1},
            rarity = 2,
            cost = 4,
            blueprint_compat = false,
            eternal_compat = true
        }, 
        {
            name = "Amoeba",
            dispname = "阿米巴原虫",
            slug = 'cj_amoeba',
            desc = {
                "{X:red,C:white}X#1#{}倍率",
                "选择{C:attention}盲注{}时{C:attention}自我复制",
                "{C:inactive}（必须有空间）"
            },
            config = {
                extra = 1.5
            },
            pos = {x = 3, y = 1},
            rarity = 3,
            cost = 9,
            loc_def = function(card) return {
                card.ability.extra} end,
            blueprint_compat = false,
            eternal_compat = false
        }, 
        {
            name = "Unfinished Joker",
            dispname = "小丑草稿",
            slug = 'cj_unfinished',
            desc = {
                "打出的牌中",
                "每有一张{C:attention}不计分",
                "{C:mult}+#1#{}倍率"
            },
            config = {
                extra = 7
            },
            pos = {x = 4, y = 1},
            rarity = 1,
            cost = 4,
            loc_def = function(card) return {
                card.ability.extra} end,
            blueprint_compat = true,
            eternal_compat = true
        }, 
        {
            name = "Coloured In",
            slug = 'cj_coloured_in',
            desc = {
                "Enhance a random card",
                "into a {C:attention}Wild{} card",
                "for each played hand"
            },
            config = {},
            pos = {x = 5, y = 1},
            rarity = 2,
            cost = 6,
            blueprint_compat = true,
            eternal_compat = true
        }, 
        {
            name = "Engraving",
            slug = 'cj_engraving',
            desc = {
                "{C:attention}Jokers{} no longer",
                "change their condition",
                "for activating"
            },
            config = {},
            pos = {x = 6, y = 1},
            rarity = 2,
            cost = 5,
            blueprint_compat = false,
            eternal_compat = true
        }, 
        {
            name = "Surrealist Face",
            dispname = "超现实主义画像",
            slug = 'cj_surrealist_face',
            desc = {
                "{C:attention}人头牌{}视为{C:attention}任何{}花色"
            },
            config = {},
            pos = {x = 7, y = 1},
            rarity = 2,
            cost = 5,
            blueprint_compat = false,
            eternal_compat = true
        }, 
        {
            name = "Sticker Sheet",
            slug = 'cj_sticker_sheet',
            desc = {
                "When {C:attention}Blind{} is selected,",
                "create a random {C:spectral}Spectral",
                "card that adds a {C:attention}Seal",
                "{C:inactive}(Must have room)"
            },
            config = {},
            pos = {x = 0, y = 2},
            rarity = 3,
            cost = 8,
            loc_def = function(card) return {
                card.ability.extra} end,
            blueprint_compat = true,
            eternal_compat = true
        }, 
        {
            name = "Hot Air Balloon",
            slug = 'cj_balloon',
            desc = {
                "When a card is {C:attention}discarded,",
                "{C:green}#1# in #2#{} chance to",
                "increase its {C:attention}rank"
            },
            config = {
                extra = {odds = 3}
            },
            pos = {x = 1, y = 2},
            rarity = 1,
            cost = 4,
            loc_def = function(card) return {
                G.GAME.probabilities.normal, 
                card.ability.extra.odds} end,
            blueprint_compat = true,
            eternal_compat = true
        },
        {
            name = "Bitflip",
            slug = 'cj_bitflip',
            desc = {
                "If played {C:attention}hand{} contains",
                "exactly two cards,",
                "swap their {C:attention}suits{} and {C:attention}ranks"
            },
            config = {},
            pos = {x = 2, y = 2},
            rarity = 1,
            cost = 6,
            blueprint_compat = false,
            eternal_compat = true
        }, 
        {
            name = "Missing Piece",
            slug = 'cj_missing_piece',
            desc = {
                "All shop Jokers",
                "are {C:green}Uncommon"
            },
            config = {},
            pos = {x = 3, y = 2},
            rarity = 3,
            cost = 9,
            blueprint_compat = false,
            eternal_compat = true
        }, 
        {
            name = "Vending Machine",
            slug = 'cj_vending_machine',
            desc = {
                "Earn {C:money}$#1#{} per {C:red}discard,",
                "Lose {C:money}$#2#{} per played {C:attention}hand"
            },
            config = {
                extra = {
                    dollars = 3,
                    dollars_lost = 4
                }
            },
            pos = {x = 4, y = 2},
            rarity = 1,
            cost = 3,
            loc_def = function(card) return {
                card.ability.extra.dollars, 
                card.ability.extra.dollars_lost} end,
            blueprint_compat = true,
            eternal_compat = true
        }, 
        {
            name = "AI Joker",
            dispname = "AI小丑",
            slug = 'cj_ai',
            desc = {
                "{s:0.8}每回合随机变换效果"
            },
            config = {},
            pos = {x = 5, y = 2},
            rarity = 1,
            cost = 4,
            blueprint_compat = false,
            eternal_compat = true
        }, 
        {
            name = "High Score",
            slug = 'cj_high_score',
            desc = {
                "Earn {C:money}$#1#{} whenever you",
                "triple the {C:attention}required",
                "{C:attention}score{} for the {C:attention}Blind"
            },
            config = {
                extra = 7
            },
            pos = {x = 6, y = 2},
            rarity = 1,
            cost = 4,
            loc_def = function(card) return {
                card.ability.extra} end,
            blueprint_compat = false,
            eternal_compat = true
        }, 
        {
            name = "Coupon",
            dispname = "优惠券",
            slug = 'cj_coupon',
            desc = {
                "扣除{C:attention}资金{}时",
                "减免{C:money}$#1#"
            },
            config = {
                extra = 2
            },
            pos = {x = 7, y = 2},
            rarity = 2,
            cost = 6,
            loc_def = function(card) return {
                card.ability.extra} end,
            blueprint_compat = false,
            eternal_compat = true
        },
        {
            name = "Extraterrestrial",
            slug = 'cj_extraterrestrial',
            desc = {
                "When a {C:planet}Planet{} card is used,",
                "{C:green}#1# in #2#{} chance to add a copy",
                "to your consumable area",
                "{C:inactive}(Must have room)"
            },
            config = {
                extra = {
                    odds = 2,
                    counter = 0
                }
            },
            pos = {x = 4, y = 0},
            rarity = 2,
            cost = 5,
            loc_def = function(card) return {
                G.GAME.probabilities.normal, 
                card.ability.extra.odds} end,
            blueprint_compat = true,
            eternal_compat = true
        },
        {
            name = "Slingshot",
            dispname = "弹弓",
            slug = 'cj_slingshot',
            desc = {
                "每次出牌，本牌获得{X:red,C:white}X#2#{}倍率",
                "仅在位于{C:attention}最右侧{}时触发",
                "触发后{C:attention}重置{}倍率",
                "{C:inactive}（当前为{X:mult,C:white}X#1#{C:inactive}倍率）"
            },
            config = {
                extra = {
                    Xmult = 1,
                    Xmult_mod = 0.5
                }
            },
            pos = {x = 0, y = 3},
            rarity = 2,
            cost = 7,
            loc_def = function(card) return {
                card.ability.extra.Xmult, 
                card.ability.extra.Xmult_mod} end,
            blueprint_compat = true,
            eternal_compat = true
        },
        {
            name = "Calculator",
            slug = 'cj_calculator',
            desc = {
                "Gives {C:money}money{} at end of round",
                "equal to {C:attention}first digit{} of",
                "final {C:attention}score{} during round"
            },
            config = {},
            pos = {x = 2, y = 3},
            rarity = 2,
            cost = 6,
            blueprint_compat = false,
            eternal_compat = true
        },
        {
            name = "Shell Filling",
            slug = 'cj_shell_filling',
            desc = {
                "Gives {C:mult}Mult{} equal to",
                "twice the square of the",
                "current {C:attention}Ante{} number",
                "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)"
            },
            config = {},
            pos = {x = 3, y = 3},
            rarity = 2,
            cost = 5,
            loc_def = function(card) return {
                2 * G.GAME.round_resets.ante * G.GAME.round_resets.ante} end,
            blueprint_compat = true,
            eternal_compat = true
        },
        {
            name = "Dollar Stencil",
            dispname = "铸币模具",
            slug = 'cj_dollar_stencil',
            desc = {
                "每有一个空的{C:attention}小丑牌{}槽位",
                "每回合结束时获得{C:money}$#1#",
                "{s:0.8}所有“模具”小丑牌均算作空位",
                "{C:inactive}（当前为{C:money}+$#2#{C:inactive}）"
            },
            config = {
                extra = {
                    dollars = 4,
                    stencils = 1
                }
            },
            pos = {x = 4, y = 3},
            rarity = 2,
            cost = 7,
            loc_def = function(card) return {
                card.ability.extra.dollars,
                card.ability.extra.stencils * card.ability.extra.dollars} end,
            blueprint_compat = true,
            eternal_compat = true
        },
        {
            name = "Package Stencil",
            dispname = "包裹模具",
            slug = 'cj_package_stencil',
            desc = {
                "每有一个空的{C:attention}小丑牌{}槽位",
                "本牌获得{C:mult}+#2#{}倍率",
                "{s:0.8}所有“模具”小丑牌均算作空位",
                "{C:inactive}（当前为{C:mult}+#1#{C:inactive}倍率）"
            },
            config = {
                extra = {
                    mult = 0,
                    mult_mod = 4,
                    stencils = 1
                }
            },
            pos = {x = 5, y = 3},
            rarity = 2,
            cost = 6,
            loc_def = function(card) return {
                card.ability.extra.mult,
                card.ability.extra.mult_mod} end,
            blueprint_compat = true,
            eternal_compat = true
        },
        {
            name = "Cheese Wedge",
            dispname = "奶酪楔",
            slug = 'cj_cheese_wedge',
            desc = {
                "选择{C:attention}盲注{}时",
                "出牌次数{C:blue}+#1#",
                "随后使该加成{C:red}-#2#"
            },
            config = {
                extra = {
                    hands = 4,
                    hands_mod = 1
                }
            },
            pos = {x = 6, y = 3},
            rarity = 2,
            cost = 6,
            loc_def = function(card) return {
                card.ability.extra.hands,
                card.ability.extra.hands_mod} end,
            blueprint_compat = true,
            eternal_compat = false
        },
        {
            name = "Macarons",
            slug = 'cj_macarons',
            desc = {
                "{C:green}#2# in #1#{} chance for played",
                "cards to give {C:money}$#4#{} when scored,",
                "chance decreases by {C:green}#3# in #1#",
                "at the end of each round"
            },
            config = {
                extra = {
                    odds_den = 11,
                    odds_num = 6,
                    odds_mod = 1,
                    dollars = 2
                }
            },
            pos = {x = 7, y = 3},
            rarity = 3,
            cost = 10,
            loc_def = function(card) return {
                card.ability.extra.odds_den,
                card.ability.extra.odds_num * G.GAME.probabilities.normal,
                card.ability.extra.odds_mod * G.GAME.probabilities.normal,
                card.ability.extra.dollars} end,
            blueprint_compat = true,
            eternal_compat = false
        },
        {
            name = "Stained Glass",
            slug = 'cj_stained_glass',
            desc = {
                "Played {C:attention}Enhanced{} cards",
                "give {X:red,C:white} X#1# {} Mult and",
                "have a {C:green}#2# in #3#{} chance",
                "to break when scored"
            },
            config = {
                extra = {
                    Xmult = 1.5,
                    odds = 4
                }
            },
            pos = {x = 0, y = 4},
            rarity = 3,
            cost = 9,
            loc_def = function(card) return {
                card.ability.extra.Xmult,
                G.GAME.probabilities.normal,
                card.ability.extra.odds} end,
            blueprint_compat = true,
            eternal_compat = true
        },
        {
            name = "Klein Bottle",
            slug = 'cj_klein_bottle',
            desc = {
                "Cards held in hand",
                "are {C:attention}also{} scored as",
                "if they were {C:attention}played"
            },
            config = {},
            pos = {x = 1, y = 4},
            rarity = 2,
            cost = 6,
            blueprint_compat = false,
            eternal_compat = true
        },
        {
            name = "Optical Illusion",
            slug = 'cj_optical_illusion',
            desc = {
                "All {C:attention}Booster Packs",
                "may contain {C:attention}Jokers"
            },
            config = {},
            pos = {x = 2, y = 4},
            rarity = 1,
            cost = 5,
            blueprint_compat = false,
            eternal_compat = true
        }
    }

    for _, v in pairs(jokers) do
        joker = SMODS.Joker:new(
            v.name, 
            v.slug, 
            v.config,
            v.pos,
            {name = v.dispname or v.name, text = v.desc},
            v.rarity,
            v.cost, 
            nil, 
            nil, 
            v.blueprint_compat, 
            v.eternal_compat, 
            nil, 
            'new_jokers',
            nil
        )
        joker.loc_def = v.loc_def
        joker:register()
    end

    G.centers_must_appear = {
        'j_cj_cheese_wedge'
    }

    set_sprites_ref = Card.set_sprites
    Card.set_sprites = function(self, _center, _front)
        set_sprites_ref(self, _center, _front)
        if _center and _center.name == 'Frozen Joker' and (_center.discovered or self.bypass_discovery_center) then 
            self.children.center.scale.y = self.children.center.scale.y * 0.85
        end
        if _center and _center.name == 'CJ The Universe' then 
            self.children.center = Sprite(self.T.x, self.T.y, self.T.w, self.T.h, G.ASSET_ATLAS['cj_universe'], {x = 0, y = 1})
            
            self.children.center.atlas.px = 284
            self.children.center.states.hover = self.states.hover
            self.children.center.states.collide.can = false
            self.children.center:set_role({major = self, role_type = 'Glued', draw_major = self})

            self.children.floating_sprite = Sprite(self.T.x, self.T.y, self.T.w, self.T.h, G.ASSET_ATLAS['cj_universe'], {x = 0, y = 0})

            self.children.floating_sprite.atlas.px = 284
            self.children.floating_sprite.role.draw_major = self
            self.children.floating_sprite.states.hover.can = false
            self.children.floating_sprite.states.click.can = false
        end 
        if _center and _center.set == 'Letter' then
            self.children.center = Sprite(self.T.x, self.T.y, self.T.w, self.T.h, G.ASSET_ATLAS['letters'], self.config.center.pos)
            self.children.center.scale.x = self.children.center.scale.x * 0.6
            self.children.center.scale.y = self.children.center.scale.y * 0.8
            
            self.children.center.states.hover = self.states.hover
            self.children.center.states.collide.can = false
            self.children.center:set_role({major = self, role_type = 'Glued', draw_major = self})
        end
    end
    set_ability_ref = Card.set_ability
    Card.set_ability = function(self, center, initial, delay_sprites)
        set_ability_ref(self, center, initial, delay_sprites)
        if center and center.name == 'Frozen Joker' and (center.discovered or self.bypass_discovery_center) then 
            self.T.h = self.T.h * 0.85
        end
        if center and center.name == 'CJ The Universe' then 
            self.T.w = self.T.w * 4
        end
        if center and center.set == 'Letter' then 
            self.T.w = self.T.w * 0.6
            self.T.h = self.T.h * 0.8
        end
    end

    card_load_ref = Card.load
    Card.load = function(self, cardTable, other_card)
        card_load_ref(self, cardTable, other_card)

        if self.config.center.name == "Frozen Joker" then 
            self.T.h = G.CARD_H * 0.85
        end
        if self.config.center.name == 'CJ The Universe' then 
            self.T.w = G.CARD_W * 4
        end
        if self.config.center.set == 'Letter' then 
            self.T.w = self.T.w * 0.6
            self.T.h = self.T.h * 0.8
        end
    end

    SMODS.Jokers.j_cj_title_card.calculate = function(self, context)
        if context.joker_main and G.GAME.current_round.hands_played == 0 then
            return {
                message = localize{type = 'variable', key = 'a_xmult', vars = {self.ability.extra}},
                Xmult_mod = self.ability.extra
            }
        end
    end

    SMODS.Jokers.j_cj_frozen.calculate = function(self, context)
        if context.cardarea == G.jokers and context.before and not context.blueprint then
            if G.GAME.hands[context.scoring_name].level > 0 then
                self.ability.extra.chips = self.ability.extra.chips + (self.ability.extra.chip_mod * G.GAME.hands[context.scoring_name].level)
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.CHIPS,
                    card = self
                }
            end
        elseif context.joker_main then
            return {
                message = localize{type = 'variable', key = 'a_chips', vars = {self.ability.extra.chips}},
                chip_mod = self.ability.extra.chips, 
                colour = G.C.CHIPS
            }
        end
    end

    SMODS.Jokers.j_cj_rainbow.calculate = function(self, context)
        if context.pre_discard and not context.blueprint then
            handname = G.FUNCS.get_poker_hand_info(G.hand.highlighted)
            if handname == 'Straight' then
                self.ability.x_mult = self.ability.x_mult + self.ability.extra
                card_eval_status_text(self, 'extra', nil, nil, nil, {
                    message = localize{type = 'variable', key = 'a_xmult', vars = {self.ability.x_mult}},
                        colour = G.C.RED,
                    card = self
                }) 
                return true
            end
        elseif context.joker_main then
            return {
                message = localize{type = 'variable', key = 'a_xmult', vars = {self.ability.x_mult}},
                Xmult_mod = self.ability.x_mult
            }
        end
    end

    SMODS.Jokers.j_cj_treasure_map.calculate = function(self, context)
        if context.before and context.cardarea == G.jokers then
            local count_rank1 = 0
            local count_rank2 = 0
            for i = 1, #context.scoring_hand do
                if context.card:get_id() == G.GAME.current_round.treasure_card.id1 then 
                    count_rank1 = count_rank1 + 1 
                elseif next(find_joker("Facial Recognition")) and 
                context.card:is_face() and (
                (G.GAME.current_round.treasure_card.id1 == 11) or 
                (G.GAME.current_round.treasure_card.id1 == 12) or 
                (G.GAME.current_round.treasure_card.id1 == 13)) then
                    count_rank1 = count_rank1 + 1 
                end

                if context.card:get_id() == G.GAME.current_round.treasure_card.id2 then 
                    count_rank2 = count_rank2 + 1 
                elseif next(find_joker("Facial Recognition")) and 
                context.card:is_face() and (
                (G.GAME.current_round.treasure_card.id2 == 11) or 
                (G.GAME.current_round.treasure_card.id2 == 12) or 
                (G.GAME.current_round.treasure_card.id2 == 13)) then
                    count_rank2 = count_rank2 + 1 
                end
            end

            local give_money = false
            if G.GAME.current_round.treasure_card.id1 == G.GAME.current_round.treasure_card.id2 then
                give_money = (count_rank1 >= 2)
            else
                give_money = (count_rank1 >= 1 and count_rank2 >= 1)
            end
                
            if give_money then
                ease_dollars(self.ability.extra)
                G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + self.ability.extra
                G.E_MANAGER:add_event(Event({func = (function() G.GAME.dollar_buffer = 0; return true end)}))
                return {
                    message = localize('$')..self.ability.extra,
                    dollars = self.ability.extra,
                    colour = G.C.MONEY
                }
            end
        end
    end

    SMODS.Jokers.j_cj_extraterrestrial.calculate = function(self, context)
        if context.using_consumeable and context.consumeable.ability.set == 'Planet' and not context.consumeable.beginning_end then
            if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                if pseudorandom('extraterrestrial') < G.GAME.probabilities.normal/self.ability.extra.odds then
                    if G.GAME.probabilities.normal >= self.ability.extra.odds and context.consumeable.from_extraterrestrial then
                        self.ability.extra.counter = self.ability.extra.counter + 1
                        if self.ability.extra.counter >= 10 then
                            ease_background_colour{new_colour = darken(G.C.GREEN, 0.4), contrast = 6}
                        else
                            ease_background_colour{contrast = 1 + self.ability.extra.counter * self.ability.extra.counter * 0.1}
                        end
                    else
                        self.ability.extra.counter = 0
                    end
                    G.E_MANAGER:add_event(Event({
                        func = function() 
                            local card = copy_card(context.consumeable)
                            if self.ability.extra.counter >= 10 then 
                                card.beginning_end = true
                                self.ability.extra.counter = 0
                            else
                                card.from_extraterrestrial = true
                            end
                            card:add_to_deck()
                            G.consumeables:emplace(card) 
                            return true
                        end}))
                    card_eval_status_text(context.blueprint_card or self, 'extra', nil, nil, nil, {message = localize('k_copied_ex')})
                end
            end
        end
    end

    SMODS.Jokers.j_cj_dithered.calculate = function(self, context)
        if context.joker_main then
            local suits = {
                ['Hearts'] = 0,
                ['Diamonds'] = 0,
                ['Spades'] = 0,
                ['Clubs'] = 0
            }
            for i = 1, #context.full_hand do
                if context.full_hand[i].ability.name ~= 'Wild Card' then
                    if context.full_hand[i]:is_suit('Hearts') and suits["Hearts"] == 0 then suits["Hearts"] = 1
                    elseif context.full_hand[i]:is_suit('Diamonds') and suits["Diamonds"] == 0  then suits["Diamonds"] = 1
                    elseif context.full_hand[i]:is_suit('Spades') and suits["Spades"] == 0  then suits["Spades"] = 1
                    elseif context.full_hand[i]:is_suit('Clubs') and suits["Clubs"] == 0  then suits["Clubs"] = 1 end
                end
            end
            for i = 1, #context.full_hand do
                if context.full_hand[i].ability.name == 'Wild Card' then
                    if context.full_hand[i]:is_suit('Hearts') and suits["Hearts"] == 0 then suits["Hearts"] = suits["Hearts"] + 1
                    elseif context.full_hand[i]:is_suit('Diamonds') and suits["Diamonds"] == 0  then suits["Diamonds"] = 1
                    elseif context.full_hand[i]:is_suit('Spades') and suits["Spades"] == 0  then suits["Spades"] = 1
                    elseif context.full_hand[i]:is_suit('Clubs') and suits["Clubs"] == 0  then suits["Clubs"] = 1 end
                end
            end
            if suits["Hearts"] + suits["Diamonds"] + suits["Spades"] + suits["Clubs"] == 3 then
                return {
                    message = localize{type='variable',key='a_chips',vars={self.ability.extra.chip_mod}},
                    chip_mod = self.ability.extra.chip_mod,
                }
            end
        end
    end

    SMODS.Jokers.j_cj_businessman.calculate = function(self, context)
        if context.skip_blind then
            reward = self.ability.extra.dollars
            if not context.blueprint then
                self.ability.extra.dollars = reward + self.ability.extra.increase
            end
            card_eval_status_text((context.blueprint_card or self), 'extra', nil, nil, nil, {
                message = localize('$')..reward,
                dollars = reward,
                colour = G.C.MONEY
            })
            ease_dollars(reward)
            G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + reward
            G.E_MANAGER:add_event(Event({func = (function() G.GAME.dollar_buffer = 0; return true end)}))
        end
    end

    SMODS.Jokers.j_cj_corrugated_iron.calculate = function(self, context)
        if context.selling_self and not context.blueprint then
            self.ability.extra = 0
        end
    end

    SMODS.Jokers.j_cj_piggy_bank.calculate = function(self, context)
        if context.selling_card and not context.blueprint then
            self.ability.extra_value = self.ability.extra_value + context.card.sell_cost
            self:set_cost()
            card_eval_status_text(self, 'extra', nil, nil, nil, {
                message = localize('k_val_up'),
                colour = G.C.MONEY
            })
        end
    end
    
    SMODS.Jokers.j_cj_vault.calculate = function(self, context)
        if context.ending_shop and not context.blueprint then
            local money = math.max(0, G.GAME.dollars)
            if G.GAME.dollars ~= 0 then
                ease_dollars(-G.GAME.dollars, true)
            end
            if money ~= 0 then
                self.ability.extra.chips = self.ability.extra.chips + self.ability.extra.chip_mod * money
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.CHIPS,
                    card = self
                }
            end
        elseif context.joker_main then
            return {
                message = localize{type = 'variable', key = 'a_chips', vars = {self.ability.extra.chips}},
                chip_mod = self.ability.extra.chips, 
                colour = G.C.CHIPS
            }
        end
    end

    SMODS.Jokers.j_cj_amoeba.calculate = function(self, context)
        if context.setting_blind and not self.getting_sliced and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
            G.GAME.joker_buffer = G.GAME.joker_buffer + 1
            G.E_MANAGER:add_event(Event({
                func = function() 
                    local card = copy_card(self, nil, nil, nil, self.edition and self.edition.negative)
                    card:add_to_deck()
                    G.jokers:emplace(card)
                    card:start_materialize()
                    G.GAME.joker_buffer = 0
                    return true
                end}))
            card_eval_status_text(self, 'extra', nil, nil, nil, {message = "Mitosis!"}) 
        elseif context.joker_main then
            return {
                message = localize{type = 'variable', key = 'a_xmult', vars = {self.ability.extra}},
                Xmult_mod = self.ability.extra
            }
        end
    end

    SMODS.Jokers.j_cj_unfinished.calculate = function(self, context)
        if context.joker_main then
            local m = self.ability.extra * (#context.full_hand - #context.scoring_hand)
            if m > 0 then
                return {
                    message = localize{type = 'variable', key = 'a_mult', vars = {m}},
                    mult_mod = m
                }
            end
        end
    end

    SMODS.Jokers.j_cj_coloured_in.calculate = function(self, context)
        if context.before and context.cardarea == G.jokers then
            local options = {}
            for k, v in ipairs(context.full_hand) do
                if v.ability.name ~= 'Wild Card' then 
                    options[#options + 1] = v
                end
            end
            if #options > 0 then
                local card = pseudorandom_element(options, pseudoseed('coloured'))
                card:set_ability(G.P_CENTERS.m_wild, nil, true)
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card:juice_up()
                        return true
                    end
                }))
                delay(1)
            end
        end
    end

    SMODS.Jokers.j_cj_sticker_sheet.calculate = function(self, context)
        if context.setting_blind and not (context.blueprint_card or self).getting_sliced then
            if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                func = (function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local options = {
                                'c_deja_vu',
                                'c_talisman',
                                'c_medium',
                                'c_trance'
                            }
                            local to_create = pseudorandom_element(options, pseudoseed('sticker'))
                            local card = create_card('Spectral', G.consumeables, nil, nil, nil, nil, to_create)
                            card:add_to_deck()
                            G.consumeables:emplace(card)
                            G.GAME.consumeable_buffer = 0
                            return true
                        end}))   
                        card_eval_status_text(context.blueprint_card or self, 'extra', nil, nil, nil, {message = localize('k_plus_spectral'), colour = G.C.SECONDARY_SET.Spectral})                       
                    return true
                end)}))
            end
        end
    end

    SMODS.Jokers.j_cj_balloon.calculate = function(self, context)
        if context.discard then
            if pseudorandom('balloon') < G.GAME.probabilities.normal / self.ability.extra.odds then
                local card = context.other_card
                local suit = string.sub(card.base.suit, 1, 1)
                local rank = card.base.id == 14 and 2 or math.min(card.base.id + 1, 14)
                if rank < 10 then rank = tostring(rank)
                elseif rank == 10 then rank = 'T'
                elseif rank == 11 then rank = 'J'
                elseif rank == 12 then rank = 'Q'
                elseif rank == 13 then rank = 'K'
                elseif rank == 14 then rank = 'A'
                end
                card:set_base(G.P_CARDS[suit .. '_' .. rank])
                card:juice_up(0.3, 0.3)
                return {
                    message = "Rank Up!",
                    card = self
                }
            end
        end
    end

    SMODS.Jokers.j_cj_bitflip.calculate = function(self, context)
        if context.before and context.cardarea == G.jokers and #context.full_hand == 2 then
            G.E_MANAGER:add_event(Event({
                func = function()
                    local card1 = context.full_hand[1]
                    local card2 = context.full_hand[2]
                    card2_copy = {}
                    for k, v in pairs(card2.config.card) do 
                        card2_copy[k] = v
                    end
                    card2:set_base(card1.config.card)
                    card1:set_base(card2_copy)
                    card1:juice_up(0.3, 0.3)
                    card2:juice_up(0.3, 0.3)
                    return true
                end
            })) 
            return {
                message = localize('k_swapped_ex')
            }
        end
    end

    SMODS.Jokers.j_cj_vending_machine.calculate = function(self, context)
        if context.discard and context.other_card == context.full_hand[#context.full_hand] then
            G.E_MANAGER:add_event(Event({
                func = function()
                    ease_dollars(self.ability.extra.dollars)
                    card_eval_status_text(context.blueprint_card or self, 'extra', nil, nil, nil, {message = localize('$')..self.ability.extra.dollars,colour = G.C.MONEY, delay = 0.45})
                    return true
                end}))
            return
        elseif context.before and context.cardarea == G.jokers then
            ease_dollars(-self.ability.extra.dollars_lost)
            G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) - self.ability.extra.dollars_lost
            G.E_MANAGER:add_event(Event({func = (function() G.GAME.dollar_buffer = 0; return true end)}))
            return {
                message = localize('$') .. -self.ability.extra.dollars_lost,
                dollars = -self.ability.extra.dollars_lost,
                colour = G.C.RED
            }
        end
    end

    SMODS.Jokers.j_cj_ai.calculate = function(self, context)
        local conditions = {
            [1] = function(self, context)
                if context.setting_blind and not self.getting_sliced then
                    return 1
                else return 0 end
            end,
            [2] = function(self, context)
                if context.skipping_booster then
                    return 1
                else return 0 end
            end,
            [3] = function(self, context)
                if context.playing_card_added and context.cards and context.cards[1] then
                    return #context.cards
                else return 0 end
            end,
            [4] = function(self, context)
                if context.before and context.cardarea == G.jokers then
                    if context.scoring_name == G.GAME.current_round.ai_ability.condition_vars[1] then return 1 end
                end
                return 0
            end,
            [5] = function(self, context)
                if context.pre_discard then
                    if G.FUNCS.get_poker_hand_info(G.hand.highlighted) == G.GAME.current_round.ai_ability.condition_vars[1] then return 1 end
                end
                return 0
            end,
            [6] = function(self, context)
                if context.using_consumeable and context.consumeable.ability.set == 'Planet' then
                    return 1 
                else return 0 end
            end,
            [7] = function(self, context)
                if context.selling_card and context.card and context.card.sell_cost >= 3 then
                    return 1 
                else return 0 end
            end,
        }
        local reps = conditions[G.GAME.current_round.ai_ability.condition](self, context)
        if reps > 0 and not context.blueprint and not self.getting_sliced then
            effect = G.GAME.current_round.ai_ability.effect
            if effect == 1 then
                reward = reps * 3 * G.GAME.round_resets.blind_ante
                card_eval_status_text((context.blueprint_card or self), 'extra', nil, nil, nil, {
                    message = localize('$') .. reward,
                    dollars = reward,
                    colour = G.C.MONEY
                })
                ease_dollars(reward)
                G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + reward
                G.E_MANAGER:add_event(Event({func = (function() G.GAME.dollar_buffer = 0; return true end)}))
            elseif effect == 2 then
                for i = 1, reps do
                    if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                        G.E_MANAGER:add_event(Event({
                            trigger = 'before',
                            delay = 0.0,
                            func = (function()
                                    local card = create_card('Tarot', G.consumeables, nil, nil, nil, nil, nil, 'ai_tarot')
                                    card:add_to_deck()
                                    G.consumeables:emplace(card)
                                    G.GAME.consumeable_buffer = 0
                                return true
                            end)}))
                        card_eval_status_text(self, 'extra', nil, nil, nil, {message = localize('k_plus_tarot'), colour = G.C.PURPLE})
                    end
                end
            elseif effect == 3 then
                local poker_hands = {}
                for k, v in pairs(G.GAME.hands) do
                    if v.visible then poker_hands[#poker_hands + 1] = k end
                end
                for i = 1, reps * 2 do
                    local hand = pseudorandom_element(poker_hands, pseudoseed('ai_level_hand' .. i))
                    card_eval_status_text(context.blueprint_card or self, 'extra', nil, nil, nil, {message = localize('k_upgrade_ex')})
                    update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname = localize(hand, 'poker_hands'), chips = G.GAME.hands[hand].chips, mult = G.GAME.hands[hand].mult, level = G.GAME.hands[hand].level})
                    level_up_hand(context.blueprint_card or self, hand, nil, 1)
                    update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
                end
            elseif effect == 4 then
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    local jokers_to_create = math.min(reps, G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
                    G.GAME.joker_buffer = G.GAME.joker_buffer + jokers_to_create
                    for i = 1, jokers_to_create do
                        local card = create_card('Joker', G.jokers, nil, nil, nil, nil, nil, 'ai_joker')
                        card:add_to_deck()
                        G.jokers:emplace(card)
                        card:start_materialize()
                        card_eval_status_text(context.blueprint_card or self, 'extra', nil, nil, nil, {message = localize('k_plus_joker')})
                    end
                    G.GAME.joker_buffer = 0
                end
                reward = reps * 3 * G.GAME.round_resets.blind_ante
                card_eval_status_text((context.blueprint_card or self), 'extra', nil, nil, nil, {
                    message = localize('$') .. reward,
                    dollars = reward,
                    colour = G.C.MONEY
                })
                ease_dollars(reward)
                G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + reward
                G.E_MANAGER:add_event(Event({func = (function() G.GAME.dollar_buffer = 0; return true end)}))
            elseif effect == 5 then
                for i = 1, reps do
                    if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                        G.E_MANAGER:add_event(Event({
                            trigger = 'before',
                            delay = 0.0,
                            func = (function()
                                    local card = create_card('Spectral', G.consumeables, nil, nil, nil, nil, nil, 'ai_spectral')
                                    card:add_to_deck()
                                    G.consumeables:emplace(card)
                                    G.GAME.consumeable_buffer = 0
                                return true
                            end)}))
                        card_eval_status_text(self, 'extra', nil, nil, nil, {message = localize('k_plus_spectral'), colour = G.C.SECONDARY_SET.Spectral})
                    end
                end
            elseif effect == 6 then
                G.GAME.current_round.free_rerolls = G.GAME.current_round.free_rerolls + reps
                card_eval_status_text(self, 'extra', nil, nil, nil, {message = "Free Reroll!", colour = G.C.GREEN})
                calculate_reroll_cost(true)
            elseif effect == 7 then
                G.E_MANAGER:add_event(Event({
                    func = (function()
                        print(G.GAME.current_round.ai_ability.effect_vars[1])
                        add_tag(Tag(G.GAME.current_round.ai_ability.effect_vars[1]))
                        play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                        play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                        return true
                    end)
                }))
            elseif effect == 8 then
                G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                    local jimbo = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_joker')
                    jimbo:set_edition({negative = true}, true)
                    jimbo.ability.mult = 2
                    jimbo.ability.extra_value = -2
                    jimbo:set_cost()
                    jimbo:add_to_deck()
                    G.jokers:emplace(jimbo)
                    return true end }))
                delay(0.6)
            else
                text = "+" .. (reps * 15) .. " Max HP"
                card_eval_status_text(self, 'extra', nil, nil, nil, {message = text, colour = G.C.RED})
            end
        end
    end

    SMODS.Jokers.j_cj_slingshot.calculate = function(self, context)
        if context.joker_main then
            if G.jokers.cards[#G.jokers.cards] == self then
                local mult = self.ability.extra.Xmult
                if not context.blueprint then self.ability.extra.Xmult = 1 end
                return {
                    message = localize{type = 'variable', key = 'a_xmult', vars = {mult}},
                    Xmult_mod = mult
                }
            elseif not context.blueprint then
                self.ability.extra.Xmult = self.ability.extra.Xmult + self.ability.extra.Xmult_mod
                return {
                    message = "蓄力！",
                    colour = G.C.ORANGE
                }
            end
        end
    end

    SMODS.Jokers.j_cj_shell_filling.calculate = function(self, context)
        if context.joker_main then
            local mult = 2 * G.GAME.round_resets.ante * G.GAME.round_resets.ante
            return {
                message = localize{type = 'variable', key = 'a_mult', vars = {mult}},
                mult_mod = mult
            }
        end
    end

    SMODS.Jokers.j_cj_package_stencil.calculate = function(self, context)
        if context.end_of_round and not context.individual and not context.repetition and not context.blueprint then
            self.ability.extra.mult = self.ability.extra.mult + self.ability.extra.mult_mod * self.ability.extra.stencils
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.MULT,
                card = self
            }
        elseif context.joker_main and self.ability.extra.mult > 0 then
            return {
                message = localize{type = 'variable', key = 'a_mult', vars = {self.ability.extra.mult}},
                mult_mod = self.ability.extra.mult, 
                colour = G.C.MULT
            }
        end
    end

    SMODS.Jokers.j_cj_cheese_wedge.calculate = function(self, context)
        if context.setting_blind and not (context.blueprint_card or self).getting_sliced then
            G.E_MANAGER:add_event(Event({func = function()
                ease_hands_played(self.ability.extra.hands)
                card_eval_status_text(context.blueprint_card or self, 'extra', nil, nil, nil, {message = localize{type = 'variable', key = 'a_hands', vars = {self.ability.extra.hands}}})
                if not context.blueprint and self.ability.extra.hands - self.ability.extra.hands_mod <= 0 then 
                    play_sound('tarot1')
                    self.T.r = -0.2
                    self:juice_up(0.3, 0.4)
                    self.states.drag.is = true
                    self.children.center.pinch.x = true
                    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false, func = function()
                        G.jokers:remove_card(self); self:remove(); self = nil; return true
                    end}))
                elseif not context.blueprint then
                    self.ability.extra.hands = self.ability.extra.hands - self.ability.extra.hands_mod
                end
                return true 
            end }))
        end
    end

    SMODS.Jokers.j_cj_macarons.calculate = function(self, context)
        if context.individual and context.cardarea == G.play then
            if pseudorandom('macarons') < G.GAME.probabilities.normal * self.ability.extra.odds_num / self.ability.extra.odds_den then
                G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + self.ability.extra.dollars
                G.E_MANAGER:add_event(Event({func = (function() G.GAME.dollar_buffer = 0; return true end)}))
                return {
                    dollars = self.ability.extra.dollars,
                    card = self
                }
            end
        end
        if context.end_of_round and not context.individual and not context.repetition and not context.blueprint then
            if self.ability.extra.odds_num - self.ability.extra.odds_mod <= 0 then 
                G.E_MANAGER:add_event(Event({func = function()
                    play_sound('tarot1')
                    self.T.r = -0.2
                    self:juice_up(0.3, 0.4)
                    self.states.drag.is = true
                    self.children.center.pinch.x = true
                    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false, func = function()
                        G.jokers:remove_card(self)
                        self:remove()
                        self = nil
                        return true
                    end })) 
                    return true
                end })) 
            return {
                message = localize('k_eaten_ex'),
                colour = G.C.PURPLE
            }
            else
                self.ability.extra.odds_num = self.ability.extra.odds_num - self.ability.extra.odds_mod
                return {
                    message = localize{type = 'variable', key = 'a_chips_minus', vars = {self.ability.extra.odds_mod * G.GAME.probabilities.normal}},
                    colour = G.C.GREEN
                }
            end
        end
    end

    SMODS.Jokers.j_cj_stained_glass.calculate = function(self, context)
        if context.individual and context.cardarea == G.play and context.other_card.config.center ~= G.P_CENTERS.c_base then
            return {
                x_mult = self.ability.extra.Xmult,
                colour = G.C.RED,
                card = self
            }
        elseif context.destroying_card and not context.blueprint and context.destroying_card.config.center ~= G.P_CENTERS.c_base then
            if pseudorandom('stained_glass') < G.GAME.probabilities.normal/self.ability.extra.odds then
                context.destroying_card.ability.shatter_instead = true
                return true
            end
        end
    end

    calculate_joker_ref = Card.calculate_joker
    Card.calculate_joker = function(self, context)
        local new_context = {}
        for k, v in pairs(context) do
            if k == scoring_hand then
                new_context.scoring_hand = {}
                for kk, vv in ipairs(context.scoring_hand) do
                    if not vv.klein_bottle_scoring then new_context.scoring_hand[kk] = context.scoring_hand[kk] end
                end
            else
                new_context[k] = context[k]
            end
        end
        context = new_context

        if self.ability.set ~= 'Joker' and self.ability.set ~= 'Cine' or self.debuff then return end
        if next(find_joker("Facial Recognition")) then
            if context.individual and context.cardarea == G.hand and not context.end_of_round then
                if self.ability.name == 'Shoot the Moon' and context.other_card:is_face() then
                    if context.other_card.debuff then
                        return {
                            message = localize('k_debuffed'),
                            colour = G.C.RED,
                            card = self,
                        }
                    else
                        return {
                            h_mult = 13,
                            card = self
                        }
                    end
                end
                if self.ability.name == 'Baron' and context.other_card:is_face() then
                    if context.other_card.debuff then
                        return {
                            message = localize('k_debuffed'),
                            colour = G.C.RED,
                            card = self,
                        }
                    else
                        return {
                            x_mult = self.ability.extra,
                            card = self
                        }
                    end
                end
            elseif context.individual and context.cardarea == G.play and not context.end_of_round then
                if self.ability.name == 'The Idol' and context.other_card:is_suit(G.GAME.current_round.idol_card.suit) then
                    if context.other_card:is_face() and (
                    (G.GAME.current_round.idol_card.id == 11) or 
                    (G.GAME.current_round.idol_card.id == 12) or 
                    (G.GAME.current_round.idol_card.id == 13)) then
                        return {
                            x_mult = self.ability.extra,
                            colour = G.C.RED,
                            card = self
                        }
                    end
                end
                if self.ability.name == 'Triboulet' and context.other_card:is_face() then
                    return {
                        x_mult = self.ability.extra,
                        colour = G.C.RED,
                        card = self
                    }
                end
            elseif context.discard then
                if self.ability.name == 'Mail-In Rebate' and not context.other_card.debuff then
                    if context.other_card:is_face() and (
                    (G.GAME.current_round.mail_card.id == 11) or 
                    (G.GAME.current_round.mail_card.id == 12) or 
                    (G.GAME.current_round.mail_card.id == 13)) then
                        ease_dollars(self.ability.extra)
                        return {
                            message = localize('$')..self.ability.extra,
                            colour = G.C.MONEY,
                            card = self
                        }
                    end
                end
                if self.ability.name == 'Hit the Road' and not context.other_card.debuff and context.other_card:is_face() and not context.blueprint then
                    self.ability.x_mult = self.ability.x_mult + self.ability.extra
                    return {
                        message = localize{type='variable',key='a_xmult',vars={self.ability.x_mult}},
                            colour = G.C.RED,
                            delay = 0.45, 
                        card = self
                    }
                end
            end
        end
        if self.ability.name == 'To Do List' then
            if next(find_joker("Engraving")) and context.end_of_round then return end
        end
        return calculate_joker_ref(self, context)
    end

    init_game_object_ref = Game.init_game_object
    Game.init_game_object = function()
        rv = init_game_object_ref()
        rv.current_round.treasure_card = {rank1 = '2', rank2 = '3'}
        rv.current_round.ai_ability = {
            condition = 1, 
            effect = 1,
            condition_vars = {
                'Straight'
            },
            effect_vars = {

            }
        }
        return rv
    end

    reset_mail_rank_ref = reset_mail_rank
    function reset_mail_rank()
        if next(find_joker("Engraving")) then return end
        reset_mail_rank_ref()

        local valid_treasure_cards = {}
        for k, v in ipairs(G.playing_cards) do
            if v.ability.effect ~= 'Stone Card' then
                valid_treasure_cards[#valid_treasure_cards+1] = v
            end
        end

        if valid_treasure_cards[1] then 
            local card1 = pseudorandom_element(valid_treasure_cards, pseudoseed('treasure_map_1'..G.GAME.round_resets.ante))
            G.GAME.current_round.treasure_card.rank1 = card1.base.value
            G.GAME.current_round.treasure_card.id1 = card1.base.id

            local card2 = pseudorandom_element(valid_treasure_cards, pseudoseed('treasure_map_2'..G.GAME.round_resets.ante))
            G.GAME.current_round.treasure_card.rank2 = card2.base.value
            G.GAME.current_round.treasure_card.id2 = card2.base.id
        end

        G.GAME.current_round.ai_ability.condition = math.ceil(pseudorandom('ai_condition'..G.GAME.round_resets.ante) * 7)
        G.GAME.current_round.ai_ability.effect = math.ceil(pseudorandom('ai_effect'..G.GAME.round_resets.ante) * 8.1)

        G.GAME.current_round.ai_ability.condition_vars[1] = pseudorandom_element({'Flush', 'Straight', 'Full House'}, pseudoseed('ai_hand'..G.GAME.round_resets.ante))
        local random_tag = pseudorandom_element({
            'tag_uncommon', 
            'tag_foil',
            'tag_holo',
            'tag_voucher',
            'tag_boss',
            'tag_double',
            'tag_juggle',
            'tag_top_up'
        }, pseudoseed('ai_tag'..G.GAME.round_resets.ante))
        G.GAME.current_round.ai_ability.effect_vars[1] = random_tag
        G.GAME.current_round.ai_ability.effect_vars[2] = localize{type = 'name_text', set = 'Tag', key = random_tag, nodes = {}}
    end

    reset_ancient_card_ref = reset_ancient_card
    function reset_ancient_card()
        if next(find_joker("Engraving")) then return end
        reset_ancient_card_ref()
    end

    reset_idol_card_ref = reset_idol_card
    function reset_idol_card()
        if next(find_joker("Engraving")) then return end
        reset_idol_card_ref()
    end

    reset_castle_card_ref = reset_castle_card
    function reset_castle_card()
        if next(find_joker("Engraving")) then return end
        reset_castle_card_ref()
    end

    is_suit_ref = Card.is_suit
    Card.is_suit = function(self, suit, bypass_debuff, flush_calc)
        if self:is_face() and next(find_joker("Surrealist Face")) then
            return true
        else
            return is_suit_ref(self, suit, bypass_debuff, flush_calc)
        end
    end

    start_dissolve_ref = Card.start_dissolve
    Card.start_dissolve = function(self, dissolve_colours, silent, dissolve_time_fac, no_juice)
        if self.ability and self.ability.shatter_instead then
            self:shatter()
            return
        end
        if self.ability and self.ability.name == 'Corrugated Iron' and self.ability.extra > 0 then
            card_eval_status_text(self, 'extra', nil, nil, nil, {
                message = localize('$')..self.ability.extra,
                dollars = self.ability.extra,
                colour = G.C.MONEY
            })
            ease_dollars(self.ability.extra)
            G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + self.ability.extra
            G.E_MANAGER:add_event(Event({func = (function() G.GAME.dollar_buffer = 0; return true end)}))
            delay(0.3)
        end
        start_dissolve_ref(self, dissolve_colours, silent, dissolve_time_fac, no_juice)
    end

    evaluate_play_ref = G.FUNCS.evaluate_play
    G.FUNCS.evaluate_play = function(e)
        local function edit_scoring_hand(event, line)
            if line == 603 and debug.getinfo(2, 'S').short_src == 'functions/state_events.lua' then
                local n, v = debug.getlocal(2, 5)
                for i = 1, #G.hand.cards do
                    v[#v + 1] = G.hand.cards[i]
                    v[#v].klein_bottle_scoring = true
                end
                debug.setlocal(2, 5, v)
            elseif line == 778 and debug.getinfo(2, 'S').short_src == 'functions/state_events.lua' then
                local n, old_scoring_hand = debug.getlocal(2, 5)
                local new_scoring_hand = {}
                for k, v in ipairs(old_scoring_hand) do
                    if not v.klein_bottle_scoring then new_scoring_hand[#new_scoring_hand + 1] = v end
                end
                debug.setlocal(2, 5, new_scoring_hand)
            end
        end
        if next(find_joker('Klein Bottle')) then debug.sethook(edit_scoring_hand, "l") end
        return evaluate_play_ref(e)
    end

    draw_card_ref = Card.draw
    Card.draw = function(self, layer)
        if self.ability and self.ability.name == "CJ The Universe" then
            self.ambient_tilt = 0
        elseif self.ability and self.ability.set == 'Letter' then
            self.ambient_tilt = 2
        end

        draw_card_ref(self, layer)

        if layer ~= 'shadow' and self.sprite_facing == 'front' and self.ability then
            if self.ability.name == 'Sticker Sheet' and (self.config.center.discovered or self.bypass_discovery_center) then
                self.children.center:draw_shader('voucher', nil, self.ARGS.send_to_shader)
            end
        end
        if self.ability and self.ability.set == 'Letter' then
            if self.failed then 
                self.children.center:draw_shader('debuff', nil, self.ARGS.send_to_shader)
            else
                self.children.center:draw_shader('booster', nil, self.ARGS.send_to_shader)
            end
        end
        if layer ~= 'shadow' and self.beginning_end then
            self.children.center:draw_shader('dissolve', nil, nil, nil, self.children.center, nil, nil, 0.1 * math.sin(2042 * G.TIMERS.REAL), 0.1 * math.sin(1427 * G.TIMERS.REAL))
        end
        if layer ~= 'shadow' and self.ability and self.ability.name == 'CJ The Universe' then
            self.children.floating_sprite:draw_shader('dissolve', 0, nil, nil, self.children.center, nil, nil, nil, 0.1 + 0.03 * math.sin(1.8 * G.TIMERS.REAL), nil, 0.6)
            self.children.floating_sprite:draw_shader('dissolve', nil, nil, nil, self.children.center, nil, nil, nil, 0.1)
            self.children.floating_sprite:draw_shader('negative_shine', nil, self.ARGS.send_to_shader, nil, self.children.center, nil, nil, nil, 0.1)
        end
    end

    hover_ref = Card.hover
    Card.hover = function(self)
        if self.ability and self.ability.name == "CJ The Universe" then
            self.overwrite_tilt_var = copy_table(self.tilt_var)
        end
        hover_ref(self)
    end

    stop_hover_ref = Card.stop_hover
    Card.stop_hover = function(self)
        if self.ability and self.ability.name == "CJ The Universe" and self.overwrite_tilt_var then
            self.overwrite_tilt_var = nil
        end
        stop_hover_ref(self)
    end

    card_update_ref = Card.update
    Card.update = function(self, dt)
        card_update_ref(self, dt)
        if G.STAGE ~= G.STAGES.RUN then return end
        if string.find(self.ability.name, "Stencil") then
            local stencil_count = (G.jokers.config.card_limit - #G.jokers.cards)
            for i = 1, #G.jokers.cards do
                if string.find(G.jokers.cards[i].ability.name, "Stencil") then stencil_count = stencil_count + 1 end
            end
            if self.ability.name == "Joker Stencil" then 
                self.ability.x_mult = stencil_count
            elseif self.ability.extra.stencils then
                self.ability.extra.stencils = stencil_count
            end
        end
    end

    draw_cardarea_ref = CardArea.draw
    CardArea.draw = function(self)
        draw_cardarea_ref(self)

        if self.config.type == 'joker' then 
            for i = 1, #self.cards do 
                if self.cards[i] ~= G.CONTROLLER.focused.target then
                    if self.cards[i].config.center and self.cards[i].config.center.set == 'Letter' then
                        if G.CONTROLLER.dragging.target ~= self.cards[i] then 
                            self.cards[i]:draw(v) 
                        end
                    end
                end
            end
        end
    end



    get_current_pool_ref = get_current_pool
    get_current_pool = function(_type, _rarity, _legendary, _append)
        if _type == 'Joker' and _append == 'sho' and not _rarity and next(find_joker("Missing Piece")) then
            return get_current_pool_ref(_type, 0.8, _legendary, _append)
        else
            return get_current_pool_ref(_type, _rarity, _legendary, _append)
        end
    end

    create_card_ref = create_card
    create_card = function(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
        if area == G.pack_cards and next(find_joker("Optical Illusion")) and not forced_key and key_append ~= 'sta' then
            if pseudorandom('optical_illusion') < 0.2 then
                _type = 'Joker'
                key_append = 'opt'
            end
        end
        return create_card_ref(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
    end

    G.localization.descriptions.AIConditions = {
        [1] = {text = {
            "选择{C:attention}盲注{}后"
        }},
        [2] = {text = {
            "跳过{C:attention}补充包{}时"
        }},
        [3] = {text = {
            "有{C:attention}游戏牌{}加入牌组时"
        }},
        [4] = {text = {
            "打出{C:attention}#1#{}时"
        }},
        [5] = {text = {
            "弃掉{C:attention}#1#{}时"
        }},
        [6] = {text = {
            "每使用一张{C:planet}星球牌"
        }},
        [7] = {text = {
            "售出售价大于等于{C:money}$3{}的卡牌时"
        }},
    }

    G.localization.descriptions.AIEffects = {
        [1] = {text = {
            "每个{C:attention}底注{}获得{C:money}$3"
        }},
        [2] = {text = {
            "生成一张{C:tarot}塔罗牌"
        }},
        [3] = {text = {
            "提升随机两种{C:attention}牌型{}的等级"
        }},
        [4] = {text = {
            "随机生成一张{C:attention}小丑牌",
            "{C:inactive}（必须有空间）"
        }},
        [5] = {text = {
            "生成一张{C:spectral}幻灵牌"
        }},
        [6] = {text = {
            "获得{C:attention}1{}次免费{C:green}重掷"
        }},
        [7] = {text = {
            "生成一个免费的{C:attention}#2#"
        }},
        [8] = {text = {
            "生成一张给予",
            "{C:mult}+2{}倍率的{C:dark_edition}负片{C:attention}小丑"
        }},
        [9] = {text = {
            "获得{X:red,C:white} +15 {C:red} 最大生命值"
        }},
    }

    G.localization.descriptions.Other.cj_universe = {
        name = '{s:1.4,C:dark_edition} ~ {s:1.4}The Universe {s:1.4,C:dark_edition}~ ',
        text = {
            "When {C:attention}Blind{} is selected, four {C:dark_edition}Conditions{} are",
            "chosen at {C:tarot}random,{} which when {C:tarot}completed,",
            "give a specified {C:tarot}number{} of {C:chips}chips{} directly",
            "{C:tarot}against{} the current {C:attention}Blind{} requirement"
        }
    }

    init_localization()

    generate_card_ui_ref = generate_card_ui
    generate_card_ui = function(_c, full_UI_table, specific_vars, card_type, badges, hide_desc, main_start, main_end)
        if _c.name == 'AI Joker' then
            full_UI_table = {
                main = {},
                info = {},
                type = {},
                name = nil,
                badges = badges or {}
            }

            local condition_vars = G.GAME.current_round.ai_ability.condition_vars
            local effect_vars = G.GAME.current_round.ai_ability.effect_vars
            localize {type = 'descriptions', set = 'AIConditions', key = G.GAME.current_round.ai_ability.condition, nodes = full_UI_table.main, vars = condition_vars}
            localize {type = 'descriptions', set = 'AIEffects', key = G.GAME.current_round.ai_ability.effect, nodes = full_UI_table.main, vars = effect_vars}
        end
        if _c.name == 'CJ The Universe' then
            return generate_card_ui_ref(G.P_CENTERS['cj_universe'], nil, {}, 'Joker', {card_type = 'Joker', force_rarity = true})
        end
        return generate_card_ui_ref(_c, full_UI_table, specific_vars, card_type, badges, hide_desc, main_start, main_end)
    end

    local generate_UIBox_ability_table_ref = Card.generate_UIBox_ability_table
    Card.generate_UIBox_ability_table = function(self)
        if self.ability.set == 'Letter' then
            ui_table = generate_card_ui(self.config.center, nil, {}, 'Letter', {})

            localize {type = 'descriptions', set = 'Letter', key = self.config.center_key, nodes = ui_table.main, vars = {}}
            localize {type = 'descriptions', set = 'Letter', key = self.failed and 'failed' or 'reward', nodes = ui_table.main, vars = {self.reward_chips}}

            return ui_table
        elseif self.beginning_end then
            local descriptions = {
                "?? ???? ?",
                "reset your full deck()",
                "destroy ALL jokers)",
                "destroy ALL !!!!!!!",
                "jokers no longer appear...",
                "in the~ shop ",
                "-* *-*-- -*-* *",
                "set joker slots to 0?",
                "joker set slots to ?",
                "???? ?",
                "set hands p3r round to 4",
                "set discards pe* round to 4",
                "set discards pe      ( 4) ",
                "set hand s_ze to 8",
                "%%%%%%%%%%%",
                "blinds are 2X the SIZE!",
                "  Xbase BLIND size",
                "destroy THE jokerS###",
                "there is no going b()k",
                "th^^e is no *&&*& back",
                "THEREISNOGOINGBACK",
            }
            local cols = {
                G.C.BLACK,
                G.C.BLACK,
                G.C.BLACK,
                G.C.BLACK,
                G.C.SECONDARY_SET.Spectral,
                G.C.SECONDARY_SET.Spectral,
                G.C.BLACK,
                G.C.BLACK,
                G.C.PURPLE,
                G.C.PURPLE,
                G.C.PURPLE,
            }
            ui_table = generate_card_ui(G.P_CENTERS['c_jupiter'], nil, {}, '', {}, nil, main_start)
            ui_table.main = {{{n=G.UIT.O, config={object = DynaText({string = descriptions, colours = cols, pop_in_rate = 9999999, silent = true, random_element = false, pop_delay = 0.4, scale = 0.32, min_cycle_time = 0})}}}}
            ui_table.name = {{n=G.UIT.O, config={object = DynaText({string = {"The Beginning", "The End"}, colours = {G.C.WHITE}, pop_in_rate = 9999999, silent = true, random_element = true, pop_delay = 0.15, scale = 0.482, min_cycle_time = 0, shadow = true})}}}
            ui_table.badges = {card_type = '????'}
            return ui_table
        else
            return generate_UIBox_ability_table_ref(self)
        end
    end

    calculate_dollar_bonus_ref = Card.calculate_dollar_bonus
    Card.calculate_dollar_bonus = function(self)
        if self.ability.name == 'High Score' and not self.debuff then
            if G.GAME.chips >= G.GAME.blind.chips * 3 then return self.ability.extra end
        end
        if self.ability.name == 'Calculator' and not self.debuff then
            if G.GAME.chips > 0 then return tonumber(string.sub(tostring(G.GAME.chips), 1, 1)) end
        end
        if self.ability.name == 'Dollar Stencil' and not self.debuff then
            if self.ability.extra.stencils > 0 then return self.ability.extra.stencils * self.ability.extra.dollars end
        end
        return calculate_dollar_bonus_ref(self)
    end

    ease_dollars_ref = ease_dollars
    ease_dollars = function(mod, instant)
        if next(find_joker('Coupon')) and mod < 0 then
            mod = math.min(0, mod + 2 * #find_joker('Coupon'))
            for k, v in pairs(find_joker('Coupon')) do 
                v:juice_up(0.3, 0.3)
                card_eval_status_text(v, 'extra', nil, nil, nil, {message = "优惠促销！", instant = true})
            end
        end
        ease_dollars_ref(mod, instant)
    end
    
    set_ranks_ref = CardArea.set_ranks
    CardArea.set_ranks = function(self)
        set_ranks_ref(self)
        for k, card in ipairs(self.cards) do
            if card.config.center.name == 'CJ The Universe' then
                card.states.click.can = false
                card.states.drag.can = false
            end
        end
    end

    get_type_colour_ref = get_type_colour
    get_type_colour = function(_c, card)
        if _c.name == 'CJ The Universe' then 
            return G.C.RARITY[4]
        else
            return get_type_colour_ref(_c, card)
        end
    end
    
    local universe = {
        name = 'CJ The Universe',
        set = "Other",
        key = 'cj_universe',
        config = {},
        rarity = 4
    }
    G.P_CENTERS['cj_universe'] = universe

    local function calculate_letter(letter)
        if letter.failed then
            G.E_MANAGER:add_event(Event({trigger = 'before', delay = 1, func = function()
                card_eval_status_text(letter, 'extra', nil, nil, nil, {message = localize('k_debuffed'), colour = G.C.RED, instant = true})
                return true
            end
            }))
        else
            local reward_chips = letter.reward_chips
            G.E_MANAGER:add_event(Event({trigger = 'before', delay = 1, func = function()
                card_eval_status_text(letter, 'extra', nil, nil, nil, {message = "+" .. tostring(reward_chips), colour = G.C.JOKER_GREY, instant = true})
                G.GAME.chips = G.GAME.chips + reward_chips
                G.HUD:get_UIE_by_ID('chip_UI_count'):juice_up(0.2, 0.1)
                return true
            end
            }))
        end
    end

    local function check_letter_fail(letter, context)
        local name = letter.config.center.name
        if name == 'Alpha' then
            if context.pre_discard then return false end
            local n = 0
            for k, v in pairs(G.GAME.hands) do
                if v.played_this_round > 0 then n = n + 1 end
            end
            return n > 2
        elseif name == 'Beta' then
            if context.before then return false end
            return G.FUNCS.get_poker_hand_info(G.hand.highlighted) == 'High Card'
        elseif name == 'Gamma' then
            if context.before then return false end
            return #G.hand.highlighted < 5
        elseif name == 'Delta' then
            if context.pre_discard then return false end
            for k, v in pairs(context.full_hand) do
                if v:is_face() then return false end
            end
            return true
        elseif name == 'Epsilon' then
            if context.pre_discard then return false end
            return #context.full_hand > #context.scoring_hand
        elseif name == 'Zeta' then
            if context.before then return false end
            local discarded_hand = G.FUNCS.get_poker_hand_info(G.hand.highlighted)
            return G.GAME.hands[discarded_hand].played_this_round > 0
        elseif name == 'Eta' then
            if context.pre_discard or G.GAME.current_round.hands_left > 0 then return false end
            return G.GAME.hands['Straight Flush'].played_this_round < 1 and G.GAME.hands['Four of a Kind'].played_this_round < 1
        elseif name == 'Theta' then
            if context.pre_discard then return false end
            return not next(context.poker_hands['Pair'])
        elseif name == 'Iota' then
            if context.pre_discard then return false end
            local max_level = 0
            for k, v in pairs(G.GAME.hands) do
                if v.level > max_level then max_level = v.level end
            end
            return G.GAME.hands[context.scoring_name].level == max_level
        elseif name == 'Kappa' then
            if context.pre_discard then return false end
            local suits = {['Hearts'] = 0, ['Diamonds'] = 0, ['Spades'] = 0, ['Clubs'] = 0}
            for i = 1, #context.scoring_hand do
                if context.card.ability.name ~= 'Wild Card' then
                    if context.card:is_suit('Hearts') and suits["Hearts"] == 0 then suits["Hearts"] = suits["Hearts"] + 1
                    elseif context.card:is_suit('Diamonds') and suits["Diamonds"] == 0  then suits["Diamonds"] = suits["Diamonds"] + 1
                    elseif context.card:is_suit('Spades') and suits["Spades"] == 0  then suits["Spades"] = suits["Spades"] + 1
                    elseif context.card:is_suit('Clubs') and suits["Clubs"] == 0  then suits["Clubs"] = suits["Clubs"] + 1 end
                end
            end
            for i = 1, #context.scoring_hand do
                if context.card.ability.name == 'Wild Card' then
                    if context.card:is_suit('Hearts') and suits["Hearts"] == 0 then suits["Hearts"] = suits["Hearts"] + 1
                    elseif context.card:is_suit('Diamonds') and suits["Diamonds"] == 0  then suits["Diamonds"] = suits["Diamonds"] + 1
                    elseif context.card:is_suit('Spades') and suits["Spades"] == 0  then suits["Spades"] = suits["Spades"] + 1
                    elseif context.card:is_suit('Clubs') and suits["Clubs"] == 0  then suits["Clubs"] = suits["Clubs"] + 1 end
                end
            end
            return suits["Hearts"] > 0 and suits["Diamonds"] > 0 and suits["Spades"] > 0 and suits["Clubs"] > 0
        elseif name == 'Lambda' then
            if context.before and G.GAME.current_round.hands_left == 0 then return false end
            return #G.deck.cards - #context.full_hand < 30
        elseif name == 'Mu' then
            if context.pre_discard then return false end
            return G.GAME.hands[context.scoring_name].played > 9
        elseif name == 'Nu' then
            if context.pre_discard then return false end
            return G.GAME.current_round.hands_played == 0 and G.GAME.hands[context.scoring_name].played_this_round < 1
        elseif name == 'Xi' then
            return math.abs(G.GAME.current_round.hands_left - G.GAME.current_round.discards_left) > 1
        elseif name == 'Omicron' then
            if context.before then return false end
            return G.GAME.current_round.discards_left <= 2
        elseif name == 'Pi' then
            if context.pre_discard then return false end
            return G.GAME.hands[context.scoring_name].played_this_round > 1
        elseif name == 'Rho' then
            if context.before then return false end
            for _, v in pairs(G.hand.highlighted) do
                if v:get_id() == 2 then return true 
                elseif v:get_id() == 4 then return true 
                elseif v:get_id() == 8 then return true 
                elseif v:get_id() == 14 then return true 
                end
            end
            return false
        elseif name == 'Sigma' then
            if context.before then return false end
            local contains_odd, contains_even = false, false
            for _, v in pairs(G.hand.highlighted) do
                if v:get_id() == 14 then contains_odd = true
                elseif v:get_id() > 10 or v:get_id() < 1 then
                elseif v:get_id() % 2 == 1 then contains_odd = true
                elseif v:get_id() % 2 == 0 then contains_even = true
                end
                if contains_odd and contains_even then return true end
            end
            return false
        elseif name == 'Tau' then
            if context.before then return false end
            local lowest, highest = 14, 0
            for _, v in pairs(G.hand.highlighted) do
                if not v:get_id() == 14 then
                    if v:get_id() < lowest then lowest = v:get_id() end
                    if v:get_id() > highest then highest = v:get_id() end
                end
            end
            return highest - lowest > 6
        elseif name == 'Upsilon' then
            if context.pre_discard then return false end
            local max_level_played = 0
            for k, v in pairs(G.GAME.hands) do
                if v.level > max_level_played and v.played_this_round > 0 then max_level_played = v.level end
            end
            return G.GAME.hands[context.scoring_name].level < max_level_played
        elseif name == 'Phi' then
            if context.pre_discard then return false end
            for _, v in pairs(G.hand.cards) do
                if v:is_face() then return false end
            end
            return true
        elseif name == 'Chi' then
            if context.before or G.GAME.current_round.discards_left > 0 then return false end
            local max_times_played = 0
            for k, v in pairs(G.GAME.hands) do
                if v.played > max_times_played then max_times_played = v.played end
            end
            local discarded_hand = G.FUNCS.get_poker_hand_info(G.hand.highlighted)
            return G.GAME.hands[discarded_hand].played ~= max_times_played
        elseif name == 'Psi' then
            if context.pre_discard then return false end
            return next(context.poker_hands['Two Pair']) or next(context.poker_hands['Three of a Kind']) or next(context.poker_hands['Full House'])
        elseif name == 'Omega' then
            for k, v in ipairs(context.full_hand) do
                if v:get_id() == 14 then return true end
            end
            return false
        else
            return false
        end
    end

    local function fail_letter(letter)
        G.E_MANAGER:add_event(Event({trigger = 'before', delay = 1, func = function()
            card_eval_status_text(letter, 'extra', nil, nil, nil, {message = "Failed!", colour = G.C.RED, instant = true})
            letter.failed = true
            return true
        end
        }))
    end

    local function calculate_universe(self, context)
        if not G.cj_universe_area then return end
        if context.setting_blind then
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 1, func = function()
                local letters_list = {}
                for k, v in pairs(G.P_CENTERS) do
                    if v.set == 'Letter' then
                        letters_list[#letters_list + 1] = k
                    end
                end
                for i = 1, 4 do
                    local new_letter, pos = pseudorandom_element(letters_list, pseudoseed('universe_letter_choice' .. tostring(i) .. G.GAME.round_resets.ante))
                    local card = create_card('Joker', G.cj_universe_area, nil, nil, nil, nil, new_letter) 
                    card:add_to_deck()
                    G.cj_universe_area:emplace(card)
                    table.remove(letters_list, pos)

                    card.failed = false
                    card.reward_chips = math.floor(G.GAME.blind.chips * G.P_CENTERS[new_letter].reward_mult * 0.2) * 5
                end
                return true end 
            }))
        elseif context.before or context.pre_discard then
            for k, v in ipairs(G.cj_universe_area.cards) do
                if not v.failed and check_letter_fail(v, context) then fail_letter(v) end
            end 
        elseif context.after and G.GAME.current_round.hands_left == 0 then
            for k, v in ipairs(G.cj_universe_area.cards) do
                calculate_letter(v)
            end 
        elseif context.end_of_round and not context.repetition then
            for k, v in ipairs(G.cj_universe_area.cards) do
                v:start_dissolve({G.C.JOKER_GREY, G.C.GOLD, G.C.SECONDARY_SET.Spectral, G.C.GREY})
            end
        end
    end

    local letters = {
        {
            name = 'Alpha',
            key = 'cj_alpha',
            pos = {x = 0, y = 0},
            desc = {
                "Play two or fewer",
                "unique {C:attention}poker hands{}"
            },
            reward_mult = 0.4
        },
        {
            name = 'Beta',
            key = 'cj_beta',
            pos = {x = 1, y = 0},
            desc = {
                "Do {C:red}not{} discard",
                "a {C:attention}High Card"
            },
            reward_mult = 0.3
        },
        {
            name = 'Gamma',
            key = 'cj_gamma',
            pos = {x = 2, y = 0},
            desc = {
                "All discards must",
                "contain {C:attention}5{} cards"
            },
            reward_mult = 0.25
        },
        {
            name = 'Delta',
            key = 'cj_delta',
            pos = {x = 3, y = 0},
            desc = {
                "All hands must contain",
                "a scoring {C:attention}face{} card"
            },
            reward_mult = 0.3
        },
        {
            name = 'Epsilon',
            key = 'cj_epsilon',
            pos = {x = 4, y = 0},
            desc = {
                "Do {C:red}not{} play any cards",
                "that {C:attention}do not score{}"
            },
            reward_mult = 0.3
        },
        {
            name = 'Zeta',
            key = 'cj_zeta',
            pos = {x = 5, y = 0},
            desc = {
                "Do {C:red}not{} discard a hand",
                "that you have {C:attention}played{}",
                "{C:attention}previously{} this round"
            },
            reward_mult = 0.3
        },
        {
            name = 'Eta',
            key = 'cj_eta',
            pos = {x = 0, y = 1},
            desc = {
                "Play a {C:attention}Straight Flush",
                "or a {C:attention}Four of a Kind"
            },
            reward_mult = 0.5
        },
        {
            name = 'Theta',
            key = 'cj_theta',
            pos = {x = 1, y = 1},
            desc = {
                "All played {C:attention}hands{} must",
                "contain a {C:attention}Pair"
            },
            reward_mult = 0.5
        },
        {
            name = 'Iota',
            key = 'cj_iota',
            pos = {x = 2, y = 1},
            desc = {
                "Do {C:red}not{} play your",
                "{C:attention}poker hand(s){} with",
                "the highest {C:attention}level"
            },
            reward_mult = 0.3
        },
        {
            name = 'Kappa',
            key = 'cj_kappa',
            pos = {x = 3, y = 1},
            desc = {
                "Played hands must",
                "{C:red}not{} contain {C:attention}4{} suits"
            },
            reward_mult = 0.25
        },
        {
            name = 'Lambda',
            key = 'cj_lambda',
            pos = {x = 4, y = 1},
            desc = {
                "Always have at least {C:attention}30{}",
                "remaining cards in deck",
            },
            reward_mult = 0.3
        },
        {
            name = 'Mu',
            key = 'cj_mu',
            pos = {x = 5, y = 1},
            desc = {
                "Do {C:red}not{} play a {C:attention}hand type{}",
                "you have played more than",
                "{C:attention}9{} times this run"
            },
            reward_mult = 0.4
        },
        {
            name = 'Nu',
            key = 'cj_nu',
            pos = {x = 0, y = 2},
            desc = {
                "Your {C:attention}first{} and {C:attention}second{}",
                "played poker hands must",
                "be the same {C:attention}hand type"
            },
            reward_mult = 0.3
        },
        {
            name = 'Xi',
            key = 'cj_xi',
            pos = {x = 1, y = 2},
            desc = {
                "Your {C:attention}hands{} and {C:attention}discards",
                "cannot have a difference",
                "of more than {C:attention}1"
            },
            reward_mult = 0.3
        },
        {
            name = 'Omicron',
            key = 'cj_omicron',
            pos = {x = 2, y = 2},
            desc = {
                "Do {C:red}not{} use your",
                "final {C:attention}2{} discards"
            },
            reward_mult = 0.3
        },
        {
            name = 'Pi',
            key = 'cj_pi',
            pos = {x = 3, y = 2},
            desc = {
                "Do {C:red}not{} play any",
                "repeat {C:attention}poker hands"
            },
            reward_mult = 0.4
        },
        {
            name = 'Rho',
            key = 'cj_rho',
            pos = {x = 4, y = 2},
            desc = {
                "Do {C:red}not{} discard",
                "an {C:attention}Ace, 2, 4{} or {C:attention}8"
            },
            reward_mult = 0.5
        },
        {
            name = 'Sigma',
            key = 'cj_sigma',
            pos = {x = 5, y = 2},
            desc = {
                "Discards may {C:red}not{} contain",
                "both {C:attention}odd{} and {C:attention}even{} cards"
            },
            reward_mult = 0.5
        },
        {
            name = 'Tau',
            key = 'cj_tau',
            pos = {x = 0, y = 3},
            desc = {
                "The {C:attention}range{} of ranks of",
                "each discard may {C:red}not{}",
                "be greater than {C:attention}6",
                "{C:inactive}(Excludes Aces)"
            },
            reward_mult = 0.4
        },
        {
            name = 'Upsilon',
            key = 'cj_upsilon',
            pos = {x = 1, y = 3},
            desc = {
                "Do {C:red}not{} play a hand at a",
                "lower {C:attention}level{} than your",
                "previously played hand"
            },
            reward_mult = 0.4
        },
        {
            name = 'Phi',
            key = 'cj_phi',
            pos = {x = 2, y = 3},
            desc = {
                "Do {C:red}not{} play a hand without",
                "a {C:attention}Face{} card held in hand"
            },
            reward_mult = 0.4
        },
        {
            name = 'Chi',
            key = 'cj_chi',
            pos = {x = 3, y = 3},
            desc = {
                "Final discard of round must be",
                "your most played {C:attention}poker hand"
            },
            reward_mult = 0.3
        },
        {
            name = 'Psi',
            key = 'cj_psi',
            pos = {x = 4, y = 3},
            desc = {
                "Played hands may {C:red}not{} contain",
                "a {C:attention}Two Pair{} nor {C:attention}Three of a Kind"
            },
            reward_mult = 0.25
        },
        {
            name = 'Omega',
            key = 'cj_omega',
            pos = {x = 5, y = 3},
            desc = {
                "Do {C:red}not{} play or",
                "discard any {C:attention}Aces"
            },
            reward_mult = 0.3
        },
    }
    G.localization.descriptions.Letter = {}
    for _, v in ipairs(letters) do
        G.P_CENTERS[v.key] = {
            name = v.name,
            set = 'Letter',
            key = v.key,
            config = {},
            pos = v.pos,
            reward_mult = v.reward_mult
        }
        table.insert(v.desc, 1, "{s:0.3} ")
        G.localization.descriptions.Letter[v.key] = {
            name = v.dispname or v.name, 
            text = v.desc
        }
    end
    G.localization.descriptions.Letter.reward = {name = '', text = {
        "{s:0.5} ", 
        "{C:inactive}  Reward: +#1# Chips  ", 
        "{s:0.3} "
    }}
    G.localization.descriptions.Letter.failed = {name = '', text = {
        "{s:0.5} ", 
        "{C:red}  Requirement Failed  ", 
        "{s:0.3} "
    }}
    init_localization()

    ease_background_colour_blind_ref = ease_background_colour_blind
    ease_background_colour_blind = function(state, blind_override)
        if G.cj_universe_area then
            if state == "pre_init_universe" then
                ease_background_colour{new_colour = G.C.BLACK, contrast = 0.3}
            elseif state == "init_universe" then
                ease_background_colour{new_colour = G.C.SECONDARY_SET.Spectral, special_colour = darken(G.C.SECONDARY_SET.Spectral, 0.8), contrast = 4}
                Particles(1, 1, 0, 0, {
                    timer = 0.05,
                    scale = 0.15,
                    initialize = true,
                    lifespan = 5,
                    speed = 0.3,
                    padding = -4,
                    attach = G.ROOM_ATTACH,
                    colours = {
                        G.C.WHITE, 
                        G.C.SECONDARY_SET.Planet,
                        G.C.SECONDARY_SET.Tarot, 
                        G.C.RED, 
                        G.C.ORANGE,
                        G.C.GREEN,
                        G.C.BLUE,
                        G.C.PURPLE
                        },
                    fill = true
                })
                Particles(1, 1, 0, 0, {
                    timer = 0.03,
                    scale = 0.1,
                    lifespan = 3,
                    speed = 4,
                    attach = G.ROOM_ATTACH,
                    colours = {G.C.WHITE},
                    fill = true
                })
            end
        else
            return ease_background_colour_blind_ref(state, blind_override)
        end
    end

    beginning_end_use = function(self, area, copier)
        G.cj_universe_area = CardArea(
            G.jokers.T.x + 0.5 * G.CARD_W,
            G.jokers.T.y,
            3.9 * G.CARD_W,
            0.95 * G.CARD_H,
            {card_limit = 4, type = 'title', highlight_limit = 0}
        )

        local card_protos = {}
        for k, v in pairs(G.P_CARDS) do
            local _ = nil
            if G.GAME.starting_params.erratic_suits_and_ranks then _, k = pseudorandom_element(G.P_CARDS, pseudoseed('erratic')) end
            local _r, _s = string.sub(k, 3, 3), string.sub(k, 1, 1)
            local keep, _e, _d, _g = true, nil, nil, nil
            if _de then
                if _de.yes_ranks and not _de.yes_ranks[_r] then keep = false end
                if _de.no_ranks and _de.no_ranks[_r] then keep = false end
                if _de.yes_suits and not _de.yes_suits[_s] then keep = false end
                if _de.no_suits and _de.no_suits[_s] then keep = false end
                if _de.enhancement then _e = _de.enhancement end
                if _de.edition then _d = _de.edition end
                if _de.gold_seal then _g = _de.gold_seal end
            end

            if G.GAME.starting_params.no_faces and (_r == 'K' or _r == 'Q' or _r == 'J') then keep = false end
            
            if keep then card_protos[#card_protos+1] = {s=_s,r=_r,e=_e,d=_d,g=_g} end
        end
        if G.GAME.starting_params.extra_cards then 
            for k, v in pairs(G.GAME.starting_params.extra_cards) do
                card_protos[#card_protos+1] = v
            end
        end
        table.sort(card_protos, function (a, b) return 
            ((a.s or '')..(a.r or '')..(a.e or '')..(a.d or '')..(a.g or '')) < 
            ((b.s or '')..(b.r or '')..(b.e or '')..(b.d or '')..(b.g or '')) end)

        remove_all(G.deck.cards)
        for k, v in ipairs(card_protos) do
            card_from_control(v)
        end
        G.GAME.starting_deck_size = #G.playing_cards

        for k, v in pairs(G.jokers.cards) do
            v:start_dissolve()
        end

        for k, v in pairs(G.consumeables.cards) do
            v:start_dissolve()
        end

        G.jokers.config.card_limit = 0
        G.GAME.joker_rate = 0
        G.GAME.planet_rate = 8
        ease_hands_played(4 - G.GAME.round_resets.hands)
        G.GAME.round_resets.hands = 4
        ease_discard(4 - G.GAME.round_resets.discards)
        G.GAME.round_resets.discards = 4
        G.hand:change_size(8 - G.hand.config.card_limit)

        if G.GAME.starting_params.ante_scaling == 0 then G.GAME.starting_params.ante_scaling = 1 end
        G.GAME.starting_params.ante_scaling = G.GAME.starting_params.ante_scaling * 2

        ease_background_colour_blind("pre_init_universe")
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 2 * G.SETTINGS.GAMESPEED, func = function()
            local card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'cj_universe')
            card.calculate_joker = calculate_universe
            card:add_to_deck()
            G.jokers:emplace(card)
            ease_background_colour_blind("init_universe")
            return true end 
        }))
    end

    use_consumeable_ref = Card.use_consumeable
    Card.use_consumeable = function(self, area, copier)
        if self.beginning_end then
            return beginning_end_use(self, area, copier)
        else
            return use_consumeable_ref(self, area, copier)
        end
    end

    local can_use_consumeable_ref = Card.can_use_consumeable
    Card.can_use_consumeable = function(self, any_state, skip_check)
        if self.beginning_end and G.STATE ~= G.STATES.SHOP and G.STATE ~= G.STATES.BLIND_SELECT then
            return false
        else
            return can_use_consumeable_ref(self, any_state, skip_check)
        end
    end

    G.localization.descriptions.Joker.j_stencil.text = {
        "{X:red,C:white} X1 {} Mult for each",
        "empty {C:attention}Joker{} slot",
        "{s:0.8}All Stencils included",
        "{C:inactive}(Currently {X:red,C:white} X#1# {C:inactive})"
    }
    init_localization()
end

----------------------------------------------
------------MOD CODE END----------------------