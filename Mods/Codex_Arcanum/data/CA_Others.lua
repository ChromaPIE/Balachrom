function CodexArcanum.INIT.CA_Others()
    SMODS.Sprite:new("ca_others_atlas", CodexArcanum.mod.path, "ca_others_atlas.png", 71, 95, "asset_atli"):register();
    SMODS.Sprite:new("ca_decks_atlas", CodexArcanum.mod.path, "ca_decks_atlas.png", 71, 95, "asset_atli"):register();

    -- Mortar and Pestle
    local v_mortar_and_pestle_def = {
        name = "杵和臼",
        text = {
            "{C:attention}+1{}消耗牌槽位"
        }
    }

    local mortar_and_pestle = SMODS.Voucher:new("Mortar and Pestle", "mortar_and_pestle", {extra = 1}, { x = 0, y = 2 }, v_mortar_and_pestle_def, 10, true, false, true, nil, "ca_others_atlas")
    mortar_and_pestle:register()

        -- Cauldron
    local v_cauldron_def = {
        name = "坩埚",
        text = {
            "一些{C:alchemical}炼金牌",
            "可能成为{C:dark_edition}负片"
        }
    }

    local cauldron = SMODS.Voucher:new("Cauldron", "cauldron", {}, { x = 0, y = 3 }, v_cauldron_def, 10, true, false, true, {"v_mortar_and_pestle"}, "ca_others_atlas")
    cauldron:register()

    -- Alchemical Merchant
    local v_alchemical_merchant_def = {
        name = "炼金牌商人",
        text = {
            "商店中有",
            "{C:alchemical}炼金牌",
            "可供选购"
        }
    }

    local alchemical_merchant = SMODS.Voucher:new("Alchemical Merchant", "alchemical_merchant", {extra = 4.8/4}, { x = 1, y = 2 }, v_alchemical_merchant_def, 10, true, false, true, nil, "ca_others_atlas")
    alchemical_merchant:register()

    function SMODS.Vouchers.v_alchemical_merchant.redeem(center)
        G.E_MANAGER:add_event(Event({func = function()
        G.GAME.alchemical_rate = 4*center.extra
        return true end }))
    end

    -- Alchemical Tycoon
    local v_alchemical_tycoon_def = {
        name = "炼金大亨",
        text = {
            "商店中{C:alchemical}炼金牌",
            "出现频率{C:attention}X2"
        }
    }

    local alchemical_tycoon = SMODS.Voucher:new("Alchemical Tycoon", "alchemical_tycoon", {extra = 9.6/4}, { x = 1, y = 3 }, v_alchemical_tycoon_def, 10, true, false, true, {"v_alchemical_merchant"}, "ca_others_atlas")
    alchemical_tycoon:register()

    function SMODS.Vouchers.v_alchemical_tycoon.redeem(center)
        G.E_MANAGER:add_event(Event({func = function()
        G.GAME.alchemical_rate = 4*center.extra
        return true end }))
    end



    -- Philosopher's Deck
    local philosopher_deck_def = {
        name = "哲学家的牌组",
        text = {
        "开局时即拥有",
        "{C:tarot,T:v_alchemical_merchant}炼金牌商人{}奖券",
        "和一张{C:tarot,T:c_seeker}求索者"
        },
    }
    
    local philosopher_deck = SMODS.Deck:new("Philosopher's Deck", "philosopher", {vouchers = { 'v_alchemical_merchant' }, consumables = { 'c_seeker' }, atlas = "ca_decks_atlas"}, {x = 0, y = 0}, philosopher_deck_def)
    philosopher_deck:register()



    -- Herbalist's Deck
    local herbalist_deck_def = {
        name = "草药医生的牌组",
        text = {
        "开局时即拥有",
        "{C:tarot,T:v_mortar_and_pestle}杵和臼{}奖券",
        "每个Boss盲注开局时",
        "获得一张{C:alchemical}炼金牌"
        },
    }
    
    local herbalist_deck = SMODS.Deck:new("Herbalist's Deck", "herbalist", {vouchers = { 'v_mortar_and_pestle' }, atlas = "ca_decks_atlas"}, {x = 1, y = 0}, herbalist_deck_def)
    herbalist_deck:register()



    local tag_elemental_def = {
        name = "元素标签",
        text = {
        "获得一个免费的",
        "{C:alchemical}超级炼金包"
        }
    }
        
        local tag_elemental = SMODS.Tag:new("Elemental Tag", "elemental", {type = 'new_blind_choice'}, { x = 0, y = 0 }, tag_elemental_def)
        SMODS.Sprite:new("tag_elemental", CodexArcanum.mod.path, "tag_elemental.png", 34, 34, "asset_atli"):register();
        tag_elemental:register()

        function SMODS.Tags.tag_elemental.apply(tag, context)
            if context.type == 'new_blind_choice' then 
                local lock = tag.ID
                G.CONTROLLER.locks[lock] = true
                tag:yep('+', G.C.PURPLE,function() 
                    local key = 'p_alchemy_mega_1'
                    local card = Card(G.play.T.x + G.play.T.w/2 - G.CARD_W*1.27/2,
                    G.play.T.y + G.play.T.h/2-G.CARD_H*1.27/2, G.CARD_W*1.27, G.CARD_H*1.27, G.P_CARDS.empty, G.P_CENTERS[key], {bypass_discovery_center = true, bypass_discovery_ui = true})
                    card.cost = 0
                    card.from_tag = true
                    G.FUNCS.use_card({config = {ref_table = card}})
                    card:start_materialize()
                    G.CONTROLLER.locks[lock] = nil
                    return true
                end)
                tag.triggered = true
                return true
            end
        end



    local tarot_seeker_def = {
        name = "求索者",
        text = {
            "生成最多{C:attention}#1#张",
            "随机{C:alchemical}炼金牌{}",
            "{C:inactive}（必须有空间）"
        }
    }

    local tarot_seeker = SMODS.Tarot:new("The Seeker", "seeker", {alchemicals = 2}, { x = 0, y = 0 }, tarot_seeker_def, 3, 1.0, "Round Bonus", true, false, "ca_others_atlas")
    tarot_seeker:register()

    function SMODS.Tarots.c_seeker.loc_def(card)
        return {card.config.alchemicals}
    end

    function SMODS.Tarots.c_seeker.can_use(card)
        if #G.consumeables.cards < G.consumeables.config.card_limit or card.area == G.consumeables then return true end
    end

    function SMODS.Tarots.c_seeker.use(card, area, copier)
        local used_tarot = (copier or card)
        for i = 1, math.min(card.ability.consumeable.alchemicals, G.consumeables.config.card_limit - #G.consumeables.cards) do
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            if G.consumeables.config.card_limit > #G.consumeables.cards then
                play_sound('timpani')
                local card = create_card('Alchemical', G.consumeables, nil, nil, nil, nil, nil, 'see')
                card:add_to_deck()
                G.consumeables:emplace(card)
                used_tarot:juice_up(0.3, 0.5)
            end
            return true end }))
        end
        delay(0.6)
    end



    local c_philosopher_stone_def = {
        name = "Philosopher's Stone",
        text = {
        "{C:attention}Retrigger{} all played cards",
        "for one blind"
        }
    }

    local spectral_philosopher_stone = SMODS.Spectral:new("Philosopher's Stone", "philosopher_stone", {}, { x = 0, y = 1 }, c_philosopher_stone_def, 4, true, false, "ca_others_atlas")
    spectral_philosopher_stone:register();

    function SMODS.Spectrals.c_philosopher_stone.can_use(card)
        if G.STATE == G.STATES.SELECTING_HAND then
            card.config.in_booster = false
            return true
        end

        if G.STATE == G.STATES.STANDARD_PACK or G.STATE == G.STATES.TAROT_PACK 
        or G.STATE == G.STATES.PLANET_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.BUFFOON_PACK then
            card.config.in_booster = true
            return true
        end
    end

    function SMODS.Spectrals.c_philosopher_stone.use(card)

    end
end