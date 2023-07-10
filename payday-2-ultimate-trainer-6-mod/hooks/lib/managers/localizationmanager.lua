UT.Utility:cloneClass(LocalizationManager)
function LocalizationManager:init(...)
    LocalizationManager.orig.init(self, ...)

    local locale = UT.GameUtility:getModsLocale()
    self:load_localization_file(UT.modPath .. "/payday-2-ultimate-trainer-6-mod/locales/" .. locale .. ".json")
end
