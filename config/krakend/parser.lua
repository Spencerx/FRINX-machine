-- parsing query
function split(s, delimiter, r)
    result = {};
    for match in (s..delimiter):gmatch("(.-)"..delimiter) do
        key, value = match:match("([^,]+)=([^,]+)")
        print(key, value)
        if key == "code" then
            r:headers(key,value)
        end
    end
end

local r=ctx.load()
split(r:url(),'&', r)
r:headers("Content-Type", "application/x-www-form-urlencoded")
local code=r:headers('Code')
local body="grant_type=authorization_code"
body=body .. "&code=" .. code
body=body .. "&client_id=frinx-machine"
body=body .. "&client_secret=0ee8d5b6-e98f-4d52-b608-eda23e48d38f"
body=body .. "&redirect_uri=http://10.255.246.93/token"
r:body(body)
