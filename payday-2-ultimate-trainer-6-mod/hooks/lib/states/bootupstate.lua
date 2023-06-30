UT.Utility:cloneClass(BootupState)
function BootupState:setup()
    if not UT_DEV then
        UT:runServer()
    end

    BootupState.orig.setup(self)
end
