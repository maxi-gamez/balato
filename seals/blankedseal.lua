
SMODS.Seal {
    key = 'blankedseal',
    pos = { x = 0, y = 0 },
    badge_colour = HEX('ff3333'),
    loc_txt = {
        name = 'blanked seal',
        label = 'blanked seal',
        text = {
            [1] = 'creates a negative {C:attention}joker {}when scored'
        }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    no_collection = false,
    sound = { sound = "timpani", per = 1.6, vol = 0.4 },
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            local created_joker = false
            if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                created_joker = true
                G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local joker_card = SMODS.add_card({ set = 'Joker' })
                        if joker_card then
                            joker_card:set_edition("e_negative", true)
                            
                        end
                        G.GAME.joker_buffer = 0
                        return true
                    end
                }))
            end
            return {
                message = created_joker and localize('k_plus_joker') or nil
            }
        end
    end
}