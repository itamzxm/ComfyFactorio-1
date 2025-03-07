-- This file is part of thesixthroc's Pirate Ship softmod, licensed under GPLv3 and stored at https://github.com/danielmartin0/ComfyFactorio-Pirates.


local Memory = require 'maps.pirates.memory'
-- local Roles = require 'maps.pirates.roles.roles'
-- local Balance = require 'maps.pirates.balance'
local Common = require 'maps.pirates.common'
-- local Utils = require 'maps.pirates.utils_local'
-- local Math = require 'maps.pirates.math'
-- local Loot = require 'maps.pirates.loot'
local _inspect = require 'utils.inspect'.inspect

-- local Structures = require 'maps.pirates.structures.structures'
-- local Surfaces = require 'maps.pirates.surfaces.surfaces'
local Boats = require 'maps.pirates.structures.boats.boats'
local Hold = require 'maps.pirates.surfaces.hold'

local Public = {}

-- September 2021: Reworking the game so that you start on a 'sloop with hold', but can customize the ship with upgrades.

-- I'm thinking these can start by simply being shop icons.

-- In the hold, we can extend the hold size by placing tiles. Perhaps the space that is extended could be random, as usual to dissuade repetitive builds.

-- For the deck, we don't really want to do that. It's probably safest to stick to things like upgrading the accumulator.

local enum = {
	EXTRA_HOLD = 'extra_hold',
	MORE_POWER = 'upgrade_power',
	UNLOCK_MERCHANTS = 'unlock_merchants',
	ROCKETS_FOR_SALE = 'rockets_for_sale',
	UPGRADE_CANNONS = 'upgrade_cannons', -- heal and upgrade all ship's artilerry turrets max health
}
Public.enum = enum
Public.List = {
	enum.EXTRA_HOLD,
	enum.MORE_POWER,
	enum.UNLOCK_MERCHANTS,
	enum.ROCKETS_FOR_SALE,
	enum.UPGRADE_CANNONS,
}

Public.crowsnest_display_form = {
	[enum.EXTRA_HOLD] = {'pirates.upgrade_hold_crowsnest_form'},
	[enum.MORE_POWER] = {'pirates.upgrade_power_crowsnest_form'},
	[enum.UNLOCK_MERCHANTS] = {'pirates.upgrade_merchants_crowsnest_form'},
	[enum.ROCKETS_FOR_SALE] = {'pirates.upgrade_rockets_crowsnest_form'},
	[enum.UPGRADE_CANNONS] = {'pirates.upgrade_cannons_crowsnest_form'},
}

-- WARNING: The dock market pulls from these values, but the Crowsnest caption pulls data from main_shop_data_1. So don't change one without the other
Public.market_offer_form = {
	[enum.MORE_POWER] = {price = {{'coin', 7000}, {'coal', 500}}, offer = {type='nothing', effect_description={'pirates.market_description_upgrade_power'}}},
	[enum.EXTRA_HOLD] = {price = {{'coin', 7000}, {'coal', 500}}, offer = {type='nothing', effect_description={'pirates.market_description_upgrade_hold'}}},
	[enum.UNLOCK_MERCHANTS] = {price = {{'coin', 14000}, {'coal', 1000}}, offer = {type='nothing', effect_description={'pirates.market_description_upgrade_merchants'}}},
	[enum.ROCKETS_FOR_SALE] = {price = {{'coin', 21000}, {'coal', 1000}}, offer = {type='nothing', effect_description={'pirates.market_description_upgrade_rockets'}}},
	[enum.UPGRADE_CANNONS] = {price = {{'repair-pack', 20}, {'coin', 5000}, {'coal', 800}}, offer = {type='nothing', effect_description={'pirates.market_description_upgrade_rockets'}}},
}

function Public.execute_upgade(upgrade_type, player)

	local memory = Memory.get_crew_memory()
	local boat = memory.boat

	if upgrade_type == enum.EXTRA_HOLD then
		if player then
			Common.notify_force(player.force, {'pirates.upgrade_hold', player.name})
		end
		Hold.add_another_hold_surface()

	elseif upgrade_type == enum.MORE_POWER then
		if player then
			Common.notify_force(player.force, {'pirates.upgrade_power', player.name})
		end
		boat.EEI_stage = boat.EEI_stage + 1
		Boats.update_EEIs(boat)

	elseif upgrade_type == enum.UNLOCK_MERCHANTS then
		if player then
			Common.notify_force(player.force, {'pirates.upgrade_merchants', player.name})
		end
		memory.merchant_ships_unlocked = true

	elseif upgrade_type == enum.ROCKETS_FOR_SALE then
		if player then
			Common.notify_force(player.force, {'pirates.upgrade_rockets', player.name})
		end
		memory.rockets_for_sale = true

	elseif upgrade_type == enum.UPGRADE_CANNONS then
		if player then
			Common.notify_force(player.force, {'pirates.upgraded_cannons', player.name})
		end
		Boats.upgrade_cannons()
	end

end


return Public