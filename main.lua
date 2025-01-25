SMODS.Atlas {
	key = "PanleyJoker",
	path = "PanleyJoker.png",
	px = 71,
	py = 95
}

SMODS.Joker { -- Joker that gives .x75 multiplier and +2 Cash per Joker Card in player's deck. The .x75 is multiplicitive, so the more Jokers, the more its diminished
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
    config = { extra = { mult = 0.75, x_mult = 1, cash_per_joker = 2 } },
    rarity = 2,
    atlas = 'PanleyJoker',
    pos = { x = 0, y = 0 },
    cost = 8,
    discovered = true,
    unlocked = true,
    eternal_compat = true,
    blueprint_compat = true,
    loc_vars = function(self, info_queue, card)
        if not self.ability then
            self.ability = { extra = { mult = 0.75, cash_per_joker = 2 } }
        end
        local joker_count = #G.jokers.cards
        local mult = self.ability.extra.mult
        local cash_per_joker = self.ability.extra.cash_per_joker
        local current_mult = mult ^ joker_count
        local current_cash = cash_per_joker * joker_count
        return { vars = { mult, cash_per_joker, current_mult, current_cash } }
    end,
    calculate = function(self, card, context)
		if not self.ability then
            self.ability = { extra = { mult = 0.75, cash_per_joker = 2 } }
        end
        local joker_count = #G.jokers.cards
        local mult = self.ability.extra.mult
        local cash_per_joker = self.ability.extra.cash_per_joker
        local current_mult = mult ^ joker_count
        local current_cash = cash_per_joker * joker_count
	
		return {
			mult_mod = current_mult,
			cash_mod = current_cash,
			card = self,
			message = localize { type = 'variable', key = 'a_mult_cash', vars = { current_mult, current_cash } }
		}
    end,
}

