return {
    Enabled = true,
    FullBright = false,
    NoFog = false,
    Exploits = {
        flying = false,
        flySpeed = 180,
        verticalSpeed = 200,
        movementDirection = Vector3.new(0, 0, 0),
        flykey = Enum.KeyCode.Z,
        MoveSpeed = 100,
        NoFall = false
    },
    Combat = {
        NoStunEnabled = false,
        NoKnockbackEnabled = false,
        AutoParryEnabled = false,
        NoShipDamageEnabled = false,
        ShipSpeedBoostEnabled = false,
        SilentAimEnabled = false,
        AntiAimEnabled = false
    },
    Misc = {
        TrainCharisma = false,
        TrainIntelligence = false,
        WalkSpeedEnabled = false,
        WalkSpeed = 25,
        JumpPowerEnabled = false,
        JumpPower = 100,
        NoclipEnabled = false,
        NoFallDamageEnabled = false
    },
    Keybinds = {
        NoclipEnabled = false
    },
    Fonts = {
        {Name = "Legacy", Value = 0}
        -- Add rest of your fonts here if needed
    },
    Chests = {
        Enabled = true,
        MaxDistance = 1000,
        ShowDistance = true,
        RefreshRate = 0.1,
        Text = {
            Enabled = true,
            Font = 2,
            Size = 13,
            Color = Color3.new(1.000000, 0.901961, 0.000000),
            Outline = true,
            OutlineColor = Color3.fromRGB(0, 0, 0)
        },
        Tracer = {
            Enabled = false,
            Color = Color3.fromRGB(255, 255, 0),
            Thickness = 1,
            Origin = "Bottom",
            Transparency = 0.7
        }
    },
    Mobs = {
        Enabled = true,
        MaxDistance = 1000,
        ShowDistance = true,
        ShowHealth = true,
        RefreshRate = 0.1,
        Text = {
            Enabled = true,
            Font = 2,
            Size = 13,
            Color = Color3.new(1.000000, 0.000000, 0.000000),
            Outline = true,
            OutlineColor = Color3.fromRGB(0, 0, 0)
        },
        Tracer = {
            Enabled = false,
            Color = Color3.fromRGB(255, 255, 255),
            Thickness = 1,
            Origin = "Bottom",
            Transparency = 0.7
        }
    },
    Players = {
        Enabled = true,
        MaxDistance = 1000,
        ShowDistance = true,
        ShowHealth = true,
        IgnoreTeammates = false,
        RefreshRate = 0.1,
        ProximityNotificationsEnabled = false,
        ProximityNotificationDistance = 500,
        EnemyColor = Color3.fromRGB(255, 0, 0),
        Text = {
            Enabled = true,
            Font = 2,
            Size = 13,
            Color = Color3.new(0.117647, 1.000000, 0.000000),
            Outline = true,
            OutlineColor = Color3.fromRGB(0, 0, 0)
        },
        HealthBar = {
            Enabled = true,
            Height = 4000,
            Width = 2,
            Color = Color3.fromRGB(0, 255, 0),
            BackgroundColor = Color3.fromRGB(255, 0, 0),
            Outline = true,
            OutlineColor = Color3.fromRGB(0, 0, 0)
        },
        Tracer = {
            Enabled = false,
            Color = Color3.fromRGB(0, 255, 255),
            Thickness = 1,
            Origin = "Bottom",
            Transparency = 0.7
        }
    }
}
