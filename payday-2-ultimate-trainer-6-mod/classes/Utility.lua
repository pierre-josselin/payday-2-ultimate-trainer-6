UT.Utility = {}

function UT.Utility:cloneClass(class)
    _G.CloneClass(class)
end

function UT.Utility:deepClone(element)
    return deep_clone(element)
end

function UT.Utility:toString(value)
    return tostring(value)
end

function UT.Utility:toBoolean(value)
    return value and true or false
end

function UT.Utility:booleanToInteger(value)
    return value and 1 or 0
end

function UT.Utility:stringLength(value)
    return string.len(value)
end

function UT.Utility:subString(value, startIndex, endIndex)
    return string.sub(value, startIndex, endIndex)
end

function UT.Utility:stringStartsWith(value, start)
    return UT.Utility:subString(value, 1, UT.Utility:stringLength(start)) == start
end

function UT.Utility:isEmptyString(value)
    return value == ""
end

function UT.Utility:isEmptyTable(value)
    return next(value) == nil
end

function UT.Utility:inTable(element, table)
    for key, value in pairs(table) do
        if value == element then
            return true
        end
    end
    return false
end

function UT.Utility:tableInsert(_table, value)
    table.insert(_table, value)
end

function UT.Utility:tableJoin(_table, separator, startIndex, endIndex)
    return table.concat(_table, separator, startIndex, endIndex)
end

function UT.Utility:removeLastElementFromTable(_table)
    return table.remove(_table)
end

function UT.Utility:jsonEncode(value)
    return json.encode(value)
end

function UT.Utility:jsonDecode(value)
    return json.decode(value)
end

function UT.Utility:buildQueryString(query)
    local parts = {}
    for key, value in pairs(query) do
        local part = UT.Utility:toString(key) .. "=" .. UT.Utility:toString(value)
        UT.Utility:tableInsert(parts, part)
    end
    return UT.Utility:tableJoin(parts, "&")
end

function UT.Utility:callFunction(name, ...)
    return loadstring("return " .. name .. "(...)")(...)
end

function UT.Utility:httpRequest(url, callback)
    if not callback then
        callback = function() end
    end
    dohttpreq(url, callback)
end

function UT.Utility:fileExists(filePath)
    return io.file_is_readable(filePath)
end

function UT.Utility:readFile(filePath)
    if not UT.Utility:fileExists(filePath) then
        return false
    end
    local file = io.open(filePath, "r")
    if not file then
        return false
    end
    local content = file:read("*all")
    file:close()
    return content
end

function UT.Utility:writeFile(filePath, content, mode)
    local file = io.open(filePath, mode or "w+")
    if not file then
        return false
    end
    file:write(content)
    file:close()
    return true
end

function UT.Utility:removeFile(filePath)
    return os.remove(filePath) == true
end

function UT.Utility:getClock()
    return os.clock()
end
