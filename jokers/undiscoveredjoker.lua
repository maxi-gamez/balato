
SMODS.Joker{ --Undiscovered Joker
    key = "undiscoveredjoker",
    config = {
        extra = {
            odds = 4,
            odds2 = 2,
            odds3 = 16,
            odds4 = 64,
            xchips0 = 10,
            chips0 = 10,
            echips0 = 5,
            hyperchips_n0 = 5,
            hyperchips_arrows0 = 2
        }
    },
    loc_txt = {
        ['name'] = 'Undiscovered Joker',
        ['text'] = {
            [1] = '{C:green}#1# in 2{} chance to give {C:blue}+10{} Chips,',
            [2] = '',
            [3] = '{C:green}#3# in 4{} chance to give {X:chips,C:white}X10{} Chips,',
            [4] = '',
            [5] = '{C:green}#5# in 16{} chance to give {X:chips,C:white}^5{} Chips,',
            [6] = '',
            [7] = '{} {C:green}#7# in 64{} chance to give {X:chips,C:white,s:1.45}^^2{}{} Chips.',
            [8] = '',
            [9] = '{C:inactive,s:0.9}Eh, who needs balancing anyways?{}{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 35,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["balato_balato_jokers"] = true },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' 
            or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_balato_undiscoveredjoker')
        local new_numerator2, new_denominator2 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds2, 'j_balato_undiscoveredjoker')
        local new_numerator3, new_denominator3 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds3, 'j_balato_undiscoveredjoker')
        local new_numerator4, new_denominator4 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds4, 'j_balato_undiscoveredjoker')
        return {vars = {new_numerator, new_denominator, new_numerator2, new_denominator2, new_numerator3, new_denominator3, new_numerator4, new_denominator4}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_19fee736', 1, card.ability.extra.odds, 'j_balato_undiscoveredjoker', false) then
                    SMODS.calculate_effect({x_chips = 10}, card)
                end
                if SMODS.pseudorandom_probability(card, 'group_1_72ede411', 1, card.ability.extra.odds2, 'j_balato_undiscoveredjoker', false) then
                    SMODS.calculate_effect({chips = 10}, card)
                end
                if SMODS.pseudorandom_probability(card, 'group_2_3a06c042', 1, card.ability.extra.odds3, 'j_balato_undiscoveredjoker', false) then
                    SMODS.calculate_effect({e_chips = 5}, card)
                end
                if SMODS.pseudorandom_probability(card, 'group_3_1071535e', 1, card.ability.extra.odds4, 'j_balato_undiscoveredjoker', false) then
                    SMODS.calculate_effect({hyperchips = {
                        2,
                        5
                    }}, card)
                end
            end
        end
    end
}