SMODS.Atlas {
	key = "PanleyJoker",
	path = "PanleyJoker.png",
	px = 71,
	py = 95
}

SMODS.Joker {
    key = 'panleyjoker',
    loc_txt = {
        name = 'Panler',
        text = {
            "{X:mult,C:white}X#1#{} Mult",
            "and {C:money}$#2#{} per",
            "each {C:attention}Joker{} card",
            "{C:inactive}(Currently {C:red}X#3#{C:inactive} Mult)",
            "{C:inactive}(Currently {C:red}+#4#{C:inactive} Cash)"
        }
    },
    config = { extra = { mult = 0.8, x_mult = 1, cash_per_joker = 3 } },
    rarity = 2,
    atlas = 'PanleyJoker',
    pos = { x = 0, y = 0 },
    cost = 8,
    discovered = true,
    unlocked = true,
    eternal_compat = true,
    blueprint_compat = true,
    loc_vars = function(self, info_queue, card)
        local joker_count = 0
        if G and G.jokers then
            joker_count = #G.jokers.cards
        end
        local current_mult = 0.8 ^ joker_count
        local current_cash = 3 * joker_count
        return { vars = { 0.8, 3, current_mult, current_cash } }
    end,
    calculate = function(self, card, context)
		if context.joker_main then
            local joker_count = #G.jokers.cards
            local current_mult = 0.8 ^ joker_count
            local current_cash = 3 * joker_count
    
            return {
                xmult = current_mult,
                dollars = current_cash,
            }
        end
    end,
}

