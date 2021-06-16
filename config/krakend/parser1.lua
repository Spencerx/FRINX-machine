local r=request.load()
local code = r:headers("Code")


local body=r:body()

r:headers("Content-Length", tostring(body:len()))
r:method("POST")

function splitMe(delimiter, r)
    delimit=','
    result = {};
    local s = r:body()
    print(s)
    for match in (s..delimit):gmatch("(.-)"..delimit) do
        key, value = match:match("([^,]+):([^,]+)")
        if string.find(key, "access_token") then
            local token = (value:gsub('%"', ''))
            print (token)
            local token_name="KEYCLOAK_TOKEN"
            local cookie1    = token_name .. "=" .. token .. "; Path=/auth/realms/master/; Expires=" .. "Session"
                r:headers("Set-Cookie", cookie1)
        end
    end
end