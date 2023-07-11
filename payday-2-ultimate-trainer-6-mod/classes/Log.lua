UT.Log = {}

UT.Log.OFF = 0
UT.Log.ALL = 10

UT.Log.DEBUG = 1
UT.Log.INFO = 2
UT.Log.WARNING = 3
UT.Log.ERROR = 4
UT.Log.FATAL = 5

function UT.Log:log(level, message)
    log("UT " .. level .. " " .. UT.Utility:toString(message))
end

function UT.Log:debug(message)
    if UT_LOG_LEVEL >= UT.Log.DEBUG then
        UT.Log:log("DEBUG", message)
    end
end

function UT.Log:info(message)
    if UT_LOG_LEVEL >= UT.Log.INFO then
        UT.Log:log("INFO", message)
    end
end

function UT.Log:warning(message)
    if UT_LOG_LEVEL >= UT.Log.WARNING then
        UT.Log:log("WARNING", message)
    end
end

function UT.Log:error(message)
    if UT_LOG_LEVEL >= UT.Log.ERROR then
        UT.Log:log("ERROR", message)
    end
end

function UT.Log:fatal(message)
    if UT_LOG_LEVEL >= UT.Log.FATAL then
        UT.Log:log("FATAL", message)
    end
end
