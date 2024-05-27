local function setUpLocalizationCurses()

    G.localization.descriptions.Curse = {
        cu_hook = {
            name = "The Hook",
            text = {
                "{C:red}Discards #1#{} random",
                "cards per hand played"
            }
        },
        cu_wall = {
            name = "The Wall",
            text = {
                "Increase Blind",
                "size by {C:attention}#1#%{}"
            }
        },
        cu_wheel = {
            name = "The Wheel",
            text = {
                "{C:attention}#1# in #2#{} cards get",
                "drawn {C:attention}face down{}",
                "{C:inactive}(Fixed probability){}"
            }
        },
        cu_arm = {
            name = "The Arm",
            text = {
                "{C:attention}#1# in #2# chance{} to",
                "{C:attention}decrease{} level of",
                "played poker hand",
                "{C:inactive}(Fixed probability){}"
            }
        },
        cu_psychic = {
            name = "The Psychic",
            text = {
                "{X:red,C:white} X#1# {} Mult if playing",
                "less than {C:attention}5 cards{}"
            }
        },
        cu_goad = {
            name = "The Goad",
            text = {
                "{C:attention}#1# in #2# chance{} for",
                "each {C:spades}Spade{} card to",
                "be {C:attention}debuffed{}",
                "{C:inactive}(Fixed probability){}"
            }
        },
        cu_water = {
            name = "The Water",
            text = {
                "{C:red}-#1#{} discard"
            }
        },
        cu_eye = {
            name = "The Eye",
            text = {
                "{X:red,C:white} X#1# {} Mult if hand type",
                "was already played",
                "this round",
                "{C:attention}#2#{}"
            }
        },
        cu_mouth = {
            name = "The Mouth",
            text = {
                "{X:red,C:white} X#1# {} Mult if hand type",
                "is different than the",
                "first played this round",
                "{C:attention}#2#{}"
            }
        },
        cu_plant = {
            name = "The Plant",
            text = {
                "{C:attention}#1# in #2# chance{} for",
                "each {C:attention}face{} card to",
                "be {C:attention}debuffed{}",
                "{C:inactive}(Fixed probability){}"
            }
        },
        cu_needle = {
            name = "The Needle",
            text = {
                "{C:blue}-#1#{} hand"
            }
        },
        cu_head = {
            name = "The Head",
            text = {
                "{C:attention}#1# in #2# chance{} for",
                "each {C:hearts}Heart{} card to",
                "be {C:attention}debuffed{}",
                "{C:inactive}(Fixed probability){}"
            }
        },
        cu_tooth = {
            name = "The Tooth",
            text = {
                "{C:attention}#1# in #2# chance{} to",
                "lose {C:money}$1{} for",
                "each card played",
                "{C:inactive}(Fixed probability){}"
            }
        },
        cu_ox = {
            name = "The Ox",
            text = {
                "Lose {C:money}$#1#{} if played",
                "hand is a {C:attention}#2#{}",
                "{C:inactive}(Updated each Ante){}"
            }
        },
        cu_house = {
            name = "The House",
            text = {
                "{C:attention}#1# in #2# chance{} for each",
                "card of first hand to",
                "be {C:attention}drawn face down{}",
                "{C:inactive}(Fixed probability){}"
            }
        },
        cu_club = {
            name = "The Club",
            text = {
                "{C:attention}#1# in #2# chance{} for",
                "each {C:clubs}Club{} card to",
                "be {C:attention}debuffed{}",
                "{C:inactive}(Fixed probability){}"
            }
        },
        cu_fish = {
            name = "The Fish",
            text = {
                "Cards drawn after playing a",
                "hand have a {C:attention}#1# in #2# chance{} of",
                "being {C:attention}drawn face down{}",
                "{C:inactive}(Fixed probability){}"
            }
        },
        cu_window = {
            name = "The Window",
            text = {
                "{C:attention}#1# in #2# chance{} for",
                "each {C:diamonds}Diamond{} card to",
                "be {C:attention}debuffed{}",
                "{C:inactive}(Fixed probability){}"
            }
        },
        cu_manacle = {
            name = "The Manacle",
            text = {
                "{C:attention}-1 Hand Size{} if more",
                "than {C:blue}#1#{} hand remaining"
            }
        },
        cu_serpent = {
            name = "The Serpent",
            text = {
                "After the first Play or",
                "Discard, always draw {C:attention}#1#{} cards"
            }
        },
        cu_pillar = {
            name = "The Pillar",
            text = {
                "Cards played this Ante",
                "have a {C:attention}#1# in #2# chance{}",
                " of being {C:attention}debuffed{}",
                "{C:inactive}(Fixed probability){}"
            }
        },
        cu_flint = {
            name = "The Flint",
            text = {
                "Base {C:blue}Chips{} and",
                "{C:red}Mult{} are reduced",
                "by {C:attention}#1#%{}"
            }
        },
        cu_mark = {
            name = "The Mark",
            text = {
                "{C:attention}#1# in #2# chance{} for each",
                "{C:attention}face{} card to be",
                "drawn {C:attention}face down{}",
                "{C:inactive}(Fixed probability){}"
            }
        },
        cu_final_vessel = {
            name = "Violet Vessel",
            text = {
                "Increase Blind size by {C:attention}#1#%{}",
                "Getting a {X:black,C:white}curse{} will {C:attention}increase{} this",
                "amount instead of applying a new {X:black,C:white}curse{}",
                "{C:inactive}(Currently: #2#){}"
            }
        },
    }
end

---------------------------
-------- Overrides --------
---------------------------

