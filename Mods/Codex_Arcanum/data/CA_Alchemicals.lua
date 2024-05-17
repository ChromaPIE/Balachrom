
function CodexArcanum.INIT.CA_Alchemicals()
    SMODS.Sprite:new("c_alchemy_undiscovered", CodexArcanum.mod.path, "c_alchemy_undiscovered.png", 71, 95, "asset_atli"):register();
    SMODS.Sprite:new("c_alchemy_locked", CodexArcanum.mod.path, "c_alchemy_locked.png", 71, 95, "asset_atli"):register();
    SMODS.Sprite:new("alchemical_atlas", CodexArcanum.mod.path, "alchemical_atlas.png", 71, 95, "asset_atli"):register();

    G.localization.descriptions["Other"]["undiscovered_alchemical"] = {
        name = "未发现",
        text = {
            "在非预设局",
            "中购买或",
            "使用此牌",
            "以了解其效果"
        }
    }


    G.localization.descriptions["Other"]["alchemical_card"] = {
        name = "炼金",
        text = {
            "仅可在盲注内使用"
        }
    }
    

    local alchemy_ignis_def = {
        name = "火",
        text = {
            "在本盲注内",
            "弃牌次数{C:attention}+1{}"
        }
    }

    local alchemy_ignis = CodexArcanum.Alchemical:new("Ignis", "ignis", {extra = 1}, { x = 0, y = 0 }, alchemy_ignis_def, 3)
    alchemy_ignis:register()
        
    function CodexArcanum.Alchemicals.c_alchemy_ignis.can_use(card)
        return true
    end

    function CodexArcanum.Alchemicals.c_alchemy_ignis.use(card, area, copier)
        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
            ease_discard(card.ability.extra)
        return true end }))
    end


    local alchemy_aqua_def = {
        name = "水",
        text = {
            "在本盲注内",
            "出牌次数{C:attention}+1"
        }
    }

    local alchemy_aqua = CodexArcanum.Alchemical:new("Aqua", "aqua", {extra = 1}, { x = 1, y = 0 }, alchemy_aqua_def, 3)
    alchemy_aqua:register()
                
    function CodexArcanum.Alchemicals.c_alchemy_aqua.can_use(card)
        return true
    end

    function CodexArcanum.Alchemicals.c_alchemy_aqua.use(card, area, copier)
        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
            ease_hands_played(card.ability.extra)
        return true end }))
    end


    local alchemy_terra_def = {
        name = "地",
        text = {
            "削减盲注的最低分数要求至{C:attention}85%"
        }
    }

    local alchemy_terra = CodexArcanum.Alchemical:new("Terra", "terra", {}, { x = 2, y = 0 }, alchemy_terra_def, 3)
    alchemy_terra:register()
                          
    function CodexArcanum.Alchemicals.c_alchemy_terra.can_use(card)
        return true
    end

    function CodexArcanum.Alchemicals.c_alchemy_terra.use(card, area, copier)
        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
            G.GAME.blind.chips = math.floor(G.GAME.blind.chips * 0.85)
            G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
            
            local chips_UI = G.hand_text_area.blind_chips
            G.FUNCS.blind_chip_UI_scale(G.hand_text_area.blind_chips)
            G.HUD_blind:recalculate() 
            chips_UI:juice_up()
            
            if not silent then play_sound('chips2') end
        return true end }))
    end


    local alchemy_aero_def = {
        name = "气",
        text = {
            "抽{C:attention}4{}张牌"
        }
    }

    local alchemy_aero = CodexArcanum.Alchemical:new("Aero", "aero", {extra = 4}, { x = 3, y = 0 }, alchemy_aero_def, 3)
    alchemy_aero:register()
            
    function CodexArcanum.Alchemicals.c_alchemy_aero.can_use(card)
        return true
    end

    function CodexArcanum.Alchemicals.c_alchemy_aero.use(card, area, copier)
        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
            G.FUNCS.draw_from_deck_to_hand(card.ability.extra)
        return true end }))
    end

    
    local alchemy_quicksilver_def = {
        name = "汞",
        text = {
            "本盲注内",
            "{C:attention}+2{}手牌上限"
        }
    }

    local alchemy_quicksilver = CodexArcanum.Alchemical:new("Quicksilver", "quicksilver", {extra = 2}, { x = 4, y = 0 }, alchemy_quicksilver_def, 3)
    alchemy_quicksilver:register()
            
    function CodexArcanum.Alchemicals.c_alchemy_quicksilver.can_use(card)
        return true
    end

    function CodexArcanum.Alchemicals.c_alchemy_quicksilver.use(card, area, copier)
        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
            G.hand:change_size(card.ability.extra)
            if not G.deck.config.quicksilver then G.deck.config.quicksilver = 0 end
            G.deck.config.quicksilver = G.deck.config.quicksilver + card.ability.extra
        return true end }))
    end


    local alchemy_salt_def = {
        name = "盐",
        text = {
            "获得{C:attention}1{}个标签"
        }
    }

    local alchemy_salt = CodexArcanum.Alchemical:new("Salt", "salt", {extra = 2}, { x = 5, y = 0 }, alchemy_salt_def, 3)
    alchemy_salt:register()
            
    function CodexArcanum.Alchemicals.c_alchemy_salt.can_use(card)
        return true
    end

    function CodexArcanum.Alchemicals.c_alchemy_salt.use(card, area, copier)
        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
            if G.FORCE_TAG then return G.FORCE_TAG end
            local _pool, _pool_key = get_current_pool('Tag', nil, nil, nil)
            local _tag_name = pseudorandom_element(_pool, pseudoseed(_pool_key))
            local it = 1
            while _tag_name == 'UNAVAILABLE' or _tag_name == "tag_double" or _tag_name == "tag_orbital" do
                it = it + 1
                _tag_name = pseudorandom_element(_pool, pseudoseed(_pool_key..'_resample'..it))
            end
    
            G.GAME.round_resets.blind_tags = G.GAME.round_resets.blind_tags or {}
            local _tag = Tag(_tag_name, nil, G.GAME.blind)
            add_tag(_tag)
        return true end }))
    end
    

    local alchemy_sulfur_def = {
        name = "硫",
        text = {
            "出牌次数减为{C:attention}1",
            "减去的每次出牌给予{C:attention}$4{}"
        }
    }

    local alchemy_sulfur = CodexArcanum.Alchemical:new("Sulfur", "sulfur", {extra = 10}, { x = 0, y = 1 }, alchemy_sulfur_def, 3)
    alchemy_sulfur:register()
            
    function CodexArcanum.Alchemicals.c_alchemy_sulfur.can_use(card)
        return true
    end

    function CodexArcanum.Alchemicals.c_alchemy_sulfur.use(card, area, copier)
        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
            local prev_hands = G.GAME.current_round.hands_left
            ease_hands_played(-(prev_hands - 1))
            ease_dollars(4 * (prev_hands - 1), true)
        return true end }))
    end

    
    local alchemy_phosphorus_def = {
        name = "磷",
        text = {
            "将{C:attention}所有{}已丢弃的卡牌",
            "重新加入牌组"
        }
    }

    local alchemy_phosphorus = CodexArcanum.Alchemical:new("Phosphorus", "phosphorus", {extra = 4}, { x = 1, y = 1 }, alchemy_phosphorus_def, 3)
    alchemy_phosphorus:register()
            
    function CodexArcanum.Alchemicals.c_alchemy_phosphorus.can_use(card)
        return true
    end

    function CodexArcanum.Alchemicals.c_alchemy_phosphorus.use(card, area, copier)
        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
            take_cards_from_discard(#G.discard.cards)
        return true end }))
    end

    
    local alchemy_bismuth_def = {
        name = "铋",
        text = {
            "在本盲注内",
            "将至多{C:attention}2{}张选定卡牌",
            "临时转换为{C:attention}多彩"
        }
    }

    local alchemy_bismuth = CodexArcanum.Alchemical:new("Bismuth", "bismuth", {extra = 2}, { x = 2, y = 1 }, alchemy_bismuth_def, 3)
    alchemy_bismuth:register()
            
    function CodexArcanum.Alchemicals.c_alchemy_bismuth.can_use(card)
        if #G.hand.highlighted <= card.ability.extra and #G.hand.highlighted >= 1 then return true else return false end
    end

    function CodexArcanum.Alchemicals.c_alchemy_bismuth.use(card, area, copier)
        G.deck.config.bismuth = G.deck.config.bismuth or {}
        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
            for k, card in ipairs(G.hand.highlighted) do
                card:set_edition({polychrome = true}, true)
                table.insert(G.deck.config.bismuth, card.unique_val)
            end
        return true end }))
    end

    
    local alchemy_cobalt_def = {
        name = "钴",
        text = {
        "将当前选定的{C:legendary,E:1}牌型",
        "提升{C:attention}2{}个等级", 
        "{C:inactive}（当前牌型：#1#）"
        }
    }

    local alchemy_cobalt = CodexArcanum.Alchemical:new("Cobalt", "cobalt", {extra = 1}, { x = 3, y = 1 }, alchemy_cobalt_def, 3)
    alchemy_cobalt:register()
            
    function CodexArcanum.Alchemicals.c_alchemy_cobalt.can_use(card)
        if #G.hand.highlighted >= 1 then return true else return false end
    end

    function CodexArcanum.Alchemicals.c_alchemy_cobalt.use(card, area, copier)
        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
            local text,disp_text = G.FUNCS.get_poker_hand_info(G.hand.highlighted)
            update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=localize(text, 'poker_hands'),chips = G.GAME.hands[text].chips, mult = G.GAME.hands[text].mult, level=G.GAME.hands[text].level})
            level_up_hand(self, text, nil, 2)
            update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
        return true end }))
    end

    
    local alchemy_arsenic_def = {
        name = "砷",
        text = {
        "用弃牌堆{C:attention}换掉{}手牌"
        }
    }

    local alchemy_arsenic = CodexArcanum.Alchemical:new("Arsenic", "arsenic", {}, { x = 4, y = 1 }, alchemy_arsenic_def, 3)
    alchemy_arsenic:register()
            
    function CodexArcanum.Alchemicals.c_alchemy_arsenic.can_use(card)
        return true
    end

    function CodexArcanum.Alchemicals.c_alchemy_arsenic.use(card, area, copier)
        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
            local temp_hands = G.GAME.current_round.hands_left
            local temp_discards = G.GAME.current_round.discards_left
            G.GAME.current_round.hands_left = 0
            G.GAME.current_round.discards_left = 0
            ease_hands_played(temp_discards)
            ease_discard(temp_hands)
        return true end }))
    end

    
    local alchemy_antimony_def = {
        name = "锑",
        text = {
        "在本盲注内",
        "为随机一张小丑牌生成",
        "带有{C:dark_edition}负片{}和{C:eternal}永恒{}的临时{C:attention}复制"
        }
    }

    local alchemy_antimony = CodexArcanum.Alchemical:new("Antimony", "antimony", {}, { x = 5, y = 1 }, alchemy_antimony_def, 3)
    alchemy_antimony:register()
                
    function CodexArcanum.Alchemicals.c_alchemy_antimony.can_use(card)
        return true
    end

    function CodexArcanum.Alchemicals.c_alchemy_antimony.use(card, area, copier)
        G.jokers.config.antimony = G.jokers.config.antimony or {}
        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
            if #G.jokers.cards > 0 then 
                local chosen_joker = pseudorandom_element(G.jokers.cards, pseudoseed('invisible'))
                local card = copy_card(chosen_joker, nil, nil, nil, chosen_joker.edition and chosen_joker.edition.negative)
                card:set_edition({negative = true}, true)
                card:set_eternal(true)
                if card.ability.invis_rounds then card.ability.invis_rounds = 0 end
                card:add_to_deck()
                G.jokers:emplace(card)
                table.insert(G.jokers.config.antimony, card.unique_val)
            end
        return true end }))
    end

    
    local alchemy_soap_def = {
        name = "皂",
        text = {
            "将至多{C:attention}3{}张选定的卡牌",
            "替换为牌组中的牌"
        }
    }

    local alchemy_soap = CodexArcanum.Alchemical:new("Soap", "soap", {extra = 3}, { x = 0, y = 2 }, alchemy_soap_def, 3)
    alchemy_soap:register()
                    
    function CodexArcanum.Alchemicals.c_alchemy_soap.can_use(card)
        if #G.hand.highlighted <= card.ability.extra and #G.hand.highlighted >= 1 then return true else return false end
    end

    function CodexArcanum.Alchemicals.c_alchemy_soap.use(card, area, copier)
        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
            for k, _card in ipairs(G.hand.highlighted) do
                return_to_deck(card.ability.extra, _card)
            end
            G.FUNCS.draw_from_deck_to_hand(card.ability.extra)
        return true end }))
    end

    
    local alchemy_manganese_def = {
        name = "锰",
        text = {
            "在本盲注内",
            "将至多{C:attention}4{}张选定卡牌",
            "临时增强为{C:attention}钢铁牌"
        }
    }

    local alchemy_manganese = CodexArcanum.Alchemical:new("Manganese", "manganese", {extra = 4}, { x = 1, y = 2 }, alchemy_manganese_def, 3)
    alchemy_manganese:register()
                        
    function CodexArcanum.Alchemicals.c_alchemy_manganese.can_use(card)
        if #G.hand.highlighted <= card.ability.extra and #G.hand.highlighted >= 1 then return true else return false end
    end

    function CodexArcanum.Alchemicals.c_alchemy_manganese.use(card, area, copier)
        G.deck.config.manganese = G.deck.config.manganese or {}
        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
            for k, card in ipairs(G.hand.highlighted) do
                delay(0.05)
                card:juice_up(1, 0.5)
                card:set_ability(G.P_CENTERS.m_steel)
                table.insert(G.deck.config.manganese, card.unique_val)
            end
        return true end }))
    end

    
    local alchemy_wax_def = {
        name = "蜡",
        text = {
            "在本盲注内",
            "为选定卡牌生成",
            "{C:attention}2{}张临时复制"
        }
    }

    local alchemy_wax = CodexArcanum.Alchemical:new("Wax", "wax", {extra = 1}, { x = 2, y = 2 }, alchemy_wax_def, 3)
    alchemy_wax:register()
            
    function CodexArcanum.Alchemicals.c_alchemy_wax.can_use(card)
        if #G.hand.highlighted <= card.ability.extra and #G.hand.highlighted >= 1 then return true else return false end
    end

    function CodexArcanum.Alchemicals.c_alchemy_wax.use(card, area, copier)
        G.deck.config.wax = G.deck.config.wax or {}
        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
            for i = 1, 2 do
                G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                local _card = copy_card(G.hand.highlighted[1], nil, nil, G.playing_card)
                _card:add_to_deck()
                G.deck.config.card_limit = G.deck.config.card_limit + 1
                table.insert(G.playing_cards, _card)
                G.hand:emplace(_card)
                _card:start_materialize(nil, _first_dissolve)
                table.insert(G.deck.config.wax, _card.unique_val)
            end
            playing_card_joker_effects(new_cards)
        return true end }))
    end

    
    local alchemy_borax_def = {
        name = "硼",
        text = {
            "在本盲注内",
            "将至多{C:attention}4{}张选定卡牌",
            "临时转换为数量最多的{C:attention}花色"
        }
    }

    local alchemy_borax = CodexArcanum.Alchemical:new("Borax", "borax", {extra = 4}, { x = 3, y = 2 }, alchemy_borax_def, 3)
    alchemy_borax:register()
            
    function CodexArcanum.Alchemicals.c_alchemy_borax.can_use(card)
        if #G.hand.highlighted <= card.ability.extra and #G.hand.highlighted >= 1 then return true else return false end
    end

    function CodexArcanum.Alchemicals.c_alchemy_borax.use(card, area, copier)
        G.deck.config.borax = G.deck.config.borax or {}
        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
            local suit_to_card_couner = {}
            for _, v in pairs(SMODS.Card.SUITS) do
                if not v.disabled then
                    suit_to_card_couner[v.name] = 0
                end
            end

            for _, v in pairs(G.playing_cards) do
                suit_to_card_couner[v.base.suit] = suit_to_card_couner[v.base.suit] + 1
            end

            local top_suit = "";
            local top_count = 0;
            for suit, count in pairs(suit_to_card_couner) do
                if top_count < count then
                    top_suit = suit
                    top_count = count
                end
            end

            for k, card in ipairs(G.hand.highlighted) do
                delay(0.05)
                card:juice_up(1, 0.5)
                local prev_suit = card.base.suit
                card:change_suit(top_suit)
                table.insert(G.deck.config.borax, {id = card.unique_val, suit = prev_suit})
            end
        return true end }))
    end

            
    local alchemy_glass_def = {
        name = "玻",
        text = {
            "在本盲注内",
            "将至多{C:attention}4{}张选定卡牌",
            "临时增强为{C:attention}玻璃牌"
        }
    }

    local alchemy_glass = CodexArcanum.Alchemical:new("Glass", "glass", {extra = 4}, { x = 4, y = 2 }, alchemy_glass_def, 3)
    alchemy_glass:register()
                
    function CodexArcanum.Alchemicals.c_alchemy_glass.can_use(card)
        if #G.hand.highlighted <= card.ability.extra and #G.hand.highlighted >= 1 then return true else return false end
    end

    function CodexArcanum.Alchemicals.c_alchemy_glass.use(card, area, copier)
        G.deck.config.glass = G.deck.config.glass or {}
        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
            for k, card in ipairs(G.hand.highlighted) do
                delay(0.05)
                card:juice_up(1, 0.5)
                card:set_ability(G.P_CENTERS.m_glass)
                table.insert(G.deck.config.glass, card.unique_val)
            end
        return true end }))
    end


    local alchemy_magnet_def = {
        name = "磁",
        text = {
            "抽{C:attention}2{}张与选定卡牌",
            "点数相同的牌"
        }
    }

    local alchemy_magnet = CodexArcanum.Alchemical:new("Magnet", "magnet", {extra = 1}, { x = 5, y = 2 }, alchemy_magnet_def, 3)
    alchemy_magnet:register()
                
    function CodexArcanum.Alchemicals.c_alchemy_magnet.can_use(card)
        if #G.hand.highlighted <= card.ability.extra and #G.hand.highlighted >= 1 then return true else return false end
    end

    function CodexArcanum.Alchemicals.c_alchemy_magnet.use(card, area, copier)
        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
            local cur_rank = G.hand.highlighted[1].base.id
            local count = 2
            for _, v in pairs(G.deck.cards) do
                if v.base.id == cur_rank and count > 0 then
                    delay(0.05)
                    draw_card(G.deck, G.hand, 100, 'up', true, v)
                    count = count - 1
                end
            end
        return true end }))
    end


    local alchemy_gold_def = {
        name = "金",
        text = {
            "在本盲注内",
            "将至多{C:attention}4{}张选定卡牌",
            "临时增强为{C:attention}黄金牌"
        }
    }

    local alchemy_gold = CodexArcanum.Alchemical:new("Gold", "gold", {extra = 4}, { x = 0, y = 3 }, alchemy_gold_def, 3)
    alchemy_gold:register()
                
    function CodexArcanum.Alchemicals.c_alchemy_gold.can_use(card)
        if #G.hand.highlighted <= card.ability.extra and #G.hand.highlighted >= 1 then return true else return false end
    end
    
    function CodexArcanum.Alchemicals.c_alchemy_gold.use(card, area, copier)
        G.deck.config.gold = G.deck.config.gold or {}
        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
            for k, card in ipairs(G.hand.highlighted) do
                delay(0.05)
                card:juice_up(1, 0.5)
                card:set_ability(G.P_CENTERS.m_gold)
                table.insert(G.deck.config.gold, card.unique_val)
            end
        return true end }))
    end


    local alchemy_silver_def = {
        name = "银",
        text = {
            "在本盲注内",
            "将至多{C:attention}4{}张选定卡牌",
            "临时增强为{C:attention}幸运牌"
        }
    }

    local alchemy_silver = CodexArcanum.Alchemical:new("Silver", "silver", {extra = 4}, { x = 1, y = 3 }, alchemy_silver_def, 3)
    alchemy_silver:register()
                
    function CodexArcanum.Alchemicals.c_alchemy_silver.can_use(card)
        if #G.hand.highlighted <= card.ability.extra and #G.hand.highlighted >= 1 then return true else return false end
    end
        
    function CodexArcanum.Alchemicals.c_alchemy_silver.use(card, area, copier)
        G.deck.config.silver = G.deck.config.silver or {}
        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
            for k, card in ipairs(G.hand.highlighted) do
                delay(0.05)
                card:juice_up(1, 0.5)
                card:set_ability(G.P_CENTERS.m_lucky)
                table.insert(G.deck.config.silver, card.unique_val)
            end
        return true end }))
    end


    local alchemy_oil_def = {
        name = "油",
        text = {
            "使手中所有的",
            "{C:attention}失效{}卡牌复原"
        }
    }

    local alchemy_oil = CodexArcanum.Alchemical:new("Oil", "oil", {}, { x = 2, y = 3 }, alchemy_oil_def, 3)
    alchemy_oil:register()
                
    function CodexArcanum.Alchemicals.c_alchemy_oil.can_use(card)
        return true 
    end
        
    function CodexArcanum.Alchemicals.c_alchemy_oil.use(card, area, copier)
        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
            for k, v in ipairs(G.hand.cards) do
                delay(0.05)
                v:juice_up(1, 0.5)
                v:set_debuff(false)
                v.config = v.config or {}
                v.config.oil = true
                if v.facing == 'back' then
                    v:flip()
                end
            end
        return true end }))
    end


    local alchemy_acid_def = {
        name = "酸",
        text = {
            "将与选定卡牌点数",
            "相同的牌全部{C:attention}摧毁{}",
            "本盲注结束后复原"
        }
    }

    local alchemy_acid = CodexArcanum.Alchemical:new("Acid", "acid", {extra = 1}, { x = 3, y = 3 }, alchemy_acid_def, 3)
    alchemy_acid:register()
                
    function CodexArcanum.Alchemicals.c_alchemy_acid.can_use(card)
        if #G.hand.highlighted <= card.ability.extra and #G.hand.highlighted >= 1 then return true else return false end
    end

    function CodexArcanum.Alchemicals.c_alchemy_acid.use(card, area, copier)
        G.deck.config.acid = G.deck.config.acid or {}
        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
            for k, v in ipairs(G.playing_cards) do
                if v:get_id() == G.hand.highlighted[1]:get_id() then
                    table.insert(G.deck.config.acid, v)
                    v:start_dissolve({HEX("E3FF37")}, nil, 1.6)
                end 
            end
            for j=1, #G.jokers.cards do
                eval_card(G.jokers.cards[j], {cardarea = G.jokers, remove_playing_cards = true, removed = G.deck.config.acid})
            end
        return true end }))
    end


    local alchemy_brimstone_def = {
        name = "磺",
        text = {
            "在本盲注内",
            "出牌和弃牌次数各{C:attention}+2",
            "并使最左边一张",
            "未失效的小丑牌失效"
        }
    }

    local alchemy_brimstone = CodexArcanum.Alchemical:new("Brimstone", "brimstone", {extra = 2}, { x = 4, y = 3 }, alchemy_brimstone_def, 3)
    alchemy_brimstone:register()
                
    function CodexArcanum.Alchemicals.c_alchemy_brimstone.can_use(card)
        return true
    end

    function CodexArcanum.Alchemicals.c_alchemy_brimstone.use(card, area, copier)
        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
            ease_discard(card.ability.extra)
            ease_hands_played(card.ability.extra)
            for i = 1, #G.jokers.cards do
                if not G.jokers.cards[i].debuff then
                    G.jokers.cards[i]:set_debuff(true)
                    G.jokers.cards[i]:juice_up()
                    break
                end

            end
        return true end }))
    end


    local alchemy_uranium_def = {
        name = "铀",
        text = {
            "在本盲注内",
            "将选定卡牌的{C:attention}增强{}、{C:attention}蜡封{}和{C:attention}版本",
            "临时复制至{C:attention}3{}张无增强的卡牌"
        },
        unlock = {
            "在同一赛局内",
            "使用{C:attention}5{}张{E:1,C:alchemical}炼金牌"
        }
    }


    local alchemy_uranium = CodexArcanum.Alchemical:new("Uranium", "uranium", {extra = 1}, { x = 5, y = 3 }, alchemy_uranium_def, 3, false, false, {type = 'used_alchemical', extra = 5})
    alchemy_uranium:register()
            
    function CodexArcanum.Alchemicals.c_alchemy_uranium.can_use(card)
        if #G.hand.highlighted <= card.ability.extra and #G.hand.highlighted >= 1 then return true else return false end
    end

    function CodexArcanum.Alchemicals.c_alchemy_uranium.use(card, area, copier)
        G.deck.config.uranium = G.deck.config.uranium or {}
        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
            for i = 1, 3 do
                local eligible_cards = {}
                for k, v in ipairs(G.hand.cards) do
                    if v.config.center == G.P_CENTERS.c_base and not (v.edition) and not (v.seal) then
                        table.insert(eligible_cards, v)
                    end
                end

                if #eligible_cards > 0 then
                    local conv_card = pseudorandom_element(eligible_cards, pseudoseed(card.ability.name))

                    delay(0.05)
                    if not (G.hand.highlighted[1].edition) then conv_card:juice_up(1, 0.5) end
                    conv_card:set_ability(G.hand.highlighted[1].config.center)
                    conv_card:set_seal(G.hand.highlighted[1]:get_seal(true))
                    conv_card:set_edition(G.hand.highlighted[1].edition)

                    table.insert(G.deck.config.uranium, conv_card.unique_val)
                end
                
            end
        return true end }))
    end
end