---@diagnostic disable: undefined-global

local city = "Pandaan";
local data = c3_get_weather(city);

local busy = false

while true do
    c3_cls()

    c3_print("Weather In", 35, 5)
    c3_print(string.upper(city), 40, 15)
    c3_draw_hline(0, 18, 128)

    if busy then
        c3_print("Loading...", 35, 40)
    elseif data then
        c3_print(math.floor(data.temp) .. " Celcius", 30, 35)
        c3_print("Status: " .. data.desc, 10, 50)
        c3_print("Humidity " .. data.hum .. "%", 10, 60)
    else
        c3_print("Press OK to load!", 25, 40)
    end

    c3_update()

    local ev = c3_btn("ok")
    if ev == 1 and not busy then
        busy = true
        data = c3_get_weather(city)
        busy = false
    elseif ev == 2 then
        break
    end

    c3_sleep(50)
end