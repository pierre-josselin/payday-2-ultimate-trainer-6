UT.Utils = {}

function UT.Utils:toString(value)
    return tostring(value)
end

function UT.Utils:inTable(element, table)
    for key, value in pairs(table) do
        if value == element then
            return true
        end
    end
    return false
end

function UT.Utils:isEmptyTable(value)
    return next(value) == nil
end

function UT.Utils:tableInsert(_table, value)
    table.insert(_table, value)
end

function UT.Utils:tableJoin(_table, separator)
    return table.concat(_table, separator)
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

function UT.Utils:getClock()
    return os.clock()
end

function UT.Utils:buildQueryString(query)
    local parts = {}
    for key, value in pairs(query) do
        local part = UT.Utils:toString(key) .. "=" .. UT.Utils:toString(value)
        UT.Utils:tableInsert(parts, part)
    end
    return UT.Utils:tableJoin(parts, "&")
end

function UT.Utils:cloneClass(class)
    _G.CloneClass(class)
end

function UT.Utils:deepClone(element)
    return deep_clone(element)
end
