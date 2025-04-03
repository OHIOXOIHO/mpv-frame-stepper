local function step_frame(direction)
    return function()
        if direction == "forward" then
            mp.command("frame-step")
        elseif direction == "backward" then
            mp.command("frame-back-step")
        end
        -- Show current playback time to verify frame movement
        local time = mp.get_property_number("playback-time", 0)
        mp.osd_message("Current time: " .. string.format("%.3f", time) .. "s", 1)
    end
end

mp.add_key_binding("Shift+RIGHT", "step-frame-forward", step_frame("forward"), { repeatable = false })
mp.add_key_binding("Shift+LEFT", "step-frame-backward", step_frame("backward"), { repeatable = false })