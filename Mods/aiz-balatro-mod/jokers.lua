--- STEAMODDED HEADER
--- MOD_NAME: Aiz Jokers
--- MOD_ID: JAIZ
--- MOD_AUTHOR: [Aiz]
--- MOD_DESCRIPTION: jank jokers

----------------------------------------------
------------MOD CODE -------------------------

-- Config: DISABLE UNWANTED MODS HERE
local config = {
	-- Categories
	allEnabled = true,
	jokersEnabled = true,
	-- Jokers
	backwardsLongJump = false, -- WIP / Broken
	chillJoker = true,
	loudspeaker = true,
	easyMode = true,
	antiBubzia = true,
	blåhaj = true,
	chess_pawn = true,
	chess_knight = true,
	chess_bishop = true,
	chess_rook = true,
	chess_queen = true,
	chess_king = true,
	hand_size = true,
	tetris = true,
	penny = true,
	trollker = true,
	jay_Z = true,
	chaos = true,
}

-- Helper functions
-- Some are Copied from Mikas Mod Collection
-- https://github.com/MikaSchoenmakers/MikasBalatro/tree/main

local function init_joker(joker, no_sprite)
	no_sprite = no_sprite or false

	local new_joker = SMODS.Joker:new(
		joker.ability_name,
		joker.slug,
		joker.ability,
		{ x = 0, y = 0 },
		joker.loc,
		joker.rarity,
		joker.cost,
		joker.unlocked,
		joker.discovered,
		joker.blueprint_compat,
		joker.eternal_compat,
		joker.effect,
		joker.atlas,
		joker.soul_pos
	)
	new_joker:register()

	if not no_sprite then
		local sprite = SMODS.Sprite:new(
			new_joker.slug,
			SMODS.findModByID("JAIZ").path,
			new_joker.slug .. ".png",
			71,
			95,
			"asset_atli"
		)
		sprite:register()
	end
end

local function flip_card_event(card)
	G.E_MANAGER:add_event(Event({
		delay = 0.5,
		trigger = "after",
		func = function()
			card:flip()
			play_sound("card1")
			card:juice_up(0.3, 0.3)
			return true
		end,
	}))
end

local suits = {
	light = {
		"Hearts",
		"Diamonds",
	},
	dark = {
		"Spades",
		"Clubs",
	},
}
local function get_suit_type(card_suit)
	for i, suit in ipairs(suits.dark) do
		if card_suit == suit then
			return "Dark"
		end
	end
	for i, suit in ipairs(suits.light) do
		if card_suit == suit then
			return "Light"
		end
	end
	return "Unknown"
end

local function get_random_suit_of_type(suit_type)
	local choosen_type
	if suit_type == "Light" then
		choosen_type = suits.light
	else
		choosen_type = suits.dark
	end
	return pseudorandom_element(choosen_type, pseudoseed("random_suit"))
end

local function is_chess_joker(ability_name)
	local chess_jokers = {
		"Aiz Pawn",
		"Aiz Knight",
		"Aiz Bishop",
		"Aiz Rook",
		"Aiz Queen",
		"Aiz King",
	}

	for index, chess_ability in ipairs(chess_jokers) do
		if chess_ability == ability_name then
			return true
		end
	end
	return false
end

local function create_blocking_card(card, position, silent)
	G.E_MANAGER:add_event(Event({
		func = function()
			-- create a new empty card
			local blocking_card = Card(
				position.x,
				position.y,
				G.CARD_W,
				G.CARD_H,
				nil,
				G.P_CENTERS.c_base,
				{ playing_card = G.playing_card }
			)
			-- flip it manually so only back is shown
			blocking_card.facing = "back"
			blocking_card.sprite_facing = "back"
			-- Glue card in place to prevent it from being moved
			-- major needs to be set for start_materialize to work correctly
			blocking_card:set_role({ major = blocking_card, role_type = "Glued" })
			blocking_card:start_materialize(nil, silent)
			table.insert(card.ability.extra.cards, blocking_card)
			table.insert(card.ability.extra.card_positions, position)
			return true
		end,
	}))
end

