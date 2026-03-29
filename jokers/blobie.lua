
SMODS.Joker{ --Blobie
    key = "blobie",
    config = {
        extra = {
            repetitions0 = 1,
            xchips0 = 2
        }
    },
    loc_txt = {
        ['name'] = 'Blobie',
        ['text'] = {
            [1] = 'Retrigger played {C:attention}Aces{} with {C:hearts}Hearts{} suit',
            [2] = 'and give {X:chips,C:white}X2{} Chips.',
            [3] = '{s:0.8}{C:inactive}cinnabruh\'s oc! {}{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["balato_balato_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            if (context.other_card:get_id() == 14 and context.other_card:is_suit("Hearts")) then
                return {
                    repetitions = 1,
                    message = ":3"
                }
            elseif (context.other_card:get_id() == 14 and context.other_card:is_suit("Hearts")) then
                return {
                    x_chips = 2
                }
            end
        end
    end
}