local function override()

    -- Track final curse usage
    local Game_init_game_object_ref = Game.init_game_object
    function Game.init_game_object(self)

        local ret = Game_init_game_object_ref(self)
        ret.final_curse = false
        return ret
    end

    -- Track curses usage
    local Game_start_run_ref = Game.start_run
    function Game.start_run(self, args)
        
        Game_start_run_ref(self, args)

        local saveTable = args.savetext or nil

        G.GAME.curses = {}
        G.HUD_curses = {}
        
        if saveTable then 
            local curses = saveTable.GAME.saved_curses or {}
            for k, v in ipairs(curses) do
                local _curse = Curse('cu_wall')
                _curse:load(v)
                add_curse(_curse)
            end
        end
    end

    -- Manage pool if Curse pool
    local get_current_pool_ref  = get_current_pool
    function get_current_pool(_type, _rarity, _legendary, _append)

        if _type == 'Curse' then
            --create the pool
            G.ARGS.TEMP_POOL = EMPTY(G.ARGS.TEMP_POOL)
            local _pool, _starting_pool, _pool_key, _pool_size = G.ARGS.TEMP_POOL, nil, '', 0
        
            _starting_pool, _pool_key = G.P_CENTER_POOLS[_type], _type..(_append or '')
        
            --cull the pool
            for k, v in ipairs(_starting_pool) do
                local add = nil
                if _type == 'Curse' then
                    add = true
                    --if v.name == G.P_BLINDS[G.GAME.round_resets.blind_choices.Boss].name then add = nil
                    if v.config.type == 'final_curse' then add = nil
                    else
                        for kt, vt in ipairs(G.GAME.curses) do
                            if v.name == vt.name then
                                add = nil
                                break
                            end
                        end
                    end
                elseif _type == 'Final_Curse' then
                    if v.config.type == 'final_curse' then add = true end
                end
        
                if v.no_pool_flag and G.GAME.pool_flags[v.no_pool_flag] then add = nil end
                if v.yes_pool_flag and not G.GAME.pool_flags[v.yes_pool_flag] then add = nil end
                
                if add and not G.GAME.banned_keys[v.key] then 
                    _pool[#_pool + 1] = v.key
                    _pool_size = _pool_size + 1
                else
                    _pool[#_pool + 1] = 'UNAVAILABLE'
                end
            end
        
            --if pool is empty, return a final curse
            if _pool_size == 0 then
                _pool = EMPTY(G.ARGS.TEMP_POOL)
                if _type == 'Curse' then _pool[#_pool + 1] = "cu_final_vessel"  -- Only one for now TODO
                else _pool[#_pool + 1] = "cu_wall"    -- Should never happen...
                end
            end
        
            return _pool, _pool_key..G.GAME.round_resets.ante

        else
            -- Use normal pool
            local _pool, _pool_key = get_current_pool_ref(_type, _rarity, _legendary, _append)
            return _pool, _pool_key
        end
    end

    -- Manage card UI if Curse/Cursed
    local generate_card_ui_ref = generate_card_ui
    function generate_card_ui(_c, full_UI_table, specific_vars, card_type, badges, hide_desc, main_start, main_end)
        
        local first_pass = nil
        first_pass = not full_UI_table
        local info_queue = {}
            

        -- Add custom badges
        if first_pass and badges then

            if _c.config.nb_curse then
                -- Add the Cursed badge
                badges[#badges + 1] = 'cursed'
            end
        
            if _c.set == 'Curse' then
                -- Add the Curse badge
                badges[#badges + 1] = 'curse'
            end
        end

        if _c.set == 'Curse' then    -- Overwrite
            -- Just copy-paste for now... TODO
            if first_pass then 
                full_UI_table = {
                    main = {},
                    info = {},
                    type = {},
                    name = nil,
                    badges = badges or {}
                }
            end
            
            local desc_nodes = (not full_UI_table.name and full_UI_table.main) or full_UI_table.info
            local name_override = nil

            if full_UI_table.name then
                full_UI_table.info[#full_UI_table.info+1] = {}
                desc_nodes = full_UI_table.info[#full_UI_table.info]
            end

            if not full_UI_table.name then
                full_UI_table.name = localize{type = 'name', set = _c.set, key = _c.key, nodes = full_UI_table.name}
                full_UI_table.card_type = card_type or _c.set
            end 

            local loc_vars = {}
            if main_start then 
                desc_nodes[#desc_nodes+1] = main_start 
            end
            
            localize{type = 'descriptions', key = _c.key, set = 'Curse', nodes = desc_nodes, vars = specific_vars or {}}

            if main_end then 
                desc_nodes[#desc_nodes+1] = main_end 
            end

            for _, v in ipairs(info_queue) do
                generate_card_ui(v, full_UI_table)
            end
        
            return full_UI_table

        else    -- Do not overwrite
            local ret = generate_card_ui_ref(_c, full_UI_table, specific_vars, card_type, badges, hide_desc, main_start, main_end)

            -- Add extra badges info
            if first_pass and badges then
                for k, v in ipairs(badges) do
                    if v == 'cursed' then info_queue[#info_queue+1] = {key = 'cursed', set = 'Other', vars = {_c.config.nb_curse or 1}} end
                end
                for _, v in ipairs(info_queue) do
                    generate_card_ui(v, ret)
                end
            end

            return ret
        end
    end

    -- Save curses
    local save_run_ref = save_run
    function save_run()

        if G.F_NO_SAVING ~= true then
            local curses = {}
            for k, v in ipairs(G.GAME.curses) do
                if (type(v) == "table") and v.is and v:is(Curse) then 
                    local curseSer = v:save()
                    if curseSer then curses[k] = curseSer end
                end
            end
        
            G.GAME.saved_curses = curses
        end
        
        save_run_ref()
    end

    -- Manage usage of cursed consumables
    local card_use_consumeable_ref = Card.use_consumeable
    function Card.use_consumeable(self, area, copier)
        
        card_use_consumeable_ref(self, area, copier)

        -- Create curse if needed
        if self.config.center.config.nb_curse then
            for i = 1, self.config.center.config.nb_curse, 1
            do
                G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                    play_sound('timpani')
                    self:juice_up(0.3, 0.5)
                    create_curse()
                    return true end }))
                G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                    attention_text({
                        text = 'Cursed',
                        scale = 1.3, 
                        hold = 1.4,
                        major = self,
                        backdrop_colour = G.C.SECONDARY_SET.Tarot,
                        align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK) and 'tm' or 'cm',
                        offset = {x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK) and -0.2 or 0},
                        silent = true
                        })
                        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.06*G.SETTINGS.GAMESPEED, blockable = false, blocking = false, func = function()
                            play_sound('tarot2', 0.76, 0.4);return true end}))
                        play_sound('tarot2', 1, 0.4)
                        self:juice_up(0.3, 0.5)
                return true end }))
            end
        end
    end

    ----- Curses effects -----

    -- Manage curses debuff
    function custom_debuff_card(curse, card)

        if card and curse then
            if curse.name == 'The Goad' and card:is_suit('Spades', true) and is_curse_triggered(curse) then
                card.params.debuff_by_curse = true
                card:set_debuff(true)
                return
            end
            if curse.name == 'The Plant' and card:is_face(true) and is_curse_triggered(curse) then
                card.params.debuff_by_curse = true
                card:set_debuff(true)
                return
            end
            if curse.name == 'The Head' and card:is_suit('Hearts', true) and is_curse_triggered(curse) then
                card.params.debuff_by_curse = true
                card:set_debuff(true)
                return
            end
            if curse.name == 'The Club' and card:is_suit('Clubs', true) and is_curse_triggered(curse) then
                card.params.debuff_by_curse = true
                card:set_debuff(true)
                return
            end
            if curse.name == 'The Window' and card:is_suit('Diamonds', true) and is_curse_triggered(curse) then
                card.params.debuff_by_curse = true
                card:set_debuff(true)
                return
            end
            if curse.name == 'The Pillar' and card.ability.played_this_ante and is_curse_triggered(curse) then
                card.params.debuff_by_curse = true
                card:set_debuff(true)
                return
            end
        end
    end

    ---------- state_events ----------

    -- Manage curses
    local G_FUNCS_draw_from_deck_to_hand_ref = G.FUNCS.draw_from_deck_to_hand
    function G.FUNCS.draw_from_deck_to_hand(e)

        local _e = e
        if (G.GAME.curses) then
            for k, v in pairs(G.GAME.curses) do
                if v.config.type == 'curse' then
                    if v.name == "The Serpent" and not v.triggered then
                        if not (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK) then
                            if not v.triggered and (G.GAME.current_round.hands_played > 0 or G.GAME.current_round.discards_used > 0) then
                                v.triggered = true
                                _e = math.min(#G.deck.cards, v.config.extra)
                                v:juice_up(0.3, 0.2)
                                play_sound('tarot2', 0.76, 0.4)
                            end
                        end
                    end
                end
            end
        end

        G_FUNCS_draw_from_deck_to_hand_ref(_e)

        if (G.GAME.curses) then
            for k, v in pairs(G.GAME.curses) do
                if v.config.type == 'curse' then
                    if v.name == "The Fish" then
                        v.triggered = false
                    end
                end
            end
        end
    end

    ---------- Blind ----------

    -- Manage curses
    local blind_debuff_hand_ref = Blind.debuff_hand
    function Blind.debuff_hand(self, cards, hand, handname, check)
        
        if (G.GAME.curses) then
            for k, v in pairs(G.GAME.curses) do
                if v.config.type == 'curse' then
                    if v.name == 'The Psychic' and #cards < 5 and not check then
                        v.triggered = true
                    end
                    if v.name == 'The Eye' then
                        if v.ability.hand[handname] and not check then
                            v.triggered = true
                        end
                        if not check then v.ability.hand[handname] = true end
                        v.ability.indicate_trig = v.ability.hand[handname]
                    end
                    if v.name == 'The Mouth' then
                        if v.ability.hand and v.ability.hand ~= handname then
                            v.triggered = true
                        end
                        if not check then v.ability.hand = handname end
                    end
                    if v.name == 'The Arm' then
                        if G.GAME.hands[handname].level > 1 then
                            if not check and is_curse_triggered(v) then
                                G.E_MANAGER:add_event(Event({
                                    trigger = 'after',
                                    delay =  0.7,
                                    func = (function() 
                                            level_up_hand(v, handname, nil, -1)
                                            v:juice_up(0.3, 0.2)
                                            play_sound('tarot2', 0.76, 0.4)
                                        return true
                                    end)
                                }))
                            end
                        end
                    end
                    if v.name == 'The Ox' then
                        if handname == G.GAME.current_round.most_played_poker_hand then
                            if not check then
                                G.E_MANAGER:add_event(Event({
                                    trigger = 'after',
                                    delay =  0.7,
                                    func = (function() 
                                            ease_dollars(-v.config.extra, true)
                                            v:juice_up(0.3, 0.2)
                                            play_sound('tarot2', 0.76, 0.4)
                                        return true
                                    end)
                                }))
                            end
                        end 
                    end
                end
            end
        end

        return blind_debuff_hand_ref(self, cards, hand, handname, check)
    end

    -- Manage curses
    local blind_press_play_ref = Blind.press_play
    function Blind.press_play(self)

        if (G.GAME.curses) then
            for k, v in pairs(G.GAME.curses) do
                if v.config.type == 'curse' then
                    if v.name == "The Hook" then
                        G.E_MANAGER:add_event(Event({ func = function()
                            local any_selected = nil
                            local _cards = {}
                            for kc, vc in ipairs(G.hand.cards) do
                                _cards[#_cards+1] = vc
                            end
                            for i = 1, v.config.extra do
                                if G.hand.cards[i] then 
                                    local selected_card, card_key = pseudorandom_element(_cards, pseudoseed('hook'))
                                    G.hand:add_to_highlighted(selected_card, true)
                                    table.remove(_cards, card_key)
                                    any_selected = true
                                    play_sound('card1', 1)
                                end
                            end
                            if any_selected then G.FUNCS.discard_cards_from_highlighted(nil, true) end
                            v:juice_up(0.3, 0.2)
                            play_sound('tarot2', 0.76, 0.4)
                        return true end })) 
                        delay(0.7)
                    end
                    if v.name == "The Tooth" then
                        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
                        for i = 1, #G.play.cards do
                            if is_curse_triggered(v) then
                                G.E_MANAGER:add_event(Event({func = function() 
                                    G.play.cards[i]:juice_up()
                                    v:juice_up(0.3, 0.2)
                                    return true end })) 
                                ease_dollars(-1)
                                delay(0.23)
                            end
                        end
                        return true end }))
                    end
                    if v.name == 'The Fish' then 
                        v.triggered = true
                    end
                end
            end
        end

        return blind_press_play_ref(self)
    end

    -- Manage curses
    local blind_set_blind_ref = Blind.set_blind
    function Blind.set_blind(self, blind, reset, silent)

        blind_set_blind_ref(self, blind, reset, silent)
        
        if (G.GAME.curses) then
            for k, v in pairs(G.GAME.curses) do
                -- Temp fix! For some reason, the animation of the last curse is removed at specific events. Force it back until the problem is solved. TODO
                if not G.ANIMATIONS[v.curse_sprite] then table.insert(G.ANIMATIONS, v.curse_sprite) end

                if (v.config.type == 'curse' or v.config.type == 'final_curse') and (not reset) and (not silent) then
                    if v.name == "The Wall" then
                        v.triggered = true
                        self.chips = math.floor(self.chips * v.config.extra)
                        self.chip_text = number_format(self.chips)
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay =  0.7,
                            func = (function() 
                                    v:juice_up(0.3, 0.2)
                                    play_sound('tarot2', 0.76, 0.4)
                                return true
                            end)
                        }))
                    end
                    if v.name == "Violet Vessel" then
                        v.triggered = true
                        self.chips = math.floor(self.chips * (v.config.extra^v.ability.exp))
                        self.chip_text = number_format(self.chips)
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay =  0.7,
                            func = (function() 
                                    v:juice_up(0.3, 0.2)
                                    play_sound('tarot2', 0.76, 0.4)
                                return true
                            end)
                        }))
                    end
                    if v.name == "The Water" then
                        v.triggered = true
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay =  0.7,
                            func = (function() 
                                    ease_discard(-v.config.extra)
                                    v:juice_up(0.3, 0.2)
                                    play_sound('tarot2', 0.76, 0.4)
                                return true
                            end)
                        }))
                    end
                    if v.name == "The Needle" and G.GAME.current_round.hands_left > 0 then
                        v.triggered = true
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay =  0.7,
                            func = (function() 
                                    ease_hands_played(-v.config.extra)
                                    v:juice_up(0.3, 0.2)
                                    play_sound('tarot2', 0.76, 0.4)
                                return true
                            end)
                        }))
                    end
                    if v.name == "The Manacle" and not v.triggered then
                        if G.GAME.current_round.hands_left > v.config.extra then
                            v.triggered = true
                            G.E_MANAGER:add_event(Event({
                                trigger = 'after',
                                delay =  0.7,
                                func = (function() 
                                        G.hand:change_size(-1)
                                        v:juice_up(0.3, 0.2)
                                        play_sound('tarot2', 0.76, 0.4)
                                    return true
                                end)
                            }))
                        end
                    end
                    if v.name == 'The Goad' or v.name == 'The Plant' or v.name == 'The Head' or v.name == 'The Club' or v.name == 'The Window' or v.name == 'The Pillar' then
                        v.triggered = true
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay =  0.7,
                            func = (function() 
                                    for _, cv in ipairs(G.playing_cards) do
                                        custom_debuff_card(v, cv)
                                    end
                                    v:juice_up(0.3, 0.2)
                                    play_sound('tarot2', 0.76, 0.4)
                                return true
                            end)
                        }))
                    end
                end
            end
        end
    end

    -- Manage curses
    local blind_stay_flipped_ref = Blind.stay_flipped
    function Blind.stay_flipped(self, area, card)
        
        if (G.GAME.curses) then
            for k, v in pairs(G.GAME.curses) do
                if v.config.type == 'curse' then
                    if area == G.hand then
                        if v.name == 'The Wheel' and is_curse_triggered(v) then
                            v:juice_up(0.3, 0.2)
                            play_sound('tarot2', 0.76, 0.4)
                            return true
                        end
                        if v.name == 'The House' and G.GAME.current_round.hands_played == 0 and G.GAME.current_round.discards_used == 0 and area == G.hand and is_curse_triggered(v) then
                            v:juice_up(0.3, 0.2)
                            play_sound('tarot2', 0.76, 0.4)
                            return true
                        end
                        if v.name == 'The Fish' and v.triggered and is_curse_triggered(v) then 
                            v:juice_up(0.3, 0.2)
                            play_sound('tarot2', 0.76, 0.4)
                            return true
                        end
                        if v.name == 'The Mark' and card:is_face(true) and is_curse_triggered(v) then
                            v:juice_up(0.3, 0.2)
                            play_sound('tarot2', 0.76, 0.4)
                            return true
                        end
                    end
                end
            end
        end
        return blind_stay_flipped_ref(self, area, card)
    end

    -- Manage curses
    local blind_modify_hand_ref = Blind.modify_hand
    function Blind.modify_hand(self, cards, poker_hands, text, mult, hand_chips)

        local _mult, _hand_chips, _modded = blind_modify_hand_ref(self, cards, poker_hands, text, mult, hand_chips)
        
        if (G.GAME.curses) then
            for k, v in pairs(G.GAME.curses) do
                if v.config.type == 'curse' then
                    if v.name == "The Flint" then
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay =  0.7,
                            func = (function() 
                                    v:juice_up(0.3, 0.2)
                                    play_sound('tarot2', 0.76, 0.4)
                                return true
                            end)
                        }))
                        _mult = math.max(math.floor(_mult*v.config.extra + 0.5), 1)
                        _hand_chips = math.max(math.floor(_hand_chips*v.config.extra + 0.5), 0)
                        _modded = true
                    end
                end
            end
        end
        return _mult, _hand_chips, _modded
    end

    -- Manage curses resets
    local blind_defeat_ref = Blind.defeat
    function Blind.defeat(self, silent)
        
        for k, v in pairs(G.playing_cards) do
            if v.params.debuff_by_curse then
                v.params.debuff_by_curse = nil
            end
        end

        blind_defeat_ref(self, silent)
        
        if (G.GAME.curses) then
            for k, v in pairs(G.GAME.curses) do
                if v.config.type == 'curse' then
                    if v.name == "The Manacle" and v.triggered then
                        G.hand:change_size(1)
                    end
                    if v.name == 'The Eye' then
                        v.ability.hand = {
                            ["Flush Five"] = false,
                            ["Flush House"] = false,
                            ["Five of a Kind"] = false,
                            ["Straight Flush"] = false,
                            ["Four of a Kind"] = false,
                            ["Full House"] = false,
                            ["Flush"] = false,
                            ["Straight"] = false,
                            ["Three of a Kind"] = false,
                            ["Two Pair"] = false,
                            ["Pair"] = false,
                            ["High Card"] = false,
                        }
                        v.ability.indicate_trig = false
                    end
                    if v.name == 'The Mouth' then
                        v.ability.hand = nil
                    end
                    v.triggered = false
                end
            end
        end
    end

    ---------- back ----------

    -- Manage curses
    local back_trigger_effect_ref = Back.trigger_effect
    function Back.trigger_effect(self, args)

        if args and args.context == 'final_scoring_step' then
            if (G.GAME.curses) then
                for k, v in pairs(G.GAME.curses) do
                    if v.config.type == 'curse' then
                        if (v.name == 'The Psychic' or v.name == 'The Eye' or v.name == 'The Mouth') and v.triggered then
                            args.mult = math.max(1, math.floor(args.mult * v.config.extra))
                            G.E_MANAGER:add_event(Event({
                                trigger = 'after',
                                delay =  0.7,
                                func = (function() 
                                        v:juice_up(0.3, 0.2)
                                        play_sound('tarot2', 0.76, 0.4)
                                    return true
                                end)
                            }))
                            update_hand_text({delay = 0}, {mult = args.mult, chips = args.chips})
                            v.triggered = false
                            delay(0.7)
                        end
                        if v.name == "The Manacle" and v.triggered then
                            if G.GAME.current_round.hands_left <= v.config.extra then
                                v.triggered = false
                                G.hand:change_size(1)
                            end
                        end
                    end
                end
            end
            -- Check for other effects
            local nu_chip, nu_mult = back_trigger_effect_ref(self, args)
            nu_mult = nu_mult or args.mult
            nu_chip = nu_chip or args.chips
            return nu_chip, nu_mult
        end
        
        return back_trigger_effect_ref(self, args)
    end

