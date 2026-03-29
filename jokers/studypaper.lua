
SMODS.Joker{ --Study Paper
    key = "studypaper",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Study Paper',
        ['text'] = {
            [1] = 'Copies the ability of leftmost {C:attention}Joker{}',
            [2] = '{C:inactive}Roommate of Retro Code{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 6,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 10,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    
    calculate = function(self, card, context)
        
        local target_joker = nil
        
        if target_joker == card then
            target_joker = nil
        end
        
        local ret = SMODS.blueprint_effect(card, target_joker, context)
        if ret then
            SMODS.calculate_effect(ret, card)
        end
    end
}