UT.Utils = {}

function UT.Utils:isEmptyTable(value)
    return next(value) == nil
end

function UT.Utils:jsonEncode(value)
    return json.encode(value)
end

function UT.Utils:jsonDecode(value)
    return json.decode(value)
end

function UT.Utils:callFunction(name, ...)
    return loadstring("return " .. name .. "(...)")(...)
end

function UT.Utils:httpRequest(url, callback)
    dohttpreq(url, callback)
end
