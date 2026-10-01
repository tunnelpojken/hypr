-- ============================================================
--  permissions.lua
--  Changes here require a full Hyprland restart to take effect.
-- ============================================================

-- Uncomment to enforce permission checks
-- hl.config({
--     ecosystem = {
--         enforce_permissions = true,
--     },
-- })

-- Uncomment to grant screencopy access to grim and xdg-desktop-portal-hyprland
-- hl.permission("/usr/(bin|local/bin)/grim",                             "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")

-- Uncomment to allow hyprpm to load plugins
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")