end

---------------------------
-------- Setup --------
---------------------------

function setup_curses()
    
    -- Curses
    G.P_CURSES = {
        cu_ox =              {name = 'The Ox',       set = 'Curse', discovered = true, min_ante = nil, order = 1, config = {type = 'curse', extra = 5}, pos = {x = 0,y = 2}},
        cu_hook =            {name = 'The Hook',     set = 'Curse', discovered = true, min_ante = nil, order = 2, config = {type = 'curse', extra = 1}, pos = {x = 0,y = 7}},
        cu_mouth =           {name = 'The Mouth',    set = 'Curse', discovered = true, min_ante = nil, order = 3, config = {type = 'curse', extra = 0.65}, pos = {x = 0,y = 18}},
        cu_fish =            {name = 'The Fish',     set = 'Curse', discovered = true, min_ante = nil, order = 4, config = {type = 'curse', chanceN = 2, chanceD = 5}, pos = {x = 0,y = 5}},
        cu_club =            {name = 'The Club',     set = 'Curse', discovered = true, min_ante = nil, order = 5, config = {type = 'curse', chanceN = 2, chanceD = 5}, pos = {x = 0,y = 4}},
        cu_manacle =         {name = 'The Manacle',  set = 'Curse', discovered = true, min_ante = nil, order = 6, config = {type = 'curse', extra = 1}, pos = {x = 0,y = 8}},
        cu_tooth =           {name = 'The Tooth',    set = 'Curse', discovered = true, min_ante = nil, order = 7, config = {type = 'curse', chanceN = 2, chanceD = 5}, pos = {x = 0,y = 22}},
        cu_wall =            {name = 'The Wall',     set = 'Curse', discovered = true, min_ante = nil, order = 8, config = {type = 'curse', extra = 1.4}, pos = {x = 0,y = 9}},
        cu_house =           {name = 'The House',    set = 'Curse', discovered = true, min_ante = nil, order = 9, config = {type = 'curse', chanceN = 2, chanceD = 3}, pos = {x = 0,y = 3}},
        cu_mark =            {name = 'The Mark',     set = 'Curse', discovered = true, min_ante = nil, order = 10, config = {type = 'curse', chanceN = 1, chanceD = 2}, pos = {x = 0,y = 23}},

        cu_wheel =           {name = 'The Wheel',    set = 'Curse', discovered = true, min_ante = nil, order = 11, config = {type = 'curse', chanceN = 1, chanceD = 9}, pos = {x = 0,y = 10}},
        cu_arm =             {name = 'The Arm',      set = 'Curse', discovered = true, min_ante = nil, order = 12, config = {type = 'curse', chanceN = 1, chanceD = 7}, pos = {x = 0,y = 11}},
        cu_psychic =         {name = 'The Psychic',  set = 'Curse', discovered = true, min_ante = nil, order = 13, config = {type = 'curse', extra = 0.6}, pos = {x = 0,y = 12}},
        cu_goad =            {name = 'The Goad',     set = 'Curse', discovered = true, min_ante = nil, order = 14, config = {type = 'curse', chanceN = 2, chanceD = 5}, pos = {x = 0,y = 13}},
        cu_water =           {name = 'The Water',    set = 'Curse', discovered = true, min_ante = nil, order = 15, config = {type = 'curse', extra = 1}, pos = {x = 0,y = 14}},
        cu_eye =             {name = 'The Eye',      set = 'Curse', discovered = true, min_ante = nil, order = 16, config = {type = 'curse', extra = 0.65}, pos = {x = 0,y = 17}},
        cu_plant =           {name = 'The Plant',    set = 'Curse', discovered = true, min_ante = nil, order = 17, config = {type = 'curse', chanceN = 2, chanceD = 5}, pos = {x = 0,y = 19}},
        cu_needle =          {name = 'The Needle',   set = 'Curse', discovered = true, min_ante = nil, order = 18, config = {type = 'curse', extra = 1}, pos = {x = 0,y = 20}},
        cu_head =            {name = 'The Head',     set = 'Curse', discovered = true, min_ante = nil, order = 19, config = {type = 'curse', chanceN = 2, chanceD = 5}, pos = {x = 0,y = 21}},
        cu_window =          {name = 'The Window',   set = 'Curse', discovered = true, min_ante = nil, order = 20, config = {type = 'curse', chanceN = 2, chanceD = 5}, pos = {x = 0,y = 6}},

        cu_serpent =         {name = 'The Serpent',  set = 'Curse', discovered = true, min_ante = nil, order = 21, config = {type = 'curse', extra = 2}, pos = {x = 0,y = 15}},
        cu_pillar =          {name = 'The Pillar',   set = 'Curse', discovered = true, min_ante = nil, order = 22, config = {type = 'curse', chanceN = 2, chanceD = 5}, pos = {x = 0,y = 16}},
        cu_flint =           {name = 'The Flint',    set = 'Curse', discovered = true, min_ante = nil, order = 23, config = {type = 'curse', extra = 0.8}, pos = {x = 0,y = 24}},
        
        cu_final_vessel =    {name = 'Violet Vessel',set = 'Curse', discovered = true, min_ante = nil, order = 24, config = {type = 'final_curse', extra = 1.5}, pos = {x=0, y=29}},
    }

    G.P_CENTER_POOLS.Curse = {}

    for k, v in pairs(G.P_CURSES) do
        v.key = k
        if not v.wip then 
            table.insert(G.P_CENTER_POOLS[v.set], v)
        end
    end

    table.sort(G.P_CENTER_POOLS["Curse"], function (a, b) return a.order < b.order end)

    setUpLocalizationCurses()

    G.localization.descriptions.Other.cursed = {
        name = "受诅",
        text = {
            "使用后",
            "随机降下",
            "一条{X:black,C:white}诅咒",
            "{C:attention}(x#1#)"
        }
    }
    G.localization.misc.labels['cursed'] = "受诅牌"
    G.BADGE_COL['cursed'] = G.C.BLACK
    
    -- Manage get_badge_colour
    get_badge_colour(foil)
    G.BADGE_COL['curse'] = G.C.BLACK

    G.localization.misc.labels['curse'] = "诅咒"

    override()
