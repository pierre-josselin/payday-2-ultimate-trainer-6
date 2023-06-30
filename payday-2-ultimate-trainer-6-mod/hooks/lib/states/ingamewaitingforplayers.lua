UT.Utility:cloneClass(IngameWaitingForPlayersState)

function IngameWaitingForPlayersState:at_enter(...)
    UT:enterGame()

    IngameWaitingForPlayersState.orig.at_enter(self, ...)
end

function IngameWaitingForPlayersState:at_exit(...)
    UT:enterHeist()

    IngameWaitingForPlayersState.orig.at_exit(self, ...)
end
