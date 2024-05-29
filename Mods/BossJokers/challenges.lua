--- STEAMODDED HEADER
--- MOD_NAME: Boss Jokers Challenges
--- MOD_ID: BossJokersChallenges
--- MOD_AUTHOR: [KilledByLava]
--- MOD_DESCRIPTION: Challenges for the Boss Jokers mod

----------------------------------------------
------------MOD CODE -------------------------

function SMODS.INIT.BossJokersChallenges()

    init_localization()

    G.localization.misc.challenge_names["c_rich_play_1"] = "Rich Play"
    G.localization.misc.challenge_names["c_startup_1"] = "Startup"
    G.localization.misc.challenge_names["c_spectral_merchant_1"] = "Spectral Merchant"

    table.insert(G.CHALLENGES,#G.CHALLENGES+1,
            {name = 'Rich Play',
                id = 'c_rich_play_1',
                rules = {
                    custom = {
                        {id = 'no_reward'},
                        {id = 'no_extra_hand_money'},
                        {id = 'no_interest'}
                    },
                    modifiers = {
                        {id = 'joker_slots', value = 3}
                    }
                },
                jokers = {
                    {id = 'j_theox', eternal = true, edition = 'negative'},
                    {id = 'j_thetooth', eternal = true, edition = 'negative'},        
                },
                consumeables = {
                },
                vouchers = {
                },
                deck = {
                type = 'Challenge Deck'
                },
                restrictions = {
                    banned_cards = {
                        {id = 'v_seed_money'},
                        {id = 'v_money_tree'},
                        {id = 'j_credit_card'},
                        {id = 'j_delayed_grat'},
                        {id = 'j_business'},
                        {id = 'j_egg'},
                        {id = 'j_faceless'},
                        {id = 'j_todo_list'},
                        {id = 'j_cloud_9'},
                        {id = 'j_rocket'},
                        {id = 'j_gift'},
                        {id = 'j_reserved_parking'},
                        {id = 'j_mail'},
                        {id = 'j_to_the_moon'},
                        {id = 'j_golden'},
                        {id = 'j_ticket'},
                        {id = 'j_rough_gem'},
                        {id = 'j_matador'},
                        {id = 'j_satellite'},
                        {id = 'c_temperance'},
                        {id = 'c_hermit'}
                    },
                    banned_tags = {
                        {id = 'tag_investment'},
                        {id = 'tag_skip'},
                        {id = 'tag_economy'},
                        {id = 'tag_handy'},
                        {id = 'tag_garbage'}
                    },
                    banned_other = {
                        {id = 'bl_tooth', type = 'blind'},
                        {id = 'bl_ox', type = 'blind'}
                    }
                }
            }
        )
    table.insert(G.CHALLENGES,#G.CHALLENGES+1,
            {
                name = "Startup",
                id = 'c_startup_1',
                rules = {
                    custom = {
                        {id = 'no_shop_planets'}
                    },
                    modifiers = {
                        {id = 'hands', value = 3},
                    }
                },
                jokers = {
                    {id = 'j_theeye', eternal = true},
                    {id = 'j_space', eternal = true, edition = 'negative'},
                    {id = 'j_thearm'},
                    {id = 'j_thearm'},
                },
                consumeables = {
                },
                vouchers = {
                },
                deck = {
                    type = 'Challenge Deck'
                },
                restrictions = {
                    banned_cards = {
                        {id = 'v_telescope'},
                        {id = 'v_observatory'},
                        {id = 'v_planet_merchant'},
                        {id = 'v_planet_tycoon'},
                        {id = 'j_constellation'},
                        {id = 'j_satellite'},
                        {id = 'j_astronomer'},
                        {id = 'c_high_priestess'},
                        {id = 'c_black_hole'},
                        {id = 'p_celestial_normal_2', ids = {
                            'p_celestial_normal_1','p_celestial_normal_2','p_celestial_normal_3','p_celestial_normal_4','p_celestial_jumbo_1','p_celestial_jumbo_2','p_celestial_mega_1','p_celestial_mega_2'
                        }}
                    },
                    banned_tags = {
                        {id = 'tag_meteor'},
                        {id = 'tag_orbital'}
                    },
                    banned_other = {
                        {id = 'bl_eye', type = 'blind'},
                    }
                }
            }
        )
    table.insert(G.CHALLENGES,#G.CHALLENGES+1,
        {
            name = "Spectral Merchant",
            id = 'c_spectral_merchant_1',
            rules = {
                custom = {
                    {id = 'shop_spectrals'},
                    {id = 'no_shop_tarots'}
                },
                modifiers = {
                    {id = 'discards', value = 1},
                    {id = 'consumable_slots', value = 6},
                }
            },
            jokers = {
                {id = 'j_thehouse', eternal = true},
                {id = 'j_thefish', eternal = true},
                {id = 'j_themark'},
            },
            consumeables = {
            },
            vouchers = {
                {id = 'v_blank'}
            },
            deck = {
                type = 'Challenge Deck',
                cards = {{s='D',r='2',g='Purple',},{s='D',r='3',g='Purple',},{s='D',r='4',g='Purple',},{s='D',r='5',g='Purple',},{s='D',r='6'},{s='D',r='7'},{s='D',r='8'},{s='D',r='9'},{s='D',r='T'},{s='D',r='J'},{s='D',r='Q'},{s='D',r='K'},{s='D',r='A'},
                {s='C',r='2',g='Purple',},{s='C',r='3',g='Purple',},{s='C',r='4',g='Purple',},{s='C',r='5',g='Purple',},{s='C',r='6'},{s='C',r='7'},{s='C',r='8'},{s='C',r='9'},{s='C',r='T'},{s='C',r='J'},{s='C',r='Q'},{s='C',r='K'},{s='C',r='A'},
                {s='H',r='2',g='Purple',},{s='H',r='3',g='Purple',},{s='H',r='4',g='Purple',},{s='H',r='5',g='Purple',},{s='H',r='6'},{s='H',r='7'},{s='H',r='8'},{s='H',r='9'},{s='H',r='T'},{s='H',r='J'},{s='H',r='Q'},{s='H',r='K'},{s='H',r='A'},
                {s='S',r='2',g='Purple',},{s='S',r='3',g='Purple',},{s='S',r='4',g='Purple',},{s='S',r='5',g='Purple',},{s='S',r='6'},{s='S',r='7'},{s='S',r='8'},{s='S',r='9'},{s='S',r='T'},{s='S',r='J'},{s='S',r='Q'},{s='S',r='K'},{s='S',r='A'}}
            },
            restrictions = {
                banned_cards = {
                    {id = 'v_omen_globe'},
                    {id = 'v_tarot_merchant'},
                    {id = 'v_tarot_tycoon'},
                    {id = 'j_burglar'},
                    {id = 'j_fortune_teller'},
                    {id = 'j_drunkard'},
                    {id = 'j_cartomancer'},
                    {id = 'c_emperor'},
                    {id = 'p_arcana_normal_3', ids = {
                        'p_arcana_normal_1','p_arcana_normal_2','p_arcana_normal_3','p_arcana_normal_4','p_arcana_jumbo_1','p_arcana_jumbo_2','p_arcana_mega_1','p_arcana_mega_2'
                    }}
                },
                banned_tags = {
                    {id = 'tag_charm'},
                },
                banned_other = {
                    {id = 'bl_fish', type = 'blind'},
                    {id = 'bl_house', type = 'blind'},
                    {id = 'bl_mark', type = 'blind'},
                }
            }
        }
    )

--CUSTOM RULES
local start_runref = Game.start_run
function Game.start_run(self, args)
	start_runref(self, args)
    if args.challenge then
        if self.GAME.modifiers["no_shop_planets"] then
            self.GAME.planet_rate = 0
        end
        if self.GAME.modifiers['shop_spectrals'] then
            self.GAME.spectral_rate = 2
        end
        if self.GAME.modifiers['no_shop_tarots'] then
            self.GAME.tarot_rate = 0
        end
    end
end

    G.localization.misc.v_text.ch_c_no_shop_planets = {
        "{C:planet}Planet{} cards no longer appear in the {C:attention}shop"}

    G.localization.misc.v_text.ch_c_shop_spectrals = {
        "{C:spectral}Spectral{} cards may appear in the {C:attention}shop"}

        G.localization.misc.v_text.ch_c_no_shop_tarots = {
            "{C:tarot}Tarot{} cards no longer appear in the {C:attention}shop"}

end

----------------------------------------------
------------MOD CODE END----------------------