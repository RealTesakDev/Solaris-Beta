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
        {Name = "Legacy", Value = 0},
        {Name = "Arial", Value = 1},
        {Name = "ArialBold", Value = 2},
        {Name = "SourceSans", Value = 3},
        {Name = "SourceSansBold", Value = 4},
        {Name = "SourceSansSemibold", Value = 5},
        {Name = "SourceSansLight", Value = 6},
        {Name = "SourceSansItalic", Value = 7},
        {Name = "Bodoni", Value = 8},
        {Name = "Garamond", Value = 9},
        {Name = "Cartoon", Value = 10},
        {Name = "Code", Value = 11},
        {Name = "Highway", Value = 12},
        {Name = "SciFi", Value = 13},
        {Name = "Arcade", Value = 14},
        {Name = "Fantasy", Value = 15},
        {Name = "Antique", Value = 16},
        {Name = "Gotham", Value = 17},
        {Name = "GothamSemibold", Value = 18},
        {Name = "GothamBold", Value = 19},
        {Name = "GothamBlack", Value = 20},
        {Name = "AmaticSC", Value = 21},
        {Name = "Bangers", Value = 22},
        {Name = "Creepster", Value = 23},
        {Name = "DenkOne", Value = 24},
        {Name = "Fondamento", Value = 25},
        {Name = "FredokaOne", Value = 26},
        {Name = "GrenzeGotisch", Value = 27},
        {Name = "IndieFlower", Value = 28},
        {Name = "JosefinSans", Value = 29},
        {Name = "Jura", Value = 30},
        {Name = "Kalam", Value = 31},
        {Name = "LuckiestGuy", Value = 32},
        {Name = "Merriweather", Value = 33},
        {Name = "Michroma", Value = 34},
        {Name = "Nunito", Value = 35},
        {Name = "Oswald", Value = 36},
        {Name = "PatrickHand", Value = 37},
        {Name = "PermanentMarker", Value = 38},
        {Name = "Roboto", Value = 39},
        {Name = "RobotoCondensed", Value = 40},
        {Name = "RobotoMono", Value = 41},
        {Name = "SourceCodePro", Value = 42},
        {Name = "SpecialElite", Value = 43},
        {Name = "Ubuntu", Value = 44}
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
