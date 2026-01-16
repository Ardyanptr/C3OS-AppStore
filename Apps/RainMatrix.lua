---@diagnostic disable: undefined-global

local running = true
local drops = {}

local screen_w = 128
local screen_h = 64

local num_drops = 15

for i = 1, num_drops do
    drops[i] = {
        x = math.random(0, screen_w - 5);
        y = math.random(-screen_h, 0),
        speed = math.random(3, 7);
        char = math.random(0, 9);
    }
end

while running do
    c3_cls()

    for i = 1, num_drops do
        c3_print(tostring(drops[i].char), drops[i].x, drops[i].y)
        
        drops[i].y = drops[i].y + drops[i].speed

        if math.random(1, 10) > 8 then
            drops[i].char = math.random(0, 9);
        end

        if drops[i].y > screen_h then
            drops[i].y = math.random(-20, 0)
            drops[i].x = math.random(0, screen_w - 5)
            drops[i].speed = math.random(3, 7)
        end
    end

    c3_update()

    local ev = c3_btn("ok")
    if ev == 3 or ev == 2 then
        running = false
    end

    c3_sleep(30)
end

c3_cls()
c3_update()