end

--Class
Curse = Object:extend()

--Class Methods
function Curse:init(_curse)
    self.key = _curse
    local proto = G.P_CURSES[_curse]
    self.config = copy_table(proto.config)
    self.pos = proto.pos
    self.name = proto.name
    self.tally = G.GAME.curse_tally or 0
    self.triggered = false
    G.curseid = G.curseid or 0
    self.ID = G.curseid
    G.curseid = G.curseid + 1
    self.ability = {}
    G.GAME.curse_tally = G.GAME.curse_tally and (G.GAME.curse_tally + 1) or 1
end

function Curse:save()
    return {
        key = self.key,
        tally = self.tally,
        triggered = self.triggered,
        ability = self.ability
    }
end

function Curse:load(curse_savetable)
    self.key = curse_savetable.key
    local proto = G.P_CURSES[self.key]
    self.config = copy_table(proto.config)
    self.pos = proto.pos
    self.name = proto.name
    self.tally = curse_savetable.tally
    self.ability = curse_savetable.ability
    self.triggered = curse_savetable.triggered
    G.GAME.curse_tally = math.max(self.tally, G.GAME.curse_tally) + 1

    -- Prevent having same boss and curse
    --G.GAME.banned_keys["bl"..string.sub(curse_savetable.key, 3, -1)] = true
