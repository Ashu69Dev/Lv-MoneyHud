Config = {}

-- Toggle command & default visibility
Config.ToggleCommand = 'hud'      -- /hud to hide/show
Config.VisibleByDefault = true

-- What to show
Config.ShowCash = true
Config.ShowBank = true
Config.ShowJob = true
Config.ShowId  = true

-- Glass HUD position & scale (tweak to taste)
Config.Position = { right = 32, top = 32 } -- pixels from screen edges
Config.Scale = 1.0                         -- 0.8 = smaller, 1.2 = bigger

-- Logo path (already included as html/img/logo.png). Replace file to customize.
Config.Logo = 'img/logo.png'

-- Update tick: we still listen to QB events, but we also refresh as a fallback
Config.RefreshIntervalMs = 2500