function Jokers()
	if config.chillJoker then
		-- Chill Joker
		-- Gives Xmult based on gamespeed

		-- Create Joker
		local chill_joker = {
			loc = {
				name = "Chill Joker",
				text = {
					"{X:mult,C:white}X#1#{} Mult divided",
					"by game speed",
					"{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)",
				},
			},
			ability_name = "Aiz Chill Joker",
			slug = "aiz_chill_joker",
			ability = {
				extra = {
					Xmult = 2,
				},
			},
			rarity = 2,
			cost = 7,
			unlocked = true,
			discovered = false,
			blueprint_compat = true,
			eternal_compat = true,
		}
		-- Initialize Joker
		init_joker(chill_joker)

		-- Set local variables
		SMODS.Jokers.j_aiz_chill_joker.loc_def = function(card)
			return { card.ability.extra.Xmult, card.ability.extra.Xmult / G.SETTINGS.GAMESPEED }
		end

		-- Calculate
		SMODS.Jokers.j_aiz_chill_joker.calculate = function(card, context)
			if SMODS.end_calculate_context(context) then
				-- Get current gamespeed and give Xmult based on that
				local Xmult = card.ability.extra.Xmult / G.SETTINGS.GAMESPEED
				if Xmult ~= 1 then
					return {
						message = localize({
							type = "variable",
							key = "a_xmult",
							vars = { Xmult },
						}),
						Xmult_mod = Xmult,
					}
				end
			end
		end
	end

	if config.loudspeaker then
		-- Loudspeaker
		-- Gives Chips based on Audio volume

		-- Create Joker
		local loudspeaker = {
			loc = {
				name = "Loudspeaker",
				text = {
					"Gives {C:chips}Chips{} based",
					"on {C:attention}Audio volume{}",
					"{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)",
				},
			},
			ability_name = "Aiz Loudspeaker",
			slug = "aiz_loudspeaker",
			ability = {
				extra = {},
			},
			rarity = 1,
			cost = 5,
			unlocked = true,
			discovered = false,
			blueprint_compat = true,
			eternal_compat = true,
		}
		-- Initialize Joker
		init_joker(loudspeaker)

		-- custom function
		local function get_loudspeaker_chips()
			return math.floor(
				(G.SETTINGS.SOUND.music_volume + G.SETTINGS.SOUND.game_sounds_volume) * G.SETTINGS.SOUND.volume / 200
			)
		end

		-- Set local variables
		SMODS.Jokers.j_aiz_loudspeaker.loc_def = function(card)
			return { get_loudspeaker_chips() }
		end

		-- Calculate
		SMODS.Jokers.j_aiz_loudspeaker.calculate = function(card, context)
			if SMODS.end_calculate_context(context) then
				return {
					message = localize({
						type = "variable",
						key = "a_chips",
						vars = { get_loudspeaker_chips() },
					}),
					chip_mod = get_loudspeaker_chips(),
				}
			end
		end
	end

	if config.easyMode then
		-- Get +mult for each joker with a specific stake sticker
		-- sticker has to be that specific type.

		-- Create Joker
		local easyMode = {
			loc = {
				name = "Easy Mode",
				text = {
					"Gives {C:mult}+1 mult{} for",
					"every 2 jokers with",
					"{C:attention}White stickers{}",
					"in your collection",
					"{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)",
				},
			},
			ability_name = "Aiz Easy Mode",
			slug = "aiz_easy_mode",
			ability = {
				extra = {
					mult_mod = 0.5,
					sticker = "White",
				},
			},
			rarity = 2,
			cost = 7,
			unlocked = true,
			discovered = false,
			blueprint_compat = true,
			eternal_compat = true,
		}
		-- Initialize Joker
		init_joker(easyMode)

		local function get_easy_mode_mult(card)
			local mult = 0
			-- Add mult for every white sticker on a joker
			for _, v in pairs(G.P_CENTERS) do
				if v.set == "Joker" then
					if get_joker_win_sticker(v, false) == card.ability.extra.sticker then
						mult = mult + card.ability.extra.mult_mod
					end
				end
			end
			return math.floor(mult)
		end

		-- Set local variables
		SMODS.Jokers.j_aiz_easy_mode.loc_def = function(card)
			return { get_easy_mode_mult(card) }
		end

		-- Calculate
		SMODS.Jokers.j_aiz_easy_mode.calculate = function(card, context)
			if SMODS.end_calculate_context(context) then
				local mult_mod = get_easy_mode_mult(card)
				return {
					message = localize({
						type = "variable",
						key = "a_mult",
						vars = { mult_mod },
					}),
					mult_mod = mult_mod,
				}
			end
		end
	end

	if config.blåhaj then
		-- Blåhaj
		-- Does nothing by itself since it just gives +1 joker slot
		-- Has code in Card:add_to_deck & Card:remove_from_deck

		-- Create Joker
		local blåhaj = {
			loc = {
				name = "Blåhaj",
				text = {
					"{C:dark_edition}+#1#{} Joker slots",
				},
			},
			ability_name = "Aiz Blåhaj",
			slug = "aiz_blåhaj",
			ability = {
				extra = {
					j_slots = 1,
				},
			},
			rarity = 1,
			cost = 1,
			unlocked = true,
			discovered = false,
			blueprint_compat = false,
			eternal_compat = true,
			soul_pos = {
				x = 1,
				y = 0,
			},
		}
		-- Initialize Joker
		init_joker(blåhaj)

		-- Set local variables
		SMODS.Jokers.j_aiz_blåhaj.loc_def = function(card)
			return { card.ability.extra.j_slots }
		end
	end

	if config.antiBubzia then
		-- AntiBubzia
		-- Sets chips and mult to 0
		-- if negative, squares chips and mult
		-- Has code in Back:trigger_effect

		-- Create Joker
		local antibubzia = {
			loc = {
				name = "AntiBubzia",
				text = {
					"Plays the exact",
					"same hand backwards",
					"to cancel out",
					"your score",
					"every {C:attention}freaking{} time",
				},
			},
			ability_name = "Aiz AntiBubzia",
			slug = "aiz_antibubzia",
			ability = {
				extra = {},
			},
			rarity = 3,
			cost = 10,
			unlocked = true,
			discovered = false,
			blueprint_compat = false,
			eternal_compat = true,
		}
		-- Initialize Joker
		init_joker(antibubzia)

		SMODS.Jokers.j_aiz_antibubzia.set_ability = function(card)
			card.ability.eternal = true
		end
	end
	if config.backwardsLongJump then
		-- Backwards Long Jump (BLJ)
		-- Gain mult on trigger reset after scored
		-- TODO implement the code for this. seems kinda hard

		-- Create Joker
		local blj = {
			loc = {
				name = "BLJ",
				text = {
					"This Joker gains {X:mult,C:white}X#2#{} Mult if",
					"a card is triggered during scoring",
					"{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)",
				},
			},
			ability_name = "Aiz Backwards Long Jump",
			slug = "aiz_blj",
			ability = {
				extra = {
					Xmult = 1,
					Xmult_mod = 0.1,
				},
			},
			rarity = 4,
			cost = 15,
			unlocked = true,
			discovered = false,
			blueprint_compat = false,
			eternal_compat = true,
		}
		-- Initialize Joker
		init_joker(blj, true)

		-- Set local variables
		SMODS.Jokers.j_aiz_blj.loc_def = function(card)
			return { card.ability.extra.Xmult_mod, card.ability.extra.Xmult }
		end

		-- Calculate
		SMODS.Jokers.j_aiz_blj.calculate = function(card, context)
			if SMODS.end_calculate_context(context) and card.ability.extra > 1 then
				return {
					message = localize({
						type = "variable",
						key = "a_xmult",
						vars = { card.ability.extra.Xmult },
					}),
					Xmult_mod = card.ability.extra.Xmult,
				}
			end
		end
	end
	if config.hand_size then
		-- Create Joker
		local hands = {
			loc = {
				name = "Too Much To Handle",
				text = {
					"At end of round",
					"set a random hand size",
					"between {C:attention}#1#{} and {C:attention}#2#{}",
					"{C:inactive}(Currently {C:attention}#3##4#{C:inactive} hand size)",
				},
			},
			ability_name = "Aiz Hand Size",
			slug = "aiz_hands",
			ability = {
				extra = {
					hand_size = {
						max = 15,
						min = 4,
						current = 8,
						difference = 0,
					},
				},
			},
			rarity = 3,
			cost = 8,
			unlocked = true,
			discovered = false,
			blueprint_compat = false,
			eternal_compat = true,
		}
		-- Initialize Joker
		init_joker(hands)

		local function set_random_hand_size(card)
			card.ability.extra.hand_size.current = pseudorandom(
				pseudoseed("aiz_hand_size"),
				card.ability.extra.hand_size.min,
				card.ability.extra.hand_size.max
			)
			card.ability.extra.hand_size.difference = card.ability.extra.hand_size.current
				- (G.hand and G.hand.config.card_limit or 8)
		end

		SMODS.Jokers.j_aiz_hands.set_ability = function(card)
			set_random_hand_size(card)
		end

		-- Set local variables
		SMODS.Jokers.j_aiz_hands.loc_def = function(card)
			local sign = ""
			if card.ability.extra.hand_size.difference >= 0 then
				sign = "+"
			end
			return {
				card.ability.extra.hand_size.min,
				card.ability.extra.hand_size.max,
				sign,
				card.ability.extra.hand_size.difference,
			}
		end

		SMODS.Jokers.j_aiz_hands.calculate = function(card, context)
			if context.end_of_round and not context.individual and not context.repetition and not context.blueprint then
				G.hand:change_size(-card.ability.extra.hand_size.difference)
				G.E_MANAGER:add_event(Event({
					func = function()
						set_random_hand_size(card)
						G.hand:change_size(card.ability.extra.hand_size.difference)
						return true
					end,
				}))
			end
		end
	end
	if config.tetris then
		-- Create Joker
		local tetris = {
			loc = {
				name = "Tetris",
				text = {
					"This Joker Gains {X:mult,C:white}X#1#{} Mult",
					"per {C:attention}consecutive unique{}",
					"hand played, reset on",
					"{C:attention}non unique{} hand played",
					"{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)",
				},
			},
			ability_name = "Aiz Tetris",
			slug = "aiz_tetris",
			ability = {
				extra = {
					Xmult = 1,
					Xmult_mod = 0.5,
					played_hands = {},
				},
			},
			rarity = 3,
			cost = 8,
			unlocked = true,
			discovered = false,
			blueprint_compat = true,
			eternal_compat = true,
		}
		-- Initialize Joker
		init_joker(tetris)

		-- Set local variables
		SMODS.Jokers.j_aiz_tetris.loc_def = function(card)
			return {
				card.ability.extra.Xmult_mod,
				card.ability.extra.Xmult,
			}
		end

		SMODS.Jokers.j_aiz_tetris.calculate = function(card, context)
			if context.cardarea == G.jokers and context.before and not context.blueprint then
				local reset = false
				for _, hand in pairs(card.ability.extra.played_hands) do
					if hand == context.scoring_name then
						reset = true
					end
				end

				if reset then
					card.ability.extra.played_hands = {}
					card.ability.extra.Xmult = 1
					return {
						card = card,
						message = localize("k_reset"),
					}
				else
					table.insert(card.ability.extra.played_hands, context.scoring_name)
					card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_mod
				end
			end
			if SMODS.end_calculate_context(context) then
				return {
					message = localize({
						type = "variable",
						key = "a_xmult",
						vars = { card.ability.extra.Xmult },
					}),
					Xmult_mod = card.ability.extra.Xmult,
				}
			end
		end
	end
	if config.penny then
		-- Create Joker
		local penny = {
			loc = {
				name = "Penny",
				text = {
					"At end of round,",
					"duplicate {C:attention}All{} cards",
					"in your deck",
					"{s:0.5}Please sell when you have 1000 cards or more!",
				},
			},
			ability_name = "Aiz Penny",
			slug = "aiz_penny",
			ability = {
				extra = {
					Xmult = 1,
					Xmult_mod = 0.5,
					played_hands = {},
				},
			},
			rarity = 3,
			cost = 8,
			unlocked = true,
			discovered = false,
			blueprint_compat = true,
			eternal_compat = true,
		}
		-- Initialize Joker
		init_joker(penny)

		SMODS.Jokers.j_aiz_penny.calculate = function(card, context)
			if context.end_of_round and not context.individual and not context.repetition then
				local new_cards = {}
				for _, playing_card in ipairs(G.playing_cards) do
					local _card = copy_card(playing_card, nil, nil, G.playing_card)
					new_cards[#new_cards + 1] = _card
				end
				G.E_MANAGER:add_event(Event({
					func = function()
						for _, playing_card in ipairs(new_cards) do
							playing_card:add_to_deck()
							playing_card:start_materialize()
							G.deck:emplace(playing_card)
							table.insert(G.playing_cards, playing_card)
						end
						playing_card_joker_effects(new_cards)
						return true
					end,
				}))
				card_eval_status_text(
					context.blueprint_card or card,
					"extra",
					nil,
					nil,
					nil,
					{ message = localize("k_duplicated_ex") }
				)
				G.E_MANAGER:add_event(Event({
					func = function()
						G.deck.config.card_limit = G.deck.config.card_limit + #new_cards
						return true
					end,
				}))

				draw_card(G.play, G.deck, 90, "up", nil)
				playing_card_joker_effects(new_cards)
			end
		end
	end
	if config.trollker then
		-- Create Joker
		-- Give Xmult and it increase every round
		-- At start of round and when playing cards it will spawn a bunch of cards to block
		-- both vision and selection of buttons and cards

		local trollker = {
			loc = {
				name = "Trollker",
				text = {
					"This Joker gains {X:mult,C:white}X#2#",
					"Mult at end of round.",
					"This joker may do",
					"a little bit of {C:attention,E:1,S:1.1}Trolling",
					"{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)",
				},
			},
			ability_name = "Aiz Trollker",
			slug = "aiz_trollker",
			ability = {
				extra = {
					Xmult = 1,
					Xmult_mod = 1,
					cards_per_mult = 3,
					cards = {},
					card_positions = {},
				},
			},
			rarity = 3,
			cost = 10,
			unlocked = true,
			discovered = false,
			blueprint_compat = true,
			eternal_compat = true,
		}
		-- Initialize Joker
		init_joker(trollker)

		SMODS.Jokers.j_aiz_trollker.loc_def = function(card)
			return { card.ability.extra.Xmult, card.ability.extra.Xmult_mod }
		end

		SMODS.Jokers.j_aiz_trollker.calculate = function(card, context)
			-- increment xmult at end of round
			-- clean up cards
			if context.end_of_round and not context.individual and not context.repetition and not context.blueprint then
				card_eval_status_text(card, "extra", nil, nil, nil, {
					message = localize("k_upgrade_ex"),
				})
				card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_mod
				for i, blocking_card in ipairs(card.ability.extra.cards) do
					blocking_card:start_dissolve(nil, i ~= #card.ability.extra.cards)
				end
				-- needs to be reset manually
				card.ability.extra.card_positions = {}
			end
			-- Give Xmult when scored
			if SMODS.end_calculate_context(context) then
				return {
					message = localize({
						type = "variable",
						key = "a_xmult",
						vars = { card.ability.extra.Xmult },
					}),
					Xmult_mod = card.ability.extra.Xmult,
				}
			end

			-- Spawn blocking cards on first hand drawn and before scoring a hand
			if
				not context.blueprint
				and (context.first_hand_drawn or (context.cardarea == G.jokers and context.before))
			then
				card_eval_status_text(card, "extra", nil, nil, nil, { message = localize("k_aiz_trolled") })
				-- spawn a card for each mult it gives
				-- -1 so that it only starts spawning cards when it gives xmult
				for i = 1, math.floor((card.ability.extra.Xmult - 1) * card.ability.extra.cards_per_mult), 1 do
					-- IDK if these values work everywhere but i guess its good enough for now
					local position = {
						x = pseudorandom("trollker", 0, 18),
						y = pseudorandom("trollker", 0, 9),
					}
					create_blocking_card(card, position, i ~= 1)
				end
			end
		end
	end
	if config.chess_pawn then
		-- Chess pawn
		-- After a few rounds it promotes to a different chess joker

		-- Create Joker
		local pawn = {
			loc = {
				name = "Pawn",
				text = {
					"Advances at end of round",
					"Adds current rank to mult",
					"{C:inactive}(Currently on rank {C:attention}#1#{C:inactive})",
				},
			},
			ability_name = "Aiz Pawn",
			slug = "aiz_pawn",
			ability = {
				extra = {
					rank = 2,
					promotion_rank = 8,
				},
			},
			rarity = 1,
			cost = 5,
			unlocked = true,
			discovered = false,
			blueprint_compat = true,
			eternal_compat = true,
		}
		-- Initialize Joker
		init_joker(pawn)

		-- Set local variables
		SMODS.Jokers.j_aiz_pawn.loc_def = function(card)
			return { card.ability.extra.rank }
		end

		local function get_random_chess_joker()
			local jokers = {
				j_aiz_knight = { probability = 30 / 100 },
				j_aiz_bishop = { probability = 25 / 100 },
				j_aiz_rook = { probability = 20 / 100 },
				j_aiz_queen = { probability = 15 / 100 },
				j_aiz_king = { probability = 10 / 100 },
			}
			local p = pseudorandom("chess_joker")
			local cumulativeProbability = 0
			for slug, joker in pairs(jokers) do
				cumulativeProbability = cumulativeProbability + joker.probability
				if p <= cumulativeProbability then
					return slug
				end
			end
		end

		-- Calculate
		SMODS.Jokers.j_aiz_pawn.calculate = function(card, context)
			if SMODS.end_calculate_context(context) then
				return {
					message = localize({
						type = "variable",
						key = "a_mult",
						vars = { card.ability.extra.rank },
					}),
					mult_mod = card.ability.extra.rank,
				}
			end
			-- should increment rank and show appropate message
			if context.end_of_round and not context.individual and not context.repetition and not context.blueprint then
				-- This should simulate advancing 2 ranks on first move
				local advances = (card.ability.extra.rank == 2) and 2 or 1
				card.ability.extra.rank = card.ability.extra.rank + advances
				if card.ability.extra.rank == card.ability.extra.promotion_rank then
					-- shows that card is active by shaking it
					card_eval_status_text(card, "extra", nil, nil, nil, {
						message = localize("k_aiz_promoted"),
					})

					G.E_MANAGER:add_event(Event({
						func = function()
							play_sound("tarot1")
							card.T.r = -0.2
							card:juice_up(0.3, 0.4)
							card.states.drag.is = true
							card.children.center.pinch.x = true
							G.E_MANAGER:add_event(Event({
								trigger = "after",
								delay = 0.3,
								blockable = false,
								func = function()
									local edition = card.edition
									G.jokers:remove_card(card)
									card:remove()
									card = nil
									local joker_slug = get_random_chess_joker()
									local new_card = create_card("Joker", G.jokers, nil, nil, nil, nil, joker_slug, nil)
									new_card:set_edition(edition, nil, true)
									new_card:add_to_deck()
									G.jokers:emplace(new_card)
									return true
								end,
							}))
							return true
						end,
					}))
				else
					card_eval_status_text(card, "extra", nil, nil, nil, {
						message = localize("k_aiz_advance"),
					})
				end
			end
		end
	end
	if config.chess_knight then
		-- Chess knight
		-- converts light suit to random dark suit. converted cards give + mult
		-- switches dark/light every round

		-- Create Joker
		local knight = {
			loc = {
				name = "Knight",
				text = {
					"Converts scored {C:attention}#2#{} suits",
					"To random {C:attention}#3#{} suits",
					"Converted cards give {C:mult}+#1#{} Mult",
					"{s:0.8}Flips conversion at end of round{}",
				},
			},
			ability_name = "Aiz Knight",
			slug = "aiz_knight",
			ability = {
				extra = {
					mult = 10,
					change = {
						from = "Dark",
						to = "Light",
					},
				},
			},
			rarity = 2,
			cost = 6,
			unlocked = true,
			discovered = false,
			blueprint_compat = true,
			eternal_compat = true,
		}
		-- Initialize Joker
		init_joker(knight)

		-- remove from pool
		SMODS.Jokers.j_aiz_knight.yes_pool_flag = "this_flag_will_never_be_set"

		-- Set local variables
		SMODS.Jokers.j_aiz_knight.loc_def = function(card)
			return { card.ability.extra.mult, card.ability.extra.change.from, card.ability.extra.change.to }
		end

		SMODS.Jokers.j_aiz_knight.set_ability = function(card)
			-- Randomize starting suits.
			-- Partially just to make it easier to have multiple knights be useful together.
			local change_to_light = (0.5 > pseudorandom("knight_suits"))
			card.ability.extra.change.from = (change_to_light and "Dark" or "Light")
			card.ability.extra.change.to = (change_to_light and "Light" or "Dark")
		end

		local function card_can_be_converted(card, other_card)
			-- just checks if current suit is the type that should be converted
			return (
				((other_card.aiz_knight_suit == other_card.base.suit) or not other_card.aiz_knight_suit)
				and get_suit_type(other_card.base.suit) == card.ability.extra.change.from
			)
				or (
					other_card.aiz_knight_suit ~= other_card.base.suit
					and get_suit_type(other_card.aiz_knight_suit) == card.ability.extra.change.from
				)
		end

		-- Calculate
		SMODS.Jokers.j_aiz_knight.calculate = function(card, context)
			if context.individual and context.cardarea == G.play then
				if card_can_be_converted(card, context.other_card) then
					-- Get new suit and add it to a new property so that multiple knights can work together
					local new_suit = get_random_suit_of_type(card.ability.extra.change.to)
					context.other_card.aiz_knight_suit = new_suit

					flip_card_event(context.other_card)
					G.E_MANAGER:add_event(Event({
						delay = 0.15,
						trigger = "after",
						func = function()
							-- after setting suit we also need to reset knight suit
							context.other_card:change_suit(new_suit)
							context.other_card.aiz_knight_suit = nil
							return true
						end,
					}))
					flip_card_event(context.other_card)
					-- I want to make this mult trigger after card has been flipped.
					-- currently it triggers after other cards.
					-- Alternatively the flip events should trigger after other jokers cards...
					return {
						mult = card.ability.extra.mult,
						card = card,
					}
				end
			end
			-- flip suit to change at end of round
			if context.end_of_round and not context.individual and not context.repetition and not context.blueprint then
				local temp = card.ability.extra.change.from
				card.ability.extra.change.from = card.ability.extra.change.to
				card.ability.extra.change.to = temp
			end
		end
	end
	if config.chess_bishop then
		-- Chess bishop
		-- don't know effect yet

		-- Create Joker
		local bishop = {
			loc = {
				name = "Bishop",
				text = {
					"Scored Numbered cards",
					"earn {C:money}$#1#{}",
					"Scored Face cards",
					"{C:attention}lose{} {C:money}$#1#{}",
				},
			},
			ability_name = "Aiz Bishop",
			slug = "aiz_bishop",
			ability = {
				extra = {
					money = 1,
				},
			},
			rarity = 2,
			cost = 6,
			unlocked = true,
			discovered = false,
			blueprint_compat = true,
			eternal_compat = true,
		}
		-- Initialize Joker
		init_joker(bishop)

		-- Set local variables
		SMODS.Jokers.j_aiz_bishop.loc_def = function(card)
			return { card.ability.extra.money }
		end

		-- remove from pool
		SMODS.Jokers.j_aiz_bishop.yes_pool_flag = "this_flag_will_never_be_set"

		-- Calculate
		SMODS.Jokers.j_aiz_bishop.calculate = function(card, context)
			if context.individual and context.cardarea == G.play then
				if context.other_card:is_face() then
					G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) - card.ability.extra.money
					G.E_MANAGER:add_event(Event({
						func = function()
							G.GAME.dollar_buffer = 0
							return true
						end,
					}))
					return {
						dollars = card.ability.extra.money * -1,
						card = card,
					}
				elseif context.other_card:get_id() >= 2 then
					G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + card.ability.extra.money
					G.E_MANAGER:add_event(Event({
						func = function()
							G.GAME.dollar_buffer = 0
							return true
						end,
					}))
					return {
						dollars = card.ability.extra.money,
						card = card,
					}
				end
			end
		end
	end
	if config.chess_rook then
		-- Chess rook
		-- Turn cards into stone.
		-- Discarded cards are turned
		-- -1 discard because of this.

		-- Create Joker
		local rook = {
			loc = {
				name = "Rook",
				text = {
					"Discarded cards are",
					"turned to stone",
					"{C:attention}-#1#{} discards",
				},
			},
			ability_name = "Aiz Rook",
			slug = "aiz_rook",
			ability = {
				extra = {
					discard_size = 1,
				},
			},
			rarity = 3,
			cost = 8,
			unlocked = true,
			discovered = false,
			blueprint_compat = true,
			eternal_compat = true,
		}
		-- Initialize Joker
		init_joker(rook)

		-- Set local variables
		SMODS.Jokers.j_aiz_rook.loc_def = function(card)
			return { card.ability.extra.discard_size }
		end

		-- remove from pool
		SMODS.Jokers.j_aiz_rook.yes_pool_flag = "this_flag_will_never_be_set"

		-- Calculate
		SMODS.Jokers.j_aiz_rook.calculate = function(card, context)
			if context.pre_discard then
				for i = 1, #G.hand.highlighted do
					flip_card_event(G.hand.highlighted[i])
				end
				for i = 1, #G.hand.highlighted do
					G.E_MANAGER:add_event(Event({
						trigger = "after",
						delay = 0.1,
						func = function()
							G.hand.highlighted[i]:set_ability(G.P_CENTERS["m_stone"])
							return true
						end,
					}))
				end
				for i = 1, #G.hand.highlighted do
					flip_card_event(G.hand.highlighted[i])
				end
			end
		end
	end
	if config.chess_queen then
		-- Chess queen
		-- destroy cards and gain Xmult

		-- Create Joker
		local queen = {
			loc = {
				name = "Queen",
				text = {
					"When round begins,",
					"destroy all cards",
					"of {C:attention}lowest{} rank",
					"in your full deck.",
					"This Joker gains {X:mult,C:white}X{} Mult",
					"for each card destroyed",
					"{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)",
				},
			},
			ability_name = "Aiz Queen",
			slug = "aiz_queen",
			ability = {
				extra = {
					Xmult = 1,
					Xmult_mod = 0.05,
				},
			},
			rarity = 3,
			cost = 15,
			unlocked = true,
			discovered = false,
			blueprint_compat = false,
			eternal_compat = true,
		}
		-- Initialize Joker
		init_joker(queen)

		-- Set local variables
		SMODS.Jokers.j_aiz_queen.loc_def = function(card)
			return { card.ability.extra.Xmult }
		end

		-- remove from pool
		SMODS.Jokers.j_aiz_queen.yes_pool_flag = "this_flag_will_never_be_set"

		-- Calculate
		SMODS.Jokers.j_aiz_queen.calculate = function(card, context)
			if context.first_hand_drawn and not context.blueprint then
				local min = math.huge
				for _, playing_card in ipairs(G.playing_cards) do
					min = min < playing_card:get_id() and min or playing_card:get_id()
				end
				-- stone cards don't have set id
				-- but it's always less than 1
				if min < 1 then
					min = 1
				end
				for i, playing_card in ipairs(G.playing_cards) do
					if playing_card:get_id() <= min then
						-- Add to Xmult
						local mult_mod = card.ability.extra.Xmult_mod * min
						card.ability.extra.Xmult = card.ability.extra.Xmult + mult_mod
						-- Destroy card
						playing_card:start_dissolve(nil, i ~= 1)
					end
				end
			end
			if SMODS.end_calculate_context(context) and card.ability.extra.Xmult > 1 then
				return {
					message = localize({
						type = "variable",
						key = "a_xmult",
						vars = { card.ability.extra.Xmult },
					}),
					Xmult_mod = card.ability.extra.Xmult,
				}
			end
		end
	end
	if config.chess_king then
		-- Chess king
		-- don't know effect yet
		-- will make you lose if destroyed,
		-- bonus based on amount of chess jokers.

		-- Create Joker
		local king = {
			loc = {
				name = "King",
				text = {
					"Other {C:attention}Chess Jokers",
					"Give {X:mult,C:white}X#1#{} Mult",
				},
			},
			ability_name = "Aiz King",
			slug = "aiz_king",
			ability = {
				extra = {
					Xmult = 5,
				},
			},
			rarity = 4,
			cost = 15,
			unlocked = true,
			discovered = false,
			blueprint_compat = true,
			eternal_compat = true,
			soul_pos = { x = 1, y = 0 },
		}
		-- Initialize Joker
		init_joker(king)

		-- remove from pool
		SMODS.Jokers.j_aiz_king.yes_pool_flag = "this_flag_will_never_be_set"

		-- Set local variables
		SMODS.Jokers.j_aiz_king.loc_def = function(card)
			return { card.ability.extra.Xmult }
		end

		-- Calculate
		SMODS.Jokers.j_aiz_king.calculate = function(card, context)
			if context.other_joker and context.other_joker.ability.set == "Joker" and context.other_joker ~= card then
				if is_chess_joker(context.other_joker.ability.name) then
					return {
						message = localize({
							type = "variable",
							key = "a_xmult",
							vars = { card.ability.extra.Xmult },
						}),
						Xmult_mod = card.ability.extra.Xmult,
					}
				end
			end
		end
	end
	if config.jay_Z then
		-- Jay-Z famous rapper
		-- Sell for 500
		-- Makes all cards polychrome

		-- Create Joker
		local jay_z = {
			loc = {
				name = "Jay-Z",
				text = {
					"{C:green}#1# in #2#{} chance this",
					"card is destroyed and",
					"{C:dark_edition}Polychrome{} is added",
					"to {C:attention}All{} cards",
					"at end of round",
				},
			},
			ability_name = "Aiz Jay-Z",
			slug = "aiz_jay_z",
			ability = {
				extra = {
					odds = 10,
				},
			},
			rarity = 4,
			cost = 1000,
			unlocked = true,
			discovered = false,
			blueprint_compat = false,
			eternal_compat = false,
			soul_pos = { x = 1, y = 0 },
		}
		-- Initialize Joker
		init_joker(jay_z)

		-- Set local variables
		SMODS.Jokers.j_aiz_jay_z.loc_def = function(card)
			return { (G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.odds }
		end

		local function turn_polychrome(card)
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.3,
				func = function()
					if card.edition and card.edition.negative then
						if card.ability.consumeable then
							G.consumeables.config.card_limit = G.consumeables.config.card_limit - 1
						else
							G.jokers.config.card_limit = G.jokers.config.card_limit - 1
						end
					end
					card:set_edition({ polychrome = true }, true)
					return true
				end,
			}))
		end

		-- Calculate
		SMODS.Jokers.j_aiz_jay_z.calculate = function(card, context)
			if context.end_of_round and not context.individual and not context.repetition and not context.blueprint then
				if pseudorandom("aiz_jay_z") < G.GAME.probabilities.normal / card.ability.extra.odds then
					G.E_MANAGER:add_event(Event({
						func = function()
							-- Destroy Jay-Z
							play_sound("tarot1")
							card.T.r = -0.2
							card:juice_up(0.3, 0.4)
							card.states.drag.is = true
							card.children.center.pinch.x = true
							G.E_MANAGER:add_event(Event({
								trigger = "after",
								delay = 0.3,
								blockable = false,
								func = function()
									G.jokers:remove_card(card)
									card:remove()
									card = nil
									return true
								end,
							}))
							return true
						end,
					}))
					-- show message before polychrome starts
					card_eval_status_text(
						card,
						"extra",
						nil,
						nil,
						nil,
						{ message = localize("k_aiz_knowledge_gained") }
					)
					-- Turn all cards polychrome
					-- start with cards held in hand
					for _, playing_card in ipairs(G.hand.cards) do
						turn_polychrome(playing_card)
					end
					for _, joker_card in ipairs(G.jokers.cards) do
						turn_polychrome(joker_card)
					end
					for _, consumable_card in ipairs(G.consumeables.cards) do
						turn_polychrome(consumable_card)
					end
					-- Rest of Playing Cards are done later
					G.E_MANAGER:add_event(Event({
						func = function()
							for _, playing_card in ipairs(G.playing_cards) do
								playing_card:set_edition({ polychrome = true }, true, true)
							end
							return true
						end,
					}))
				else
					card.base_cost = card.base_cost / 2
					card:set_cost()
					return {
						message = localize("k_aiz_dinner_postponed"),
					}
				end
			end
		end
	end

	if config.chaos then
		-- Create Joker
		local chaos = {
			loc = {
				name = "Chaos",
				text = {
					"{C:green}#1# in #2#{} for {C:chips}+100{} Chips",
					"{C:green}#1# in #3#{} for {C:mult}+20{} Mult",
					"{C:green}#1# in #4#{} for {X:mult,C:white}X3{} Mult",
					"{C:green}#1# in #5#{} for {C:money}$10",
					"{C:green}#1# in #6#{} for a {C:tarot}Tarot{} Card",
					"{C:green}#1# in #7#{} for a {C:planet}Planet{} Card",
					"{C:green}#1# in #8#{} for a {C:dark_edition}Spectral{} Card",
					"At start of round:",
					"{C:green}#1# in #9#{} for a Playing Card",
					"{C:green}#1# in #10#{} to flip and shuffle Jokers",
					"{C:green}#1# in #11#{} to {C:red}Destroy{} a random Joker",
					"{C:green}#1# in #12#{} to {C:attention}Create{} a random Joker",
					"{C:green}#1# in #13#{} to increase this Jokers {C:green,E:1,S:1.1}Probabilities",
					"{C:green}#1# in #14#{} to {C:attention}Double{} all listed {C:green,E:1,S:1.1}Probabilities",
				},
			},
			ability_name = "Aiz Chaos",
			slug = "aiz_chaos",
			ability = {
				extra = {
					probability = 1,
					odds = {
						chips = 2,
						mult = 4,
						Xmult = 8,
						dollars = 15,
						joker = 10,
						tarot = 10,
						planet = 10,
						spectral = 20,
						playing_card = 2,
						shuffle = 10,
						destroy_joker = 20,
						increase_odds = 50,
						double_all_odds = 1000,
					},
				},
			},
			rarity = 2,
			cost = 7,
			unlocked = true,
			discovered = true,
			blueprint_compat = true,
			eternal_compat = true,
		}
		-- Initialize Joker
		init_joker(chaos)

		-- Set local variables
		SMODS.Jokers.j_aiz_chaos.loc_def = function(card)
			return {
				(G.GAME and G.GAME.probabilities.normal or 1) * card.ability.extra.probability,
				card.ability.extra.odds.chips,
				card.ability.extra.odds.mult,
				card.ability.extra.odds.Xmult,
				card.ability.extra.odds.dollars,
				card.ability.extra.odds.tarot,
				card.ability.extra.odds.planet,
				card.ability.extra.odds.spectral,
				card.ability.extra.odds.playing_card,
				card.ability.extra.odds.shuffle,
				card.ability.extra.odds.destroy_joker,
				card.ability.extra.odds.joker,
				card.ability.extra.odds.increase_odds,
				card.ability.extra.odds.double_all_odds,
			}
		end

		local function eval_this(_card, eval_type, amount)
			if eval_type == "mult" then
				mult = mod_mult(mult + amount)
			end
			if eval_type == "chips" then
				hand_chips = mod_chips(hand_chips + amount)
			end
			if eval_type == "x_mult" then
				mult = mod_mult(mult * amount)
			end
			update_hand_text({ delay = 0 }, {
				chips = eval_type == "chips" and hand_chips,
				mult = (eval_type == "mult" or eval_type == "x_mult") and mult,
			})
			card_eval_status_text(_card, eval_type, amount, nil, nil, nil)
		end

		-- Calculate
		SMODS.Jokers.j_aiz_chaos.calculate = function(card, context)
			local function chaos_random(odds)
				return pseudorandom("aiz_chaos") < (G.GAME.probabilities.normal * card.ability.extra.probability) / odds
			end
			-- Start of round
			if context.first_hand_drawn then
				if not context.blueprint and chaos_random(card.ability.extra.odds.increase_odds) then
					card.ability.extra.probability = card.ability.extra.probability + 1
					card_eval_status_text((context.blueprint_card or card), "extra", nil, nil, nil, {
						message = "probability increased",
					})
				end
				if chaos_random(card.ability.extra.odds.double_all_odds) then
					for k, v in pairs(G.GAME.probabilities) do
						G.GAME.probabilities[k] = v * 2
					end
					card_eval_status_text((context.blueprint_card or card), "extra", nil, nil, nil, {
						message = "Probabilities doubled",
					})
				end
				-- Copied from Certificate
				if chaos_random(card.ability.extra.odds.playing_card) then
					G.E_MANAGER:add_event(Event({
						func = function()
							local new_playing_card = create_playing_card({
								front = pseudorandom_element(G.P_CARDS, pseudoseed("aiz_chaos")),
								center = G.P_CENTERS.c_base,
							}, G.hand, nil, nil, { G.C.SECONDARY_SET.Enhanced })

							G.GAME.blind:debuff_card(new_playing_card)
							G.hand:sort()
							if context.blueprint_card then
								context.blueprint_card:juice_up()
							else
								card:juice_up()
							end
							return true
						end,
					}))
					playing_card_joker_effects({ true })
				end

				if chaos_random(card.ability.extra.odds.shuffle) then
					G.jokers:unhighlight_all()
					for k, v in ipairs(G.jokers.cards) do
						v:flip()
					end
					if #G.jokers.cards > 1 then
						G.E_MANAGER:add_event(Event({
							trigger = "after",
							delay = 0.2,
							func = function()
								G.E_MANAGER:add_event(Event({
									func = function()
										G.jokers:shuffle("aajk")
										play_sound("cardSlide1", 0.85)
										return true
									end,
								}))
								delay(0.15)
								G.E_MANAGER:add_event(Event({
									func = function()
										G.jokers:shuffle("aajk")
										play_sound("cardSlide1", 1.15)
										return true
									end,
								}))
								delay(0.15)
								G.E_MANAGER:add_event(Event({
									func = function()
										G.jokers:shuffle("aajk")
										play_sound("cardSlide1", 1)
										return true
									end,
								}))
								delay(0.5)
								return true
							end,
						}))
					end
				end
				-- Destroy Card
				-- Copied from Madness
				if not context.blueprint and chaos_random(card.ability.extra.odds.destroy_joker) then
					local destructable_jokers = {}
					for i = 1, #G.jokers.cards do
						if
							G.jokers.cards[i] ~= card
							and not G.jokers.cards[i].ability.eternal
							and not G.jokers.cards[i].getting_sliced
						then
							destructable_jokers[#destructable_jokers + 1] = G.jokers.cards[i]
						end
					end
					local joker_to_destroy = #destructable_jokers > 0
							and pseudorandom_element(destructable_jokers, pseudoseed("aiz_chaos"))
						or nil

					if joker_to_destroy and not (context.blueprint_card or card).getting_sliced then
						joker_to_destroy.getting_sliced = true
						G.E_MANAGER:add_event(Event({
							func = function()
								(context.blueprint_card or card):juice_up(0.8, 0.8)
								joker_to_destroy:start_dissolve({ G.C.RED }, nil, 1.6)
								return true
							end,
						}))
					end
					if not (context.blueprint_card or card).getting_sliced then
						card_eval_status_text((context.blueprint_card or card), "extra", nil, nil, nil, {
							message = localize("k_aiz_destroy"),
						})
					end
				end
				-- Random Joker
				if
					chaos_random(card.ability.extra.odds.joker)
					and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit
				then
					-- Modified from Riff Raff code
					G.GAME.joker_buffer = G.GAME.joker_buffer + 1
					G.E_MANAGER:add_event(Event({
						func = function()
							local new_joker = create_card("Joker", G.jokers, nil, nil, nil, nil, nil, "aiz_chaos")
							new_joker:add_to_deck()
							G.jokers:emplace(new_joker)
							new_joker:start_materialize()
							G.GAME.joker_buffer = 0
							return true
						end,
					}))
					card_eval_status_text(
						context.blueprint_card or card,
						"extra",
						nil,
						nil,
						nil,
						{ message = localize("k_plus_joker"), colour = G.C.BLUE }
					)
				end
			end

			-- At Scoring
			if SMODS.end_calculate_context(context) then
				-- Chips
				if chaos_random(card.ability.extra.odds.chips) then
					eval_this(context.blueprint_card or card, "chips", 100)
				end
				-- Mult
				if chaos_random(card.ability.extra.odds.mult) then
					eval_this(context.blueprint_card or card, "mult", 20)
				end
				-- Xmult
				if chaos_random(card.ability.extra.odds.Xmult) then
					eval_this(context.blueprint_card or card, "x_mult", 3)
				end
				-- Money
				if chaos_random(card.ability.extra.odds.dollars) then
					ease_dollars(10)
					card_eval_status_text(context.blueprint_card or card, "dollars", 10, nil, nil, nil)
				end

				-- Random Tarot
				if
					chaos_random(card.ability.extra.odds.tarot)
					and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit
				then
					-- Modified from Hallucination code
					G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
					G.E_MANAGER:add_event(Event({
						trigger = "before",
						delay = 0.0,
						func = function()
							local new_tarot = create_card("Tarot", G.consumeables, nil, nil, nil, nil, nil, "aiz_chaos")
							new_tarot:add_to_deck()
							G.consumeables:emplace(new_tarot)
							G.GAME.consumeable_buffer = 0
							return true
						end,
					}))
					card_eval_status_text(
						context.blueprint_card or card,
						"extra",
						nil,
						nil,
						nil,
						{ message = localize("k_plus_tarot"), colour = G.C.PURPLE }
					)
				end
				-- Random planet
				if
					chaos_random(card.ability.extra.odds.tarot)
					and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit
				then
					-- Modified from Hallucination code
					G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
					G.E_MANAGER:add_event(Event({
						trigger = "before",
						delay = 0.0,
						func = function()
							local new_tarot =
								create_card("Planet", G.consumeables, nil, nil, nil, nil, nil, "aiz_chaos")
							new_tarot:add_to_deck()
							G.consumeables:emplace(new_tarot)
							G.GAME.consumeable_buffer = 0
							return true
						end,
					}))
					card_eval_status_text(
						context.blueprint_card or card,
						"extra",
						nil,
						nil,
						nil,
						{ message = localize("k_plus_planet"), colour = G.C.SECONDARY_SET.Planet }
					)
				end
				-- Random spectral
				if
					chaos_random(card.ability.extra.odds.spectral)
					and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit
				then
					-- Modified from Hallucination code
					G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
					G.E_MANAGER:add_event(Event({
						trigger = "before",
						delay = 0.0,
						func = function()
							local new_tarot =
								create_card("Spectral", G.consumeables, nil, nil, nil, nil, nil, "aiz_chaos")
							new_tarot:add_to_deck()
							G.consumeables:emplace(new_tarot)
							G.GAME.consumeable_buffer = 0
							return true
						end,
					}))
					card_eval_status_text(
						context.blueprint_card or card,
						"extra",
						nil,
						nil,
						nil,
						{ message = localize("k_plus_spectral"), colour = G.C.SECONDARY_SET.Spectral }
					)
				end
			end
		end
	end
end

function SMODS.INIT.JAIZ()
	-- Localization
	G.localization.misc.dictionary.k_aiz_advance = "Advance!"
	G.localization.misc.dictionary.k_aiz_promoted = "Promoted!"
	G.localization.misc.dictionary.k_aiz_trolled = "Trolled!"
	G.localization.misc.dictionary.k_aiz_squared = "Squared!"
	G.localization.misc.dictionary.k_aiz_cancelled = "Cancelled!"
	G.localization.misc.dictionary.k_aiz_knowledge_gained = "Knowledge Gained!"
	G.localization.misc.dictionary.k_aiz_dinner_postponed = "Dinner Postponed!"
	G.localization.misc.dictionary.k_aiz_destroy = "Destroyed!"

	if config.allEnabled then
		if config.jokersEnabled then
			Jokers()
		end
	end
end

-- Handle card addition/removing
local add_to_deckref = Card.add_to_deck
function Card:add_to_deck(from_debuff)
	if not self.added_to_deck then
		if self.ability.name == "Aiz Blåhaj" then
			G.jokers.config.card_limit = G.jokers.config.card_limit + self.ability.extra.j_slots
		end
		if self.ability.name == "Aiz Rook" then
			G.GAME.round_resets.discards = G.GAME.round_resets.discards - self.ability.extra.discard_size
			ease_discard(-self.ability.extra.discard_size)
		end
		if self.ability.name == "Aiz Hand Size" then
			G.hand:change_size(self.ability.extra.hand_size.difference)
		end
	end
	add_to_deckref(self, from_debuff)
end

local remove_from_deckref = Card.remove_from_deck
function Card:remove_from_deck(from_debuff)
	if self.added_to_deck then
		if self.ability.name == "Aiz Blåhaj" then
			G.jokers.config.card_limit = G.jokers.config.card_limit - self.ability.extra.j_slots
		end
		if self.ability.name == "Aiz Rook" then
			G.GAME.round_resets.discards = G.GAME.round_resets.discards + self.ability.extra.discard_size
			ease_discard(self.ability.extra.discard_size)
		end
		if self.ability.name == "Aiz Hand Size" then
			G.hand:change_size(-self.ability.extra.hand_size.difference)
		end
	end
	remove_from_deckref(self, from_debuff)
end

-- Handle Deck trigger effect
-- Used for final scoring step with some jokers
local back_trigger_effectref = Back.trigger_effect
function Back:trigger_effect(args)
	back_trigger_effectref(self, args)
	if args.context == "final_scoring_step" then
		for i = 1, #G.jokers.cards do
			local card = G.jokers.cards[i]
			if card.ability.name == "Aiz AntiBubzia" then
				local text
				if card.edition and card.edition.negative then
					args.mult = args.mult * args.mult
					args.chips = args.chips * args.chips
					text = localize("k_aiz_squared")
				else
					args.mult = 0
					args.chips = 0
					text = localize("k_aiz_cancelled")
				end
				update_hand_text({ delay = 0 }, { mult = args.mult, chips = args.chips })

				-- mostly same effect as plasma deck.
				G.E_MANAGER:add_event(Event({
					trigger = "before",
					delay = 4.3,
					func = function()
						play_sound("gong", 0.94, 0.3)
						play_sound("gong", 0.94 * 1.5, 0.2)
						play_sound("tarot1", 1.5)
						attention_text({
							scale = 1.4,
							text = text,
							hold = 2,
							align = "cm",
							offset = { x = 0, y = -2.7 },
							major = G.play,
						})
						return true
					end,
				}))
			end
		end
	end
	return args.chips, args.mult
end

local card_loadref = Card.load
function Card:load(cardTable, other_card)
	card_loadref(self, cardTable, other_card)

	if self.ability.name == "Aiz Trollker" then
		-- reset blocking_cards here
		self.ability.extra.cards = {}
		for i, position in ipairs(self.ability.extra.card_positions) do
			create_blocking_card(self, position, i ~= 1)
		end
	end
end
----------------------------------------------
------------MOD CODE END----------------------