end

function Curse:juice_up(_scale, _rot)
    if self.curse_sprite then self.curse_sprite:juice_up(_scale, _rot) end
end

function Curse:generate_UI(_size)
    _size = _size or 0.65

    local curse_sprite_tab = nil

    local curse_sprite = AnimatedSprite(0,0,_size*1,_size*1,G.ANIMATION_ATLAS["blind_chips"], self.pos or G.P_BLINDS.bl_small.pos)
    curse_sprite.T.scale = 1
    curse_sprite_tab = {n= G.UIT.C, config={align = "cm", ref_table = self, group = self.tally}, nodes={
        {n=G.UIT.O, config={w=_size*1,h=_size*1, colour = G.C.BLUE, object = curse_sprite, focus_with_object = true}},
    }}
    curse_sprite:define_draw_steps({
        {shader = 'dissolve', shadow_height = 0.05},
        {shader = 'dissolve'},
    })
    curse_sprite.float = true
    curse_sprite.states.hover.can = true
    curse_sprite.states.drag.can = false
    curse_sprite.states.collide.can = true
    curse_sprite.states.visible = true
    curse_sprite.config = {curse = self, force_focus = true}

    curse_sprite.hover = function(_self)
        if not G.CONTROLLER.dragging.target or G.CONTROLLER.using_touch then 
            if not _self.hovering and _self.states.visible then
                _self.hovering = true
                if _self == curse_sprite then
                    _self.hover_tilt = 3
                    _self:juice_up(0.05, 0.02)
                    play_sound('paper1', math.random()*0.1 + 0.55, 0.42)
                    play_sound('tarot2', math.random()*0.1 + 0.55, 0.09)
                end

                self:get_uibox_table(curse_sprite)
                _self.config.h_popup =  G.UIDEF.card_h_popup(_self)
                _self.config.h_popup_config ={align = 'cl', offset = {x=-0.1,y=0},parent = _self}
                Node.hover(_self)
                if _self.children.alert then 
                    _self.children.alert:remove()
                    _self.children.alert = nil
                    if self.key and G.P_CURSES[self.key] then G.P_CURSES[self.key].alerted = true end
                    G:save_progress()
                end
            end
        end
    end
    curse_sprite.stop_hover = function(_self) _self.hovering = false; Node.stop_hover(_self); _self.hover_tilt = 0 end

    curse_sprite:juice_up()
    self.curse_sprite = curse_sprite

    return curse_sprite_tab, curse_sprite
end

function Curse:get_uibox_table(curse_sprite)
    curse_sprite = curse_sprite or self.curse_sprite
    local name_to_check, loc_vars, badges = self.name, {}, {}
    if name_to_check == 'The Ox' then loc_vars = {self.config.extra, localize(G.GAME.current_round.most_played_poker_hand, 'poker_hands')}
    elseif name_to_check == 'The Hook' then loc_vars = {self.config.extra}
    elseif name_to_check == 'The Mouth' then loc_vars = {self.config.extra, (self.ability and self.ability.hand and '('..localize(self.ability.hand, 'poker_hands')..')') or ""}
    elseif name_to_check == 'The Fish' then loc_vars = {self.config.chanceN, self.config.chanceD}
    elseif name_to_check == 'The Club' then loc_vars = {self.config.chanceN, self.config.chanceD}
    elseif name_to_check == 'The Manacle' then loc_vars = {self.config.extra}
    elseif name_to_check == 'The Tooth' then loc_vars = {self.config.chanceN, self.config.chanceD}
    elseif name_to_check == 'The Wall' then loc_vars = {math.floor(self.config.extra * 100 - 100)}
    elseif name_to_check == 'The House' then loc_vars = {self.config.chanceN, self.config.chanceD}
    elseif name_to_check == 'The Mark' then loc_vars = {self.config.chanceN, self.config.chanceD}
    elseif name_to_check == 'The Wheel' then loc_vars = {self.config.chanceN, self.config.chanceD}
    elseif name_to_check == 'The Arm' then loc_vars = {self.config.chanceN, self.config.chanceD}
    elseif name_to_check == 'The Psychic' then loc_vars = {self.config.extra}
    elseif name_to_check == 'The Goad' then loc_vars = {self.config.chanceN, self.config.chanceD}
    elseif name_to_check == 'The Water' then loc_vars = {self.config.extra}
    elseif name_to_check == 'The Eye' then loc_vars = {self.config.extra, (self.ability and self.ability.indicate_trig and "(Active)") or "(Inactive)"}
    elseif name_to_check == 'The Plant' then loc_vars = {self.config.chanceN, self.config.chanceD}
    elseif name_to_check == 'The Needle' then loc_vars = {self.config.extra}
    elseif name_to_check == 'The Head' then loc_vars = {self.config.chanceN, self.config.chanceD}
    elseif name_to_check == 'The Window' then loc_vars = {self.config.chanceN, self.config.chanceD}
    elseif name_to_check == 'The Serpent' then loc_vars = {self.config.extra}
    elseif name_to_check == 'The Pillar' then loc_vars = {self.config.chanceN, self.config.chanceD}
    elseif name_to_check == 'The Flint' then loc_vars = {math.floor(100 - self.config.extra * 100)}
    elseif name_to_check == 'Violet Vessel' then loc_vars = {math.floor((self.config.extra^(self.ability.exp or 1)) * 100 - 100), (self.ability.exp or 1)}
    end
    curse_sprite.ability_UIBox_table = generate_card_ui(G.P_CURSES[self.key], nil, loc_vars, 'curse', badges)
    return curse_sprite
