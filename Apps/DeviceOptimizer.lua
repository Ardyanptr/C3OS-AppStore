---@diagnostic disable: undefined-global

local status = "System: Ready"
local progress = 0

function DrawOpti()
    c3_cls()
    c3_set_font(1)

    c3_print("--- C3 Optimizer ---", 15, 7)
    c3_draw_hline(0, 9, 128)

    local ram = c3_get_heap()

    c3_print("Status: " .. status, 5, 22)
    c3_print("RAM Free: " .. ram .. " B", 5, 32)

    c3_draw_frame(5, 44, 118, 8)
    c3_draw_box(5, 44, progress * 118 / 100, 8)

    c3_update()
end

DrawOpti()

status = "Cleaning RAM..."
for i = 0, 100, 10 do
    progress = i
    DrawOpti()
    c3_sleep(60)
end

---@diagnostic disable-next-line: param-type-mismatch
collectgarbage("setpause", 110)
---@diagnostic disable-next-line: param-type-mismatch
collectgarbage("setstepmul", 200)

status = "Done!"
progress = 100
DrawOpti()
c3_sleep(1200)

status = "System: Optimized"
progress = 0
DrawOpti()