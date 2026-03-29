
SMODS.Joker{ --Rio De Janerio
    key = "riodejanerio",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Rio De Janerio',
        ['text'] = {
            [1] = 'Creates a random {C:attention}Joker{} Card when Blind is skipped'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["balato_balato_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.skip_blind  then
            return {
                func = function()
                    
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
                    if created_joker then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Created", colour = G.C.BLUE})
                    end
                    return true
                end
            }
        end
    end
}