end

function Curse:remove_from_game()
    local curse_key = nil
    for k, v in pairs(G.GAME.curses) do
        if v == self then curse_key = k end
    end
    table.remove(G.GAME.curses, curse_key)
end

function Curse:remove()
    self:remove_from_game()
    local HUD_curse_key = nil
    for k, v in pairs(G.HUD_curses) do
        if v == self.HUD_curse then HUD_curse_key = k end
    end

    if HUD_curse_key then 
        if G.HUD_curses and G.HUD_curses[HUD_curse_key+1] then
            if HUD_curse_key == 1 then
                G.HUD_curses[HUD_curse_key+1]:set_alignment({type = 'bri',
                offset = {x=0.7,y=0},
                xy_bond = 'Weak',
                major = G.ROOM_ATTACH})
            else
                G.HUD_curses[HUD_curse_key+1]:set_role({
                xy_bond = 'Weak',
                major = G.HUD_curses[HUD_curse_key-1]})
            end
        end
        table.remove(G.HUD_curses, HUD_curse_key)
    end

    self.HUD_curse:remove()
end

function add_curse(_curse)
    G.HUD_curses = G.HUD_curses or {}
    local curse_sprite_ui = _curse:generate_UI()
    G.HUD_curses[#G.HUD_curses+1] = UIBox{
        definition = {n=G.UIT.ROOT, config={align = "cm",padding = - 0.12, colour = G.C.CLEAR}, nodes={
          curse_sprite_ui
        }},
        config = {
          align = G.HUD_curses[1] and 'tm' or 'bri',
          offset = G.HUD_curses[1] and {x=0,y=0} or {x=1.27,y=-0.5},
          major = G.HUD_curses[1] and G.HUD_curses[#G.HUD_curses] or G.ROOM_ATTACH}
    }
    
    G.GAME.curses[#G.GAME.curses+1] = _curse
    _curse.HUD_curse = G.HUD_curses[#G.HUD_curses]
end

function create_curse()
    
    -- Check if we already pulled the final curse
    if G.GAME.final_curse then
        -- Increase its exp
        for k, v in pairs(G.GAME.curses) do
            if v.config.type == 'final_curse' then
                v.ability.exp = v.ability.exp + 1
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay =  0.7,
                    func = (function() 
                            v:juice_up(0.3, 0.2)
                            play_sound('tarot2', 0.76, 0.4)
                        return true
                    end)
                }))
                break
            end
        end
    else
        -- Create curse
        local _pool, _pool_key = get_current_pool('Curse')
        local _curse = pseudorandom_element(_pool, pseudoseed(_pool_key))
        local it = 1
        while _curse == 'UNAVAILABLE' do
            it = it + 1
            _curse = pseudorandom_element(_pool, pseudoseed(_pool_key..'_resample'..it))
        end

        local new_curse = Curse(_curse)

        -- Check is this is a final curse or a regular curse
        if new_curse.config.type == 'final_curse' then
            G.GAME.final_curse = true
            new_curse.ability.exp = 1
        end
        -- Add curse
        add_curse(new_curse)
    
        -- Prevent having same boss and curse
        --G.GAME.banned_keys["bl"..string.sub(_curse, 3, -1)] = true
    
        if new_curse.name == 'The Eye' then
            new_curse.ability.hand = {
                ["Flush Five"] = false,
                ["Flush House"] = false,
                ["Five of a Kind"] = false,
                ["Straight Flush"] = false,
                ["Four of a Kind"] = false,
                ["Full House"] = false,
                ["Flush"] = false,
                ["Straight"] = false,
                ["Three of a Kind"] = false,
                ["Two Pair"] = false,
                ["Pair"] = false,
                ["High Card"] = false,
            }
            new_curse.ability.indicate_trig = false
        end
    end
end

function is_curse_triggered(curse)

    if curse and curse.config and curse.config.chanceN and curse.config.chanceD then
        return pseudorandom(pseudoseed('cu'..curse.name..G.GAME.round_resets.ante)) < (curse.config.chanceN / curse.config.chanceD)
    else
        return false
    end
end

-- Display in collection
local function create_UIBox_your_collection_curses()
  local curse_matrix = {
    {},{},{},{},
  }
  local curse_tab = {}
  for k, v in pairs(G.P_CURSES) do
    curse_tab[#curse_tab+1] = v
  end

  table.sort(curse_tab, function (a, b) return a.order < b.order end)

  for k, v in ipairs(curse_tab) do
    local temp_curse = Curse(v.key)
    local temp_curse_ui, temp_curse_sprite = temp_curse:generate_UI()
    curse_matrix[math.ceil((k-1)/6+0.001)][1+((k-1)%6)] = {n=G.UIT.C, config={align = "cm", padding = 0.1}, nodes={
      temp_curse_ui,
    }}
  end

  local t = create_UIBox_generic_options({ back_func = 'your_collection', contents = {
    {n=G.UIT.C, config={align = "cm", r = 0.1, colour = G.C.BLACK, padding = 0.1, emboss = 0.05}, nodes={
      {n=G.UIT.C, config={align = "cm"}, nodes={
        {n=G.UIT.R, config={align = "cm"}, nodes={
          {n=G.UIT.R, config={align = "cm"}, nodes=curse_matrix[1]},
          {n=G.UIT.R, config={align = "cm"}, nodes=curse_matrix[2]},
          {n=G.UIT.R, config={align = "cm"}, nodes=curse_matrix[3]},
          {n=G.UIT.R, config={align = "cm"}, nodes=curse_matrix[4]},
        }}
      }} 
    }}  
  }})
  return t
end

G.FUNCS.your_collection_curses = function(e)
  G.SETTINGS.paused = true
  G.FUNCS.overlay_menu{
    definition = create_UIBox_your_collection_curses(),
  }
end

-- Add Curse display
local create_UIBox_your_collection_ref = create_UIBox_your_collection
function create_UIBox_your_collection()

    -- Get the vanilla UI
    local t = create_UIBox_your_collection_ref()

    -- Insert a new tab
    table.insert(
        t.nodes[1].nodes[1].nodes[1].nodes[2].nodes, 2, 
        UIBox_button({button = 'your_collection_curses', label = {'诅咒'}, minw = 5, id = 'your_collection_curses'})
    )

    return t
end