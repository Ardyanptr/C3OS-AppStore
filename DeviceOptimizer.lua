---@diagnostic disable: undefined-global

-- Device Optimizer

local ram_before = c3_get_heap()
local status = "System: Ready"
local progress = 0

function DrawOpti()
    c3_cls()
    c3_print("--- C3 Optimizer ---", 15, 5)
    c3_draw_hline(0, 8, 128)

    c3_print("Status: " .. status, 5, 20)
    c3_print("RAM Free: " .. ram_before .. " B", 5, 30)

    c3_draw_frame(5, 40, 118, 10)
    c3_draw_box(5, 40, progress, 10)

    c3_update()
end

while true do
    DrawOpti()
    
    status = "Cleaning RAM..."
    for i = 1, 100, 10 do
        progress = i
        c3_delay(50)
        DrawOpti()
    end

    collectgarbage("collect")

    status = "Done! RAM Freed."
    progress = 118
    c3_delay(1000)

    status = "System: Optimized"
    progress = 0

    c3_delay(5000)
    break
end