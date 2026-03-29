
SMODS.Joker{ --Aced up
    key = "acedup",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Aced up',
        ['text'] = {
            [1] = 'creates a {C:attention}Ace{} with a {C:hearts}Hearts{} suit each hand'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 11,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["balato_balato_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            local suit_prefix = 'H'
            local rank_suffix = 'A'
            local card_front = G.P_CARDS[suit_prefix..rank_suffix]
            local base_card = create_playing_card({
                front = card_front,
                center = pseudorandom_element({G.P_CENTERS.m_gold, G.P_CENTERS.m_steel, G.P_CENTERS.m_glass, G.P_CENTERS.m_wild, G.P_CENTERS.m_mult, G.P_CENTERS.m_lucky, G.P_CENTERS.m_stone}, pseudoseed('add_card_hand_enhancement'))
            }, G.discard, true, false, nil, true)
            
            
            
            G.playing_card = (G.playing_card and G.playing_card + 1) or 1
            base_card.playing_card = G.playing_card
            table.insert(G.playing_cards, base_card)
            
            G.E_MANAGER:add_event(Event({
                func = function() 
                    G.hand:emplace(base_card)
                    base_card:start_materialize()
                    return true
                end
            }))
            return {
                message = "Aced up!"
            }
        end
    end
}