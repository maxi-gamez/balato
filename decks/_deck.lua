
SMODS.Back {
    key = '_deck',
    pos = { x = 0, y = 0 },
    config = {
    },
    loc_txt = {
        name = '5 Deck',
        text = {
            [1] = 'every card is 5.'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                for k, v in pairs(G.playing_cards) do
                    assert(SMODS.change_base(v, nil, '5'))
                end
                G.GAME.starting_deck_size = #G.playing_cards
                return true
            end
        }))
    end
}