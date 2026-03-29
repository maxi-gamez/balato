
SMODS.Back {
    key = 'low_quality_deck',
    pos = { x = 1, y = 0 },
    config = {
        extra = {
            remove_starting_cards_count0 = 26
        },
    },
    loc_txt = {
        name = 'Low Quality Deck',
        text = {
            [1] = 'r ando mized ca rds an d  on      ly 26',
            [2] = 'card     s in d',
            [3] = 'eck'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
    apply = function(self, back)
        local destroyed_cards = {}
        local temp_hand = {}
        G.E_MANAGER:add_event(Event({
            func = function()
            for _, playing_card in ipairs(G.deck.cards) do temp_hand[#temp_hand + 1] = playing_card end
                table.sort(temp_hand,
                    function(a, b)
                        return not a.playing_card or not b.playing_card or a.playing_card < b.playing_card
                    end
                )
                pseudoshuffle(temp_hand, 12345)    
                return true
            end,
        })) 
        
        G.E_MANAGER:add_event(Event({
            func = function()
                for i = 1, 26 do destroyed_cards[#destroyed_cards + 1] = temp_hand[i]:remove()
                end
                G.GAME.starting_deck_size = #G.playing_cards
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            func = function()
                for k, v in pairs(G.playing_cards) do
                    local cen_pool = {}
                    for _, enhancement_center in pairs(G.P_CENTER_POOLS["Enhanced"]) do
                        if enhancement_center.key ~= 'm_stone' then
                            cen_pool[#cen_pool + 1] = enhancement_center
                        end
                    end
                    local enhancement = pseudorandom_element(cen_pool, 'random_enhance')
                    v:set_ability(enhancement)
                    local seal_pool = {'Gold', 'Red', 'Blue', 'Purple'}
                    local random_seal = pseudorandom_element(seal_pool, 'random_seal')
                    v:set_seal(random_seal, nil, true)
                    local edition = pseudorandom_element({'e_foil','e_holo','e_polychrome','e_negative'}, 'random edition')
                    v:set_edition(edition, true, true)
                    local _suit = pseudorandom_element(SMODS.Suits, 'random_suit')
                    assert(SMODS.change_base(v, _suit.key))
                    local _rank = pseudorandom_element(SMODS.Ranks, 'random_rank')
                    assert(SMODS.change_base(v, nil, _rank.key))
                end
                G.GAME.starting_deck_size = #G.playing_cards
                return true
            end
        }))
    end
}