UT.Utils:cloneClass(BootupState)
function BootupState:setup()
    UT:runServer()

    BootupState.orig.setup(self)
end
