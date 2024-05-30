--- STEAMODDED HEADER
--- MOD_NAME: Boss Jokers
--- MOD_ID: BossJokers
--- MOD_AUTHOR: [KilledByLava]
--- MOD_DESCRIPTION: Adds Boss Jokers

----------------------------------------------
------------MOD CODE -------------------------

local jokers = {
    theclub = {
       name = "Club Joker",
       config = {extra = 1},
       pos = { x = 0, y = 0 },
       rarity= 2,
       cost = 6,
       blueprint_compat=true,
       eternal_compat=true,
       unlocked=true,
       discovered=true,
       effect= 'Suit repetition',
       atlas=nil,
       soul_pos=nil,

       calculate = function(self,context)
        if context.repetition then
            if context.cardarea == G.play then
                if context.other_card:is_suit("Clubs") then
                        return {
                            message = localize('k_again_ex'),
                            repetitions = 1,
                            card = self
                            }
                end
            elseif context.cardarea == G.hand then
                if (next(context.card_effects[1]) or #context.card_effects > 1) then
                    if context.other_card:is_suit("Clubs") then
                        return {
                            message = localize('k_again_ex'),
                            repetitions = 1,
                            card = self
                        }
                    end
                end
            end
        end
        if context.setting_blind and not self.getting_sliced then
            if G.GAME.blind and ((not G.GAME.blind.disabled) and (G.GAME.blind.name == 'The Club')) then
                card_eval_status_text(context.blueprint_card or self, 'extra', nil, nil, nil, {message = localize('ph_boss_disabled')})
                G.GAME.blind:disable()
            end
        end
        end,

       loc_def = function(self)
       end
   },

   thewindow = {
    name = "Window Joker",
    config = {extra = 1},
    pos = { x = 0, y = 0 },
    rarity= 2,
    cost = 6,
    blueprint_compat=true,
    eternal_compat=true,
    unlocked=true,
    discovered=true,
    effect= 'Suit repetition',
    atlas=nil,
    soul_pos=nil,

    calculate = function(self,context)
     if context.repetition then
         if context.cardarea == G.play then
             if context.other_card:is_suit("Diamonds") then
                     return {
                         message = localize('k_again_ex'),
                         repetitions = 1,
                         card = self
                         }
             end
         elseif context.cardarea == G.hand then
             if (next(context.card_effects[1]) or #context.card_effects > 1) then
                 if context.other_card:is_suit("Diamonds") then
                     return {
                         message = localize('k_again_ex'),
                         repetitions = 1,
                         card = self
                     }
                 end
             end
         end
     end
     if context.setting_blind and not self.getting_sliced then
        if G.GAME.blind and ((not G.GAME.blind.disabled) and (G.GAME.blind.name == 'The Window')) then
            card_eval_status_text(context.blueprint_card or self, 'extra', nil, nil, nil, {message = localize('ph_boss_disabled')})
            G.GAME.blind:disable()
        end
    end
     end,

    loc_def = function(self)
    end
    },

    thegoad = {
        name = "Goad Joker",
        config = {extra = 1},
        pos = { x = 0, y = 0 },
        rarity= 2,
        cost = 6,
        blueprint_compat=true,
        eternal_compat=true,
        unlocked=true,
        discovered=true,
        effect= 'Suit repetition',
        atlas=nil,
        soul_pos=nil,
 
        calculate = function(self,context)
         if context.repetition then
             if context.cardarea == G.play then
                 if context.other_card:is_suit("Spades") then
                         return {
                             message = localize('k_again_ex'),
                             repetitions = 1,
                             card = self
                             }
                 end
             elseif context.cardarea == G.hand then
                 if (next(context.card_effects[1]) or #context.card_effects > 1) then
                     if context.other_card:is_suit("Spades") then
                         return {
                             message = localize('k_again_ex'),
                             repetitions = 1,
                             card = self
                         }
                     end
                 end
             end
         end
         if context.setting_blind and not self.getting_sliced then
            if G.GAME.blind and ((not G.GAME.blind.disabled) and (G.GAME.blind.name == 'The Goad')) then
                card_eval_status_text(context.blueprint_card or self, 'extra', nil, nil, nil, {message = localize('ph_boss_disabled')})
                G.GAME.blind:disable()
            end
        end
         end,
 
        loc_def = function(self)
        end
    },

    thehead = {
        name = "Head Joker",
        config = {extra = 1},
        pos = { x = 0, y = 0 },
        rarity= 2,
        cost = 6,
        blueprint_compat=true,
        eternal_compat=true,
        unlocked=true,
        discovered=true,
        effect= 'Suit repetition',
        atlas=nil,
        soul_pos=nil,
 
        calculate = function(self,context)
         if context.repetition then
             if context.cardarea == G.play then
                 if context.other_card:is_suit("Hearts") then
                         return {
                             message = localize('k_again_ex'),
                             repetitions = 1,
                             card = self
                             }
                 end
             elseif context.cardarea == G.hand then
                 if (next(context.card_effects[1]) or #context.card_effects > 1) then
                     if context.other_card:is_suit("Hearts") then
                         return {
                             message = localize('k_again_ex'),
                             repetitions = 1,
                             card = self
                         }
                     end
                 end
             end
         end
         if context.setting_blind and not self.getting_sliced then
            if G.GAME.blind and ((not G.GAME.blind.disabled) and (G.GAME.blind.name == 'The Head')) then
                card_eval_status_text(context.blueprint_card or self, 'extra', nil, nil, nil, {message = localize('ph_boss_disabled')})
                G.GAME.blind:disable()
            end
        end
         end,
 
        loc_def = function(self)
        end
    },

    theplant = {
        name = "Plant Joker",
        config = {extra = 1},
        pos = { x = 0, y = 0 },
        rarity= 3,
        cost = 8,
        blueprint_compat=true,
        eternal_compat=true,
        unlocked=true,
        discovered=true,
        effect= 'Suit repetition',
        atlas=nil,
        soul_pos=nil,
 
        calculate = function(self,context)
         if context.repetition then
             if context.cardarea == G.play then
                 if context.other_card:is_face() then
                         return {
                             message = localize('k_again_ex'),
                             repetitions = 1,
                             card = self
                             }
                 end
             elseif context.cardarea == G.hand then
                 if (next(context.card_effects[1]) or #context.card_effects > 1) then
                     if context.other_card:is_face() then
                         return {
                             message = localize('k_again_ex'),
                             repetitions = 1,
                             card = self
                         }
                     end
                 end
             end
         end
         if context.setting_blind and not self.getting_sliced then
            if G.GAME.blind and ((not G.GAME.blind.disabled) and (G.GAME.blind.name == 'The Plant')) then
                card_eval_status_text(context.blueprint_card or self, 'extra', nil, nil, nil, {message = localize('ph_boss_disabled')})
                G.GAME.blind:disable()
            end
        end
         end,
 
        loc_def = function(self)
        end
    },

   theneedle = {
    name = "Needle Joker",
    config = {extra = 1},
    pos = { x = 0, y = 0 },
    rarity= 2,
    cost = 4,
    blueprint_compat=false,
    eternal_compat=true,
    unlocked=true,
    discovered=true,
    effect= 'Hands',
    atlas=nil,
    soul_pos=nil,

    calculate = function(self,context)
        if context.setting_blind and not self.getting_sliced then
            ease_hands_played(self.ability.extra)
        end
        if context.setting_blind and not self.getting_sliced then
            if G.GAME.blind and ((not G.GAME.blind.disabled) and (G.GAME.blind.name == 'The Needle')) then
                card_eval_status_text(context.blueprint_card or self, 'extra', nil, nil, nil, {message = localize('ph_boss_disabled')})
                G.GAME.blind:disable()
            end
        end
     end,

    loc_def = function(self)
    end
    },

    thewater = {
        name = "Water Joker",
        config = {extra = 3},
        pos = { x = 0, y = 0 },
        rarity= 2,
        cost = 5,
        blueprint_compat=false,
        eternal_compat=false,
        unlocked=true,
        discovered=true,
        effect=nil,
        atlas=nil,
        soul_pos=nil,
    
        calculate = function(self,context)
            if context.selling_self then
                ease_discard(self.ability.extra)
            end
            if context.setting_blind and not self.getting_sliced then
                if G.GAME.blind and ((not G.GAME.blind.disabled) and (G.GAME.blind.name == 'The Water')) then
                    card_eval_status_text(context.blueprint_card or self, 'extra', nil, nil, nil, {message = localize('ph_boss_disabled')})
                    G.GAME.blind:disable()
                end
            end
         end,
    
        loc_def = function(self)
        end
    },

    thetooth = {
        name = "Tooth Joker",
        config = {extra = 1},
        pos = { x = 0, y = 0 },
        rarity= 3,
        cost = 12,
        blueprint_compat=true,
        eternal_compat=true,
        unlocked=true,
        discovered=true,
        effect=nil,
        atlas=nil,
        soul_pos=nil,
    
        calculate = function(self,context)
            if context.individual then
                if context.cardarea == G.play then
                    return {
                        message = localize('$')..self.ability.extra,
                        colour = G.C.MONEY,
                        card = self,
                        dollars = self.ability.extra
                    }
                end
            end
            if context.setting_blind and not self.getting_sliced then
                if G.GAME.blind and ((not G.GAME.blind.disabled) and (G.GAME.blind.name == 'The Tooth')) then
                    card_eval_status_text(context.blueprint_card or self, 'extra', nil, nil, nil, {message = localize('ph_boss_disabled')})
                    G.GAME.blind:disable()
                end
            end
         end,

        loc_def = function(self)
        end
    },

    thearm = {
        name = "Arm Joker",
        config = {extra = 3},
        pos = { x = 0, y = 0 },
        rarity= 2,
        cost = 5,
        blueprint_compat=false,
        eternal_compat=false,
        unlocked=true,
        discovered=true,
        effect=nil,
        atlas=nil,
        soul_pos=nil,
    
        calculate = function(self,context)
            if context.selling_self then
                local lochand = nil
                local loctally = 0
                for k, v in ipairs(G.handlist) do
                    if G.GAME.hands[v].visible and G.GAME.hands[v].played > loctally then
                        lochand = v
                        loctally = G.GAME.hands[v].played
                    end
                end
                level_up_hand(self, lochand, instant, 3)
                update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
            end
            if context.setting_blind and not self.getting_sliced then
                if G.GAME.blind and ((not G.GAME.blind.disabled) and (G.GAME.blind.name == 'The Arm')) then
                    card_eval_status_text(context.blueprint_card or self, 'extra', nil, nil, nil, {message = localize('ph_boss_disabled')})
                    G.GAME.blind:disable()
                end
            end
         end,
    
        loc_def = function(self)
        end
    },

    thewall = {
        name = "Wall Joker",
        config = {extra = 3},
        pos = { x = 0, y = 0 },
        rarity= 2,
        cost = 5,
        blueprint_compat=false,
        eternal_compat=false,
        unlocked=true,
        discovered=true,
        effect=nil,
        atlas=nil,
        soul_pos=nil,

        calculate = function(self,context)
            if context.selling_self then
                    G.GAME.blind.chips = math.floor(G.GAME.blind.chips * 0.5) 
                    G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                    
                    local chips_UI = G.hand_text_area.blind_chips
                    G.FUNCS.blind_chip_UI_scale(G.hand_text_area.blind_chips)
                    G.HUD_blind:recalculate() 
            end
            if context.setting_blind and not self.getting_sliced then
                if G.GAME.blind and ((not G.GAME.blind.disabled) and (G.GAME.blind.name == 'The Wall')) then
                    card_eval_status_text(context.blueprint_card or self, 'extra', nil, nil, nil, {message = localize('ph_boss_disabled')})
                    G.GAME.blind:disable()
                end
            end
         end,
    
        loc_def = function(self)
        end
    },

    theox = {
        name = "Ox Joker",
        config = {max = 5},
        pos = { x = 0, y = 0 },
        rarity= 3,
        cost = 10,
        blueprint_compat=true,
        eternal_compat=true,
        unlocked=true,
        discovered=true,
        effect=nil,
        atlas=nil,
        soul_pos=nil,
    
        calculate = function(self,context)
            if context.cardarea == G.jokers then
                if context.before then
                    if G.GAME.hands[context.scoring_name].played > 5 then
                        return {
                            message = localize('$')..5,
                            ease_dollars(5),
                            colour = G.C.MONEY,
                            card = self
                        }
                    else
                        return {
                            message = localize('$')..G.GAME.hands[context.scoring_name].played,
                            ease_dollars(G.GAME.hands[context.scoring_name].played),
                            colour = G.C.MONEY,
                            card = self
                        }
                    end
                end
            end
            if context.setting_blind and not self.getting_sliced then
                if G.GAME.blind and ((not G.GAME.blind.disabled) and (G.GAME.blind.name == 'The Ox')) then
                    card_eval_status_text(context.blueprint_card or self, 'extra', nil, nil, nil, {message = localize('ph_boss_disabled')})
                    G.GAME.blind:disable()
                end
            end
         end,
    
        loc_def = function(self)
        end
    },

    theflint = {
        name = "Flint Joker",
        config = {extra = {Xmult = 1.2}},
        pos = { x = 0, y = 0 },
        rarity= 3,
        cost = 8,
        blueprint_compat=true,
        eternal_compat=true,
        unlocked=true,
        discovered=true,
        effect=nil,
        atlas=nil,
        soul_pos=nil,

        calculate = function(self,context)
            if context.individual and context.cardarea == G.play and (context.other_card:get_id() == 2 or context.other_card:get_id() == 3 or context.other_card:get_id() == 4 or context.other_card:get_id() == 5 or context.other_card:get_id() == 6  or context.other_card:get_id() == 7 or context.other_card:get_id() == 8 or context.other_card:get_id() == 9 or context.other_card:get_id() == 10 or context.other_card:get_id() == 11 or context.other_card:get_id() == 12 or context.other_card:get_id() == 13 or context.other_card:get_id() == 14) then
                return {
                    message = localize {
                        type = 'variable',
                        key = 'a_xmult',
                        vars = { self.ability.extra.Xmult }
                    },
                    x_mult = self.ability.extra.Xmult,
                    card = self
                }
            end
            if context.setting_blind and not self.getting_sliced then
                if G.GAME.blind and ((not G.GAME.blind.disabled) and (G.GAME.blind.name == 'The Flint')) then
                    card_eval_status_text(context.blueprint_card or self, 'extra', nil, nil, nil, {message = localize('ph_boss_disabled')})
                    G.GAME.blind:disable()
                end
            end
         end,
    
        loc_def = function(self)
        end
    },

    thepsychic = {
        name = "Psychic Joker",
        config = {extra = {size = 4, xmult = 2}},
        pos = { x = 0, y = 0 },
        rarity= 3,
        cost = 8,
        blueprint_compat=true,
        eternal_compat=true,
        unlocked=true,
        discovered=true,
        effect=nil,
        atlas=nil,
        soul_pos=nil,
    
        calculate = function(self,context)
            if context.cardarea == G.jokers and not context.before and not context.after then
                if #G.play.cards <= self.ability.extra.size then
                    return {
                        message = localize{type='variable',key='a_xmult',vars={self.ability.extra.xmult}},
                        Xmult_mod = self.ability.extra.xmult
                    }
                end
            end
            if context.setting_blind and not self.getting_sliced then
                if G.GAME.blind and ((not G.GAME.blind.disabled) and (G.GAME.blind.name == 'The Psychic')) then
                    card_eval_status_text(context.blueprint_card or self, 'extra', nil, nil, nil, {message = localize('ph_boss_disabled')})
                    G.GAME.blind:disable()
                end
            end
         end,
    
        loc_def = function(self)
        end
    },

    thehook = {
        name = "Hook Joker",
        config = {extra = 1},
        pos = { x = 0, y = 0 },
        rarity= 3,
        cost = 8,
        blueprint_compat=false,
        eternal_compat=true,
        unlocked=true,
        discovered=true,
        effect=nil,
        atlas=nil,
        soul_pos=nil,
    
        set_ability = function (self, center, initial, delay_sprites)
            self.ability.extra = G.GAME.current_round.hands_played + 1
        end,

        calculate = function(self,context)
            if context.setting_blind and not self.getting_sliced and not context.blueprint then
                self.ability.extra = 1
            end
            if context.setting_blind and not self.getting_sliced then
                if G.GAME.blind and ((not G.GAME.blind.disabled) and (G.GAME.blind.name == 'The Hook')) then
                    card_eval_status_text(context.blueprint_card or self, 'extra', nil, nil, nil, {message = localize('ph_boss_disabled')})
                    G.GAME.blind:disable()
                end
            end
        end,
    
        loc_def = function(self)
        end
    },

    themouth = {
        name = "Mouth Joker",
        config = {extra = {Xmult = 3}},
        pos = { x = 0, y = 0 },
        rarity= 3,
        cost = 8,
        blueprint_compat=true,
        eternal_compat=true,
        unlocked=true,
        discovered=true,
        effect=nil,
        atlas=nil,
        soul_pos=nil,
    
        calculate = function(self,context)
            if context.cardarea == G.jokers and not context.before and not context.after then
                if G.GAME.hands[context.scoring_name] and G.GAME.hands[context.scoring_name].played_this_round == 1 then
                    return {
                        message = localize{type='variable',key='a_xmult',vars={self.ability.extra.Xmult}},
                        Xmult_mod = self.ability.extra.Xmult,
                    }
                end
            end
            if context.setting_blind and not self.getting_sliced then
                if G.GAME.blind and ((not G.GAME.blind.disabled) and (G.GAME.blind.name == 'The Mouth')) then
                    card_eval_status_text(context.blueprint_card or self, 'extra', nil, nil, nil, {message = localize('ph_boss_disabled')})
                    G.GAME.blind:disable()
                end
            end
         end,
    
        loc_def = function(self)
        end
    },

    theeye = {
        name = "Eye Joker",
        config = {extra = {Xmult = 3}},
        pos = { x = 0, y = 0 },
        rarity= 2,
        cost = 7,
        blueprint_compat=true,
        eternal_compat=true,
        unlocked=true,
        discovered=true,
        effect=nil,
        atlas=nil,
        soul_pos=nil,
    
        calculate = function(self,context)
            if context.cardarea == G.jokers and context.before then
                if G.GAME.hands[context.scoring_name] and G.GAME.hands[context.scoring_name].played_this_round > 1 then
                    return {
                        card = self,
                        level_up = true,
                        message = localize('k_level_up_ex')
                    }
                end
            end
            if context.setting_blind and not self.getting_sliced then
                if G.GAME.blind and ((not G.GAME.blind.disabled) and (G.GAME.blind.name == 'The Eye')) then
                    card_eval_status_text(context.blueprint_card or self, 'extra', nil, nil, nil, {message = localize('ph_boss_disabled')})
                    G.GAME.blind:disable()
                end
            end
         end,
    
        loc_def = function(self)
        end
    },

    themanacle = {
        name = "Manacle Joker",
        config = {extra = {Xmult = 1}},
        pos = { x = 0, y = 0 },
        rarity= 3,
        cost = 8,
        blueprint_compat=true,
        eternal_compat=true,
        unlocked=true,
        discovered=true,
        effect=nil,
        atlas=nil,
        soul_pos=nil,
    
        set_ability = function (self, center, initial, delay_sprites)
            self.ability.extra.Xmult = 1 + 0.25*G.hand.config.card_limit
        end,
    
        calculate = function(self,context)
            if context.cardarea == G.jokers and not context.before and not context.after then
                self.ability.extra.Xmult = 1 + 0.25*G.hand.config.card_limit
                return {
                    message = localize{type='variable',key='a_xmult',vars={self.ability.extra.Xmult}},
                    Xmult_mod = self.ability.extra.Xmult,
                }
            end
            if context.setting_blind and not self.getting_sliced then
                self.ability.extra.Xmult = 1 + 0.25*G.hand.config.card_limit
                if G.GAME.blind and ((not G.GAME.blind.disabled) and (G.GAME.blind.name == 'The Manacle')) then
                    card_eval_status_text(context.blueprint_card or self, 'extra', nil, nil, nil, {message = localize('ph_boss_disabled')})
                    G.GAME.blind:disable()
                end
            end
         end,
    
        loc_def = function(self)
            return{self.ability.extra.Xmult}
        end
    },

    themark = {
        name = "Mark Joker",
        config = {extra = {odds = 6}},
        pos = { x = 0, y = 0 },
        rarity= 3,
        cost = 9,
        blueprint_compat=true,
        eternal_compat=true,
        unlocked=true,
        discovered=true,
        effect=nil,
        atlas=nil,
        soul_pos=nil,
 
        calculate = function(self,context)
            if context.individual and context.cardarea == G.hand then
                if context.other_card:is_face() and pseudorandom('mark') < G.GAME.probabilities.normal/self.ability.extra.odds then
                    if context.other_card.debuff then
                        return {
                            message = localize('k_debuffed'),
                            colour = G.C.RED,
                            card = self,
                        }
                    else
                        if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                            G.E_MANAGER:add_event(Event({
                                trigger = 'before',
                                delay = 0.0,
                                func = (function()
                                        local card = create_card('Tarot',G.consumeables, nil, nil, nil, nil, nil, 'mar')
                                        card:add_to_deck()
                                        G.consumeables:emplace(card)
                                        G.GAME.consumeable_buffer = 0
                                    return true
                                end)}))
                            card_eval_status_text(self, 'extra', nil, nil, nil, {message = localize('k_plus_tarot'), colour = G.C.PURPLE})
                        end
                    end
                end
            end
            if context.setting_blind and not self.getting_sliced then
                if G.GAME.blind and ((not G.GAME.blind.disabled) and (G.GAME.blind.name == 'The Mark')) then
                    card_eval_status_text(context.blueprint_card or self, 'extra', nil, nil, nil, {message = localize('ph_boss_disabled')})
                    G.GAME.blind:disable()
                end
            end
         end,
    
        loc_def = function(self)
            return{''..(G.GAME and G.GAME.probabilities.normal or 1), self.ability.extra.odds}
        end
    },

    thefish = {
        name = "Fish Joker",
        config = {extra = {odds = 10}},
        pos = { x = 0, y = 0 },
        rarity= 3,
        cost = 10,
        blueprint_compat=true,
        eternal_compat=true,
        unlocked=true,
        discovered=true,
        effect=nil,
        atlas=nil,
        soul_pos=nil,

        calculate = function(self,context)
            if context.cardarea == G.jokers and context.after then
                if pseudorandom('fish') < G.GAME.probabilities.normal/self.ability.extra.odds then
                    if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                            G.E_MANAGER:add_event(Event({
                            trigger = 'before',
                            delay = 0.0,
                            func = (function()
                            local card = create_card('Spectral',G.consumeables, nil, nil, nil, nil, nil, 'fis')
                                    card:add_to_deck()
                                    G.consumeables:emplace(card)
                                    G.GAME.consumeable_buffer = 0
                                    return true
                            end)}))
                        return {
                        message = localize('k_plus_spectral'),
                        colour = G.C.SECONDARY_SET.Spectral,
                        card = self
                        }
                    end
                end
            end
            if context.setting_blind and not self.getting_sliced then
                if G.GAME.blind and ((not G.GAME.blind.disabled) and (G.GAME.blind.name == 'The Fish')) then
                    card_eval_status_text(context.blueprint_card or self, 'extra', nil, nil, nil, {message = localize('ph_boss_disabled')})
                    G.GAME.blind:disable()
                end
            end
        end,
    
        loc_def = function(self)
            return{''..(G.GAME and G.GAME.probabilities.normal or 1), self.ability.extra.odds}
        end
    },

    thewheel = {
        name = "Wheel Joker",
        config = {extra = {odds = 7, draws = 1}},
        pos = { x = 0, y = 0 },
        rarity= 2,
        cost = 4,
        blueprint_compat=false,
        eternal_compat=true,
        unlocked=true,
        discovered=true,
        effect=nil,
        atlas=nil,
        soul_pos=nil,
    
        set_ability = function (self, center, initial, delay_sprites)
        end,

        calculate = function(self,context)
            if context.setting_blind and not self.getting_sliced then
                if G.GAME.blind and ((not G.GAME.blind.disabled) and (G.GAME.blind.name == 'The Wheel')) then
                    card_eval_status_text(context.blueprint_card or self, 'extra', nil, nil, nil, {message = localize('ph_boss_disabled')})
                    G.GAME.blind:disable()
                end
            end
        end,
    
        loc_def = function(self)
            return{''..(G.GAME and G.GAME.probabilities.normal or 1), self.ability.extra.odds}
        end
    },

    theserpent = {
        name = "Serpent Joker",
        config = {},
        pos = { x = 0, y = 0 },
        rarity= 2,
        cost = 5,
        blueprint_compat=false,
        eternal_compat=true,
        unlocked=true,
        discovered=true,
        effect=nil,
        atlas=nil,
        soul_pos=nil,
    
        set_ability = function (self, center, initial, delay_sprites)
        end,

        calculate = function(self,context)
            if context.setting_blind and not self.getting_sliced and not context.blueprint then
            end
            if context.setting_blind and not self.getting_sliced then
                if G.GAME.blind and ((not G.GAME.blind.disabled) and (G.GAME.blind.name == 'The Serpent')) then
                    card_eval_status_text(context.blueprint_card or self, 'extra', nil, nil, nil, {message = localize('ph_boss_disabled')})
                    G.GAME.blind:disable()
                end
            end
        end,

        loc_def = function(self)
        end
    },

    thepillar = {
        name = "Pillar Joker",
        config = {extra = {cards = { }}},
        pos = { x = 0, y = 0 },
        rarity= 2,
        cost = 6,
        blueprint_compat=true,
        eternal_compat=true,
        unlocked=true,
        discovered=true,
        effect=nil,
        atlas=nil,
        soul_pos=nil,
    
        set_ability = function (self, center, initial, delay_sprites)
        end,

        calculate = function(self,context)
            if context.individual and context.cardarea == G.play then
                table.insert(self.ability.extra.cards, context.other_card.base.id .. context.other_card.base.suit)
            end
            if context.repetition then
                if context.cardarea == G.play then
                    for i, v in pairs(self.ability.extra.cards) do
                        if v == context.other_card.base.id .. context.other_card.base.suit then
                            return {
                                message = localize('k_again_ex'),
                                repetitions = 1,
                                card = self
                                }
                        end
                    end
                elseif context.cardarea == G.hand then
                    if (next(context.card_effects[1]) or #context.card_effects > 1) then
                        for i, v in pairs(self.ability.extra.cards) do
                            if v == context.other_card.base.id .. context.other_card.base.suit then
                                return {
                                    message = localize('k_again_ex'),
                                    repetitions = 1,
                                    card = self
                                    }
                            end
                        end
                    end
                end
            end
            if context.end_of_round and not context.blueprint and G.GAME.blind.boss and not context.other_card then
                self.ability.extra.cards = { }
                return {
                    message = localize('k_reset'),
                    colour = G.C.RED
                }
            end
            if context.setting_blind and not self.getting_sliced then
                if G.GAME.blind and ((not G.GAME.blind.disabled) and (G.GAME.blind.name == 'The Pillar')) then
                    card_eval_status_text(context.blueprint_card or self, 'extra', nil, nil, nil, {message = localize('ph_boss_disabled')})
                    G.GAME.blind:disable()
                end
            end
        end,
    
        loc_def = function(self)
        end
    },

    thehouse = {
        name = "House Joker",
        config = {extra = {odds = 6}},
        pos = { x = 0, y = 0 },
        rarity= 3,
        cost = 10,
        blueprint_compat=true,
        eternal_compat=true,
        unlocked=true,
        discovered=true,
        effect=nil,
        atlas=nil,
        soul_pos=nil,
    
        set_ability = function (self, center, initial, delay_sprites)
        end,

        calculate = function(self,context)
            if context.setting_blind and not (context.blueprint_card or self).getting_sliced then
                if pseudorandom('house') < G.GAME.probabilities.normal/self.ability.extra.odds then
                    if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                            G.E_MANAGER:add_event(Event({
                            trigger = 'before',
                            delay = 0.0,
                            func = (function()
                            local card = create_card('Spectral',G.consumeables, nil, nil, nil, nil, nil, 'fis')
                                    card:add_to_deck()
                                    G.consumeables:emplace(card)
                                    G.GAME.consumeable_buffer = 0
                                    return true
                            end)}))
                        return {
                            card_eval_status_text(context.blueprint_card or self, 'extra', nil, nil, nil, {message = localize('k_plus_spectral'), colour = G.C.SECONDARY_SET.Spectral})
                        }
                    end
                end
            end
            if context.setting_blind and not self.getting_sliced then
                if G.GAME.blind and ((not G.GAME.blind.disabled) and (G.GAME.blind.name == 'The House')) then
                    card_eval_status_text(context.blueprint_card or self, 'extra', nil, nil, nil, {message = localize('ph_boss_disabled')})
                    G.GAME.blind:disable()
                end
            end
        end,
    
        loc_def = function(self)
            return{''..(G.GAME and G.GAME.probabilities.normal or 1), self.ability.extra.odds}
        end
    }
}

function SMODS.INIT.BossJokers()

    local jlocalization = {

        theclub = {
            name = "{C:red}棍棒{}小丑",
            text = {
                "重新触发",
                "所以{C:clubs}梅花{}牌"
            }
        },
        thewindow = {
            name = "{C:red}窗户{}小丑",
            text = {
                "重新触发",
                "所有{C:diamonds}方片{}牌"
            }
        },
        thegoad = {
            name = "{C:red}刺棒{}小丑",
            text = {
                "重新触发",
                "所有{C:spades}黑桃{}牌"
            }
        },
        thehead = {
            name = "{C:red}头{}小丑",
            text = {
                "重新触发",
                "所有{C:hearts}红心{}牌"
            }
        },
        theplant = {
            name = "{C:red}植物{}小丑",
            text = {
                "重新触发",
                "{C:attention}所有人头牌"
            }
        },
        theneedle = {
            name = "{C:red}针{}小丑",
            text = {
                "每回合{C:blue}+1{}出牌次数"
            }
        },
        thewater = {
            name = "{C:red}水{}小丑",
            text = {
                "售出本牌即可获得",
                "{C:red}+3{}弃牌次数"
            }
        },
        thetooth = {
            name = "{C:red}牙齿{}小丑",
            text = {
                "每张打出的牌",
                "在计分时均给予{C:money}$1"
            }
        },
        thearm = {
            name = "Arm Joker",
            text = {
                "Sell this card to",
                "{C:attention}upgrade{} the most played",
                "{C:attention}Poker hand{} by 3 levels"
            }
        },
        thewall = {
            name = "Wall Joker",
            text = {
                "Sell this card to",
                "{C:attention}Halve{} the blind"
            }
        },
        theox = {
            name = "{C:red}公牛{}小丑",
            text = {
                "出牌时，其{C:attention}牌型",
                "每已被打出一次",
                "给予{C:money}$1",
                "{C:inactive}（至多给予$5）"
            }
        },
        theflint = {
            name = "{C:red}燧石{}小丑",
            text = {
                "每张牌在计分时",
                "给予{X:mult,C:white} X1.2 {}倍率",
            }
        },
        thepsychic = {
            name = "Psychic Joker",
            text = {
                "{X:mult,C:white}X2{} mult if a hand",
                "has {C:attention}less{} than 5 cards"
            }
        },
        thehook = {
            name = "{C:red}钩子{}小丑",
            text = {
                "每次出牌后",
                "额外抽{C:attention}2{}张牌"
            }
        },
        themouth = {
            name = "Mouth Joker",
            text = {
                "{X:mult,C:white}X3{} mult unless this",
                "{C:attention}Poker hand{} has already",
                "been played this round"
            }
        },
        theeye = {
            name = "Eye Joker",
            text = {
                "Upgrade level of played",
                "{C:attention}Poker hand{} if it has",
                "already been played this round"
            }
        },
        themanacle = {
            name = "Manacle Joker",
            text = {
                "This Joker gains {X:mult,C:white}X0.25{} mult",
                "per hand size",
                "{C:inactive}(Currently at{} {X:mult,C:white}X#1#{} {C:inactive}mult){}"
            }
        },
        themark = {
            name = "Mark Joker",
            text = {
                "Each {C:attention}face{} card",
                "held in hand has",
                "a {C:green}#1# in #2#{} chance to",
                "create a {C:tarot}Tarot{} card",
                "{C:inactive}(Must have room){}"
            }
        },
        thefish = {
            name = "Fish Joker",
            text = {
                "{C:green}#1# in #2#{} chance to",
                "create a {C:spectral}Spectral{} card",
                "after each hand played",
                "{C:inactive}(Must have room){}"
            }
        },
        thewheel = {
            name = "{C:red}车轮{}小丑",
            text = {
                "有{C:green}#1#/#2#{}的几率",
                "额外抽一张牌"
            },
        },
        theserpent = {
            name = "Serpent Joker",
            text = {
                "After playing or discarding",
                "draw an extra card"
            },
        },
        thepillar = {
            name = "Pillar Joker",
            text = {
                "Retrigger all cards that",
                "{C:attention}have been played this ante{}",
            },
        },
        thehouse = {
            name = "House Joker",
            text = {
                "{C:green}#1# in #2#{} chance to",
                "create a {C:spectral}Spectral{} card",
                "when {C:attention}Blind{} is selected",
                "{C:inactive}(Must have room)"
            },
        }
    }

   init_localization()

   for k, v in pairs(jokers) do
       table.insert(jlocalization[k].text, "{C:inactive}（{C:dark_edition}Boss小丑{C:inactive}：对应Boss盲注{C:red}失效{C:inactive}）")
       local joker = SMODS.Joker:new(v.name, k, v.config, v.pos, jlocalization[k], v.rarity, v.cost, v.unlocked, v.discovered, v.blueprint_compat, v.eternal_compat, v.effect, v.atlas ,v.soul_pos)
       joker:register()
       
       if not v.atlas then
           SMODS.Sprite:new("j_"..k, SMODS.findModByID("BossJokers").path, "j_"..k..".png", 71, 95, "asset_atli"):register()
       end

       --add jokers calculate function:
       SMODS.Jokers[joker.slug].calculate=v.calculate
       --add jokers loc_def:
       SMODS.Jokers[joker.slug].loc_def=v.loc_def

       if(v.tooltip ~= nil) then
           SMODS.Jokers[joker.slug].tooltip=v.tooltip
       end
   end

local draw_from_deck_to_hand_2 = G.FUNCS.draw_from_deck_to_hand
   function G.FUNCS.draw_from_deck_to_hand(self, e)
       draw_from_deck_to_hand_2(self, e)
       for _, v in ipairs(G.jokers.cards) do
           if G.STATE == G.STATES.DRAW_TO_HAND then
               if v.config.center.key == "j_thehook" and G.GAME.current_round.hands_played == v.ability.extra then
                   for i = 1, 2 do draw_card(G.deck, G.hand, i*100/2, 'up', true) end
                   v.ability.extra = v.ability.extra + 1
               end
           end
        end
   end

local draw_from_deck_to_hand_3 = G.FUNCS.draw_from_deck_to_hand
   function G.FUNCS.draw_from_deck_to_hand(self,e)
        draw_from_deck_to_hand_3(self,e)
        for _, v in ipairs(G.jokers.cards) do
            if G.STATE == G.STATES.DRAW_TO_HAND then
                if v.config.center.key == "j_thewheel" and pseudorandom('drawj') < G.GAME.probabilities.normal/v.ability.extra.odds then
                    for i = 1, 1 do draw_card(G.deck, G.hand, i*100/2, 'up', true) end
                end
            end
        end
    end

local draw_from_deck_to_hand_3 = G.FUNCS.draw_from_deck_to_hand
    function G.FUNCS.draw_from_deck_to_hand(self,e)
         draw_from_deck_to_hand_3(self,e)
         for _, v in ipairs(G.jokers.cards) do
             if G.STATE == G.STATES.DRAW_TO_HAND then
                 if v.config.center.key == "j_theserpent" then
                     for i = 1, 1 do draw_card(G.deck, G.hand, i*100/2, 'up', true) end
                 end
             end
         end
     end

end

----------------------------------------------
------------MOD CODE END----------------------
