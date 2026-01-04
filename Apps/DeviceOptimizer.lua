---@diagnostic disable: undefined-global

local status = "Cleaning RAM..."
local progress = 0

function DrawOpti()
    c3_cls()
    c3_set_font(1)

    c3_print("C3 Optimizer", 20, 7)
    c3_draw_hline(0, 9, 128)

    c3_print("Status: "..status, 5, 22)
    c3_print("RAM: "..c3_get_heap().." B", 5, 32)

    c3_draw_frame(5, 44, 118, 8)

    local bar = math.floor(progress * 118 / 100)
    c3_draw_box(5, 44, bar, 8)

    c3_update()
end

while progress < 100 do
    progress = progress + 5
    DrawOpti()
    c3_sleep(40)
end

collectgarbage()

status = "Optimized"
DrawOpti()

