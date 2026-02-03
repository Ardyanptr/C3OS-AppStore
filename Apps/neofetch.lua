---@diagnostic disable: undefined-global

local running = true

c3_cls()
c3_update()

c3_drawBitmap(3, 9, 11, 11, "image_C3_bits")
c3_drawBitmap(10, 16, 37, 36, "image_RFIDBigChip_bits")

c3_set_font(1)
c3_print("Neofetch", 50, 16)
c3_print("OS: C3OS v..4b", 50, 27)
c3_print("Kernel: Lua 5.4", 50, 34)
c3_print("Uptime: " .. math.floor(os.clock() / 1000) .. "s", 50, 41)
c3_print("Model: ESP32-C3", 50, 48)

c3_update()

while running do
    c3_update()

    local ev = c3_btn("ok")
    if ev == 3 or ev == 2 then
        running = false
    end

    c3_sleep(30)
end