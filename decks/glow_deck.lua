
SMODS.Back {
    key = 'glow_deck',
    pos = { x = 2, y = 0 },
    config = {
    },
    loc_txt = {
        name = 'Glow Deck',
        text = {
            [1] = '{C:attention}+1{} Joker slots each round',
            [2] = 'Winning Ante is 6.'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval then
            G.GAME.starting_params.joker_slots = G.GAME.starting_params.joker_slots + 1
        end
    end,
    apply = function(self, back)
        G.GAME.win_ante = 6
    end
}