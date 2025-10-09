local StrUtils = {}

function StrUtils.StringToBool(str)
    local bool = false
    if str == "true" then
        bool = true
    end
    return bool
end

return StrUtils