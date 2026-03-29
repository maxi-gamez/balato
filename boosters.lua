
SMODS.Booster {
    key = 'voucher_pack',
    loc_txt = {
        name = "Voucher Pack",
        text = {
            [1] = 'Choose {C:gold}1{} out of {C:gold}3{} vouchers to redeem'
        },
        group_name = "balato_boosters"
    },
    config = { extra = 3, choose = 1 },
    atlas = "CustomBoosters",
    pos = { x = 0, y = 0 },
    group_key = "balato_boosters",
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        return {
            set = "Voucher",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true
        }
    end,
    particles = function(self)
        -- No particles for voucher packs
        end,
    }
    
    
    SMODS.Booster {
        key = 'mega_voucher_pack',
        loc_txt = {
            name = "Mega Voucher Pack",
            text = {
                [1] = 'Choose {C:gold}2{} out of {C:gold}5{} vouchers to redeem'
            },
            group_name = "balato_boosters"
        },
        config = { extra = 5, choose = 2 },
        cost = 8,
        atlas = "CustomBoosters",
        pos = { x = 1, y = 0 },
        group_key = "balato_boosters",
        discovered = true,
        loc_vars = function(self, info_queue, card)
            local cfg = (card and card.ability) or self.config
            return {
                vars = { cfg.choose, cfg.extra }
            }
        end,
        create_card = function(self, card, i)
            return {
                set = "Voucher",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true
            }
        end,
        ease_background_colour = function(self)
            ease_colour(G.C.DYN_UI.MAIN, HEX("9013fe"))
            ease_background_colour({ new_colour = HEX('9013fe'), special_colour = HEX("bd10e0"), contrast = 2 })
        end,
        particles = function(self)
            -- No particles for voucher packs
            end,
        }
        