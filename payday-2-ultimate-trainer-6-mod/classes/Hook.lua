UT.Hook = {}

function UT.Hook:localizationManager()
    UT.Utility:cloneClass(LocalizationManager)
    function LocalizationManager:init(...)
        LocalizationManager.orig.init(self, ...)

        local locale = UT:getLocale()
        self:load_localization_file(UT.modPath .. "/locales/" .. locale .. ".json")
    end
end

function UT.Hook:menuManager()
    UT.Utility:cloneClass(MenuManager)

    function MenuManager:open_menu(menuName, ...)
        if menuName == "menu_pause" and UT.GameUtility:isInHeist() and UT.GameUtility:isInSinglePlayer() then
            UT:sendGamePaused(true)
        end
        MenuManager.orig.open_menu(self, menuName, ...)
    end

    function MenuManager:close_menu(menuName, ...)
        if menuName == "menu_pause" and UT.GameUtility:isInHeist() and UT.GameUtility:isInSinglePlayer() then
            UT:sendGamePaused(false)
        end
        MenuManager.orig.close_menu(self, menuName, ...)
    end

    function MenuCallbackHandler:ut_open_app()
        UT:openApp()
    end

    if UT:getSetting("enable-hide-mod-list") then
        function MenuCallbackHandler:is_modded_client()
            return false
        end

        function MenuCallbackHandler:is_not_modded_client()
            return true
        end

        function MenuCallbackHandler:build_mods_list()
            return {}
        end
    end
end

function UT.Hook:skillTreeManager()
    if UT:getSetting("enable-skill-point-hack") and UT:getSetting("skill-points") then
        UT.Utility:cloneClass(SkillTreeManager)
        function SkillTreeManager:_verify_loaded_data()
            SkillTreeManager.orig._verify_loaded_data(self, UT:getSetting("skill-points") - managers.experience:current_level())
        end
    end
end

function UT.Hook:networkAccountEpic()
    if UT:getSetting("enable-pause-stats-publishing") then
        function NetworkAccountEPIC:publish_statistics() end
    end
end

function UT.Hook:networkAccountSteam()
    if UT:getSetting("enable-pause-stats-publishing") then
        function NetworkAccountSTEAM:publish_statistics() end
    end
end

function UT.Hook:gameSetup()
    local packages = {}

    table.insert(packages, "levels/instances/unique/hox_fbi_armory/world")
    table.insert(packages, "levels/instances/unique/hlm_reader/world")
    table.insert(packages, "levels/instances/unique/mus_security_barrier/world")
    table.insert(packages, "levels/instances/unique/hlm_box_contraband001/world")
    table.insert(packages, "levels/instances/unique/pbr/pbr_plane/world")
    table.insert(packages, "levels/instances/unique/hlm_random_right003/world")
    table.insert(packages, "levels/instances/unique/hlm_door_wooden_white_green/world")
    table.insert(packages, "levels/instances/unique/hlm_vault/world")
    table.insert(packages, "levels/instances/unique/san_box001/world")

    if UT:getSetting("vehicles-to-load") then
        if UT.Utility:inTable("sport-car", UT:getSetting("vehicles-to-load")) then
            table.insert(packages, "levels/narratives/bain/cage/world/world")
        end

        if UT.Utility:inTable("muscle-car", UT:getSetting("vehicles-to-load")) or UT.Utility:inTable("forklift", UT:getSetting("vehicles-to-load")) then
            table.insert(packages, "levels/narratives/vlad/shout/world/world")
        end

        if UT.Utility:inTable("bike", UT:getSetting("vehicles-to-load")) then
            table.insert(packages, "levels/narratives/elephant/born/world/world")
        end

        if UT.Utility:inTable("truck", UT:getSetting("vehicles-to-load")) then
            table.insert(packages, "levels/narratives/vlad/jolly/world/world")
        end

        if UT.Utility:inTable("golf-cart", UT:getSetting("vehicles-to-load")) then
            table.insert(packages, "levels/narratives/mcshay/ranc/world/world")
        end

        if UT.Utility:inTable("boat", UT:getSetting("vehicles-to-load")) then
            table.insert(packages, "levels/narratives/pbr/jerry/world/world")
        end
    end

    for index, value in pairs(packages) do
        if not PackageManager:package_exists(value) then
            goto continue
        end
        if PackageManager:loaded(value) then
            goto continue
        end
        PackageManager:load(value)
        ::continue::
    end
end

function UT.Hook:bootupState()
    UT.Utility:cloneClass(BootupState)
    function BootupState:setup()
        if not UT_DEV then
            UT:runServer()
        end
        BootupState.orig.setup(self)
    end
end

function UT.Hook:ingameWaitingForPlayers()
    UT.Utility:cloneClass(IngameWaitingForPlayersState)

    function IngameWaitingForPlayersState:at_enter(...)
        UT:gameEnterEvent()
        IngameWaitingForPlayersState.orig.at_enter(self, ...)
    end

    function IngameWaitingForPlayersState:at_exit(...)
        UT:heistEnterEvent()
        IngameWaitingForPlayersState.orig.at_exit(self, ...)
    end
end
