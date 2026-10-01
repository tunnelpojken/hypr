-- ============================================================
--  input.lua
-- ============================================================

hl.config({
    input = {
        kb_layout    = "se",   -- Swedish keyboard layout
        kb_variant   = "",
        kb_model     = "",
        kb_options   = "",
        kb_rules     = "",
        follow_mouse = 1,
        sensitivity  = 0,      -- -1.0 to 1.0, 0 = no modification

        touchpad = {
            natural_scroll = false,
        },
    },
})

-- 3-finger horizontal swipe → switch workspace
hl.gesture({
    fingers   = 3,
    direction = "horizontal",
    action    = "workspace",
})

-- Per-device sensitivity override
hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})
