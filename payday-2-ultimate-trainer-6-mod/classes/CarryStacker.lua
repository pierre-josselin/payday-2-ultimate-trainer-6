UT.CarryStacker = {}

UT.CarryStacker.bags = {}
UT.CarryStacker.bagType = "light"

UT.CarryStacker.bagTypesWeight = {
    light = 1,
    coke_light = 2,
    piggy_feed = 3,
    medium = 4,
    explosives = 5,
    cloaker_explosives = 6,
    slightly_heavy = 7,
    heavy = 8,
    being = 9,
    slightly_very_heavy = 10,
    very_heavy = 11,
    mega_heavy = 12,
    cg22_heavy = 13,
    cg22_light = 14
}

function UT.CarryStacker:setBagType()
    local bagType = "light"
    if #UT.CarryStacker.bags > 0 then
        for index, data in pairs(UT.CarryStacker.bags) do
            local carryData = tweak_data.carry[data.carryId]

            if carryData and carryData.type and UT.CarryStacker.bagTypesWeight[carryData.type] then
                if UT.CarryStacker.bagTypesWeight[carryData.type] >= UT.CarryStacker.bagTypesWeight[bagType] then
                    bagType = carryData.type
                end
            end
        end
    end
    UT.CarryStacker.bagType = bagType
end

function UT.CarryStacker:setCarry(carryId, carryMultiplier, dyeInitiated, hasDyePack, dyeValueMultiplier)
    local data = {
        carryId = carryId,
        carryMultiplier = carryMultiplier,
        dyeInitiated = dyeInitiated,
        hasDyePack = hasDyePack,
        dyeValueMultiplier = dyeValueMultiplier
    }
    UT.Utility:tableInsert(UT.CarryStacker.bags, data)

    UT.CarryStacker:setBagType()
end

function UT.CarryStacker:dropCarry()
    if #UT.CarryStacker.bags > 0 then
        UT.Utility:removeLastElementFromTable(UT.CarryStacker.bags)

        if #UT.CarryStacker.bags > 0 then
            local data = UT.CarryStacker.bags[#UT.CarryStacker.bags]
            managers.player:set_carry(data.carryId, data.carryMultiplier, data.dyeInitiated, data.hasDyePack, data.dyeValueMultiplier, true)
        end
    end

    UT.CarryStacker:setBagType()
end

function UT.CarryStacker:enable()
    UT.Utility:cloneClass(PlayerManager)
    UT.Utility:cloneClass(CarryInteractionExt)
    UT.Utility:cloneClass(PlayerCarry)

    if not UT.carryVerifyDisabled then
        UT:disableCarryVerify()
    end

    if managers.player:is_carrying() then
        local carryData = managers.player:get_my_carry_data()
        UT.CarryStacker:setCarry(carryData.carry_id, carryData.multiplier, carryData.dye_initiated, carryData.has_dye_pack, carryData.dye_value_multiplier)
    end

    function CarryInteractionExt:_interact_blocked()
        local silentBlock = managers.player:carry_blocked_by_cooldown() or self._unit:carry_data():is_attached_to_zipline_unit()

        if silentBlock then
            return true, silentBlock
        end

        return false
    end

    function CarryInteractionExt:can_select(player)
        if managers.player:carry_blocked_by_cooldown() or self._unit:carry_data():is_attached_to_zipline_unit() then
            return false
        end

        return CarryInteractionExt.super.can_select(self, player)
    end

    function PlayerManager:set_carry(carryId, carryMultiplier, dyeInitiated, hasDyePack, dyeValueMultiplier, ignoreCarryStacker)
        PlayerManager.orig.set_carry(self, carryId, carryMultiplier, dyeInitiated, hasDyePack, dyeValueMultiplier)

        if not ignoreCarryStacker then
            UT.CarryStacker:setCarry(carryId, carryMultiplier, dyeInitiated, hasDyePack, dyeValueMultiplier)
        end
    end

    function PlayerManager:drop_carry(...)
        PlayerManager.orig.drop_carry(self, ...)
        UT.CarryStacker:dropCarry()
    end

    function PlayerManager:force_drop_carry(...)
        if #UT.CarryStacker.bags > 0 then
            while managers.player:is_carrying() do
                PlayerManager.orig.force_drop_carry(self, ...)
                UT.CarryStacker:dropCarry()
            end

            UT.CarryStacker.bags = {}
        end
    end

    function PlayerCarry:update(...)
        PlayerCarry.orig.update(self, ...)

        if self._tweak_data_name ~= UT.CarryStacker.bagType then
            self._tweak_data_name = UT.CarryStacker.bagType
        end
    end
end

function UT.CarryStacker:disable()
    UT.Utility:cloneClass(PlayerManager)
    UT.Utility:cloneClass(CarryInteractionExt)
    UT.Utility:cloneClass(PlayerCarry)

    if UT.GameUtility:isPlaying() and managers.player:is_carrying() then
        managers.player:force_drop_carry()
    end

    PlayerManager.set_carry = PlayerManager.orig.set_carry
    PlayerManager.drop_carry = PlayerManager.orig.drop_carry
    PlayerManager.force_drop_carry = PlayerManager.orig.force_drop_carry
    CarryInteractionExt._interact_blocked = CarryInteractionExt.orig._interact_blocked
    CarryInteractionExt.can_select = CarryInteractionExt.orig.can_select
    PlayerCarry.update = PlayerCarry.orig.update

    UT.CarryStacker.bags = {}
end
