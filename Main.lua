local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Lighting = game:GetService("Lighting")
local LocalPlayer = Players.LocalPlayer
local camera = workspace.CurrentCamera


local ESP = {
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
        NoFall = false -- Default state
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
            Enabled = false, -- Changed to false by default
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
            Enabled = false, -- Changed to false by default
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
            Enabled = false, -- Changed to false by default
            Color = Color3.fromRGB(0, 255, 255),
            Thickness = 1,
            Origin = "Bottom",
            Transparency = 0.7
        }
    }
}

local repo = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

local Window = Library:CreateWindow({
    Title = 'ESP & Exploits Menu',
    Center = true,
    AutoShow = true,
})

-- Create main tabs
local Tabs = {
    ESP = Window:AddTab('ESP'),
    Exploits = Window:AddTab('Exploits'),
    Misc = Window:AddTab('Misc'),
    ['UI Settings'] = Window:AddTab('UI Settings'),
}

local fontNames = {}
for _, font in ipairs(ESP.Fonts) do
    table.insert(fontNames, font.Name)
end

-- ESP Settings
local ESPMainBox = Tabs.ESP:AddLeftGroupbox('Main ESP Settings')
ESPMainBox:AddToggle('MainESPEnabled', {
    Text = 'Enable ESP',
    Default = ESP.Enabled,
    Tooltip = 'Toggle all ESP features',
    
    Callback = function(Value)
        ESP.Enabled = Value
    end
})

-- Players ESP
local PlayerESPBox = Tabs.ESP:AddRightGroupbox('Players ESP')
PlayerESPBox:AddToggle('PlayersESPEnabled', {
    Text = 'Enable Players ESP',
    Default = ESP.Players.Enabled,
    Callback = function(Value)
        ESP.Players.Enabled = Value
    end
})

PlayerESPBox:AddToggle('PlayerShowDistance', {
    Text = 'Show Distance',
    Default = ESP.Players.ShowDistance,
    Callback = function(Value)
        ESP.Players.ShowDistance = Value
    end
})

PlayerESPBox:AddToggle('PlayerShowHealth', {
    Text = 'Show Health',
    Default = ESP.Players.ShowHealth,
    Callback = function(Value)
        ESP.Players.ShowHealth = Value
    end
})

PlayerESPBox:AddToggle('PlayerIgnoreTeammates', {
    Text = 'Ignore Teammates',
    Default = ESP.Players.IgnoreTeammates,
    Callback = function(Value)
        ESP.Players.IgnoreTeammates = Value
    end
})

PlayerESPBox:AddSlider('PlayerMaxDistance', {
    Text = 'Max Distance',
    Default = ESP.Players.MaxDistance,
    Min = 100,
    Max = 5000,
    Rounding = 0,
    Callback = function(Value)
        ESP.Players.MaxDistance = Value
    end
})


PlayerESPBox:AddSlider('PlayerTextSize', {
    Text = 'Text Size',
    Default = ESP.Players.Text.Size,
    Min = 8,
    Max = 24,
    Rounding = 0,
    Callback = function(Value)
        ESP.Players.Text.Size = Value
    end
})

PlayerESPBox:AddDropdown('PlayerTextFont', {
    Values = fontNames,
    Default = 2, -- Default to Arial Bold
    Multi = false,
    
    Text = 'Font',
    Tooltip = 'Select the font for player ESP text',

    Callback = function(Value)
        -- Find the font value from the name
        for _, font in ipairs(ESP.Fonts) do
            if font.Name == Value then
                ESP.Players.Text.Font = font.Value
                break -- Exit the loop once we find the matching font
            end
        end
    end
})

-- Mobs ESP
local MobsESPBox = Tabs.ESP:AddLeftGroupbox('Mobs ESP')
MobsESPBox:AddToggle('MobsESPEnabled', {
    Text = 'Enable Mobs ESP',
    Default = ESP.Mobs.Enabled,
    Callback = function(Value)
        ESP.Mobs.Enabled = Value
    end
})

MobsESPBox:AddToggle('MobsShowDistance', {
    Text = 'Show Distance',
    Default = ESP.Mobs.ShowDistance,
    Callback = function(Value)
        ESP.Mobs.ShowDistance = Value
    end
})

MobsESPBox:AddToggle('MobsShowHealth', {
    Text = 'Show Health',
    Default = ESP.Mobs.ShowHealth,
    Callback = function(Value)
        ESP.Mobs.ShowHealth = Value
    end
})

MobsESPBox:AddSlider('MobsMaxDistance', {
    Text = 'Max Distance',
    Default = ESP.Mobs.MaxDistance,
    Min = 100,
    Max = 5000,
    Rounding = 0,
    Callback = function(Value)
        ESP.Mobs.MaxDistance = Value
    end
})


MobsESPBox:AddDropdown('MobTextFont', {
    Values = fontNames,
    Default = 'ArialBold', -- Or use 2 if you prefer using the index
    Multi = false,
    
    Text = 'Font',
    Tooltip = 'Select the font for mob ESP text',

    Callback = function(Value)
        for _, font in ipairs(ESP.Fonts) do
            if font.Name == Value then
                ESP.Mobs.Text.Font = font.Value
                -- Update existing ESP objects
                for mob, espObject in pairs(espObjects) do
                    if espObject.UpdateFont then
                        espObject:UpdateFont()
                    end
                end
                break
            end
        end
    end
})

-- Chests ESP
local ChestsESPBox = Tabs.ESP:AddLeftGroupbox('Chests ESP')
ChestsESPBox:AddToggle('ChestsESPEnabled', {
    Text = 'Enable Chests ESP',
    Default = ESP.Chests.Enabled,
    Callback = function(Value)
        ESP.Chests.Enabled = Value
    end
})

ChestsESPBox:AddToggle('ChestsShowDistance', {
    Text = 'Show Distance',
    Default = ESP.Chests.ShowDistance,
    Callback = function(Value)
        ESP.Chests.ShowDistance = Value
    end
})

ChestsESPBox:AddSlider('ChestsMaxDistance', {
    Text = 'Max Distance',
    Default = ESP.Chests.MaxDistance,
    Min = 100,
    Max = 5000,
    Rounding = 0,
    Callback = function(Value)
        ESP.Chests.MaxDistance = Value
    end
})

-- Chest Text Settings
ChestsESPBox:AddDropdown('ChestTextFont', {
    Values = fontNames,
    Default = 'ArialBold', -- Or use 2 if you prefer using the index
    Multi = false,
    
    Text = 'Font',
    Tooltip = 'Select the font for chest ESP text',

    Callback = function(Value)
        for _, font in ipairs(ESP.Fonts) do
            if font.Name == Value then
                ESP.Chests.Text.Font = font.Value
                -- Update existing ESP objects
                for chest, espObject in pairs(espObjects) do
                    if espObject.UpdateFont then
                        espObject:UpdateFont()
                    end
                end
                break
            end
        end
    end
})

-- Exploits Tab
local ExploitsBox = Tabs.Exploits:AddLeftGroupbox('Movement Exploits')

ExploitsBox:AddToggle('FlyingEnabled', {
    Text = 'Flying',
    Default = ESP.Exploits.flying, -- Set default state from ESP settings
    Tooltip = 'Toggle flying ability',

    Callback = function(Value)
        ESP.Exploits.flying = Value
        print('Flying toggled:', Value)
    end
}):AddKeyPicker('FlyKey', {
    -- Set default keybind from ESP settings
    Default = "Z",
    SyncToggleState = true, -- Sync with the toggle state
    Mode = 'Toggle', -- Modes: Always, Toggle, Hold
    Text = 'Flying', -- Text to display in the keybind menu
    NoUI = false, -- Show in the keybind menu

    -- Occurs when the keybind is pressed
    Callback = function(Value)
        ESP.Exploits.flying = Value
        print('Flying keybind pressed:', Value)
    end,

    -- Occurs when the keybind itself is changed
    ChangedCallback = function(New)
        ESP.Exploits.flykey = New
        print('Flying keybind changed to:', New)
    end
})

ExploitsBox:AddSlider('FlySpeed', {
    Text = 'Fly Speed',
    Default = ESP.Exploits.flySpeed,
    Min = 16,
    Max = 500,
    Rounding = 0,
    Tooltip = 'Adjust flying speed',

    Callback = function(Value)
        ESP.Exploits.flySpeed = Value
        print('Fly speed changed to:', Value)
    end
})

ExploitsBox:AddSlider('VerticalSpeed', {
    Text = 'Vertical Speed',
    Default = ESP.Exploits.verticalSpeed,
    Min = 16,
    Max = 500,
    Rounding = 0,
    Tooltip = 'Adjust vertical flying speed',

    Callback = function(Value)
        ESP.Exploits.verticalSpeed = Value
        print('Vertical speed changed to:', Value)
    end
})

ExploitsBox:AddToggle('NoFallEnabled', {
    Text = 'No Fall Damage',
    Default = ESP.Exploits.NoFall,
    Callback = function(Value)
        ESP.Exploits.NoFall = Value
    end
})

local AdditionalFeaturesBox = Tabs.Misc:AddLeftGroupbox('World')

AdditionalFeaturesBox:AddToggle('FullBrightEnabled', {
    Text = 'Full Bright (Placeholder)',
    Default = false,
    Tooltip = 'Toggle Full Bright (Not fully implemented)',
    Callback = function(Value)
        ESP.FullBright = Value
        if Value then
            Lighting.Brightness = 2
            Lighting.GlobalShadows = false
        else
            Lighting.Brightness = 1
            Lighting.GlobalShadows = true
        end
        print('Full Bright toggled:', Value)
    end
})

AdditionalFeaturesBox:AddToggle('NoFog', {
    Text = 'NoFog',
    Default = false,
    Tooltip = 'Toggle NoFog',

    Callback = function(Value)
        ESP.NoFog = Value
        if Value then
            local Lighting = game:GetService("Lighting")
            Lighting.FogEnd = 1000000
            Lighting.FogStart = 0

            local atmosphere = Lighting:FindFirstChild('Atmosphere')
            if atmosphere then
                atmosphere.Density = 0
                atmosphere.Offset = 0
                atmosphere.Color = Color3.new(1, 1, 1)
                atmosphere.Decay = Color3.new(1, 1, 1) -- Only needed once
            end
        end
    end
})


-- UI Settings
local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')

MenuGroup:AddButton('Unload', function() Library:Unload() end)
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'End', NoUI = true, Text = 'Menu keybind' })

-- Initialize Theme and Save Managers
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({ 'MenuKeybind' })

ThemeManager:SetFolder('ESPConfig')
SaveManager:SetFolder('ESPConfig/specific-game')

SaveManager:BuildConfigSection(Tabs['UI Settings'])
ThemeManager:ApplyToTab(Tabs['UI Settings'])

Library.ToggleKeybind = Options.MenuKeybind

local hook
hook = hookmetamethod(game, "__namecall", function(Self, ...)
    if not checkcaller() then
        local methodName = getnamecallmethod()
        local args = {...}

        -- Check for conditions to block fall damage
        if ESP.Exploits.NoFall then
            if tostring(methodName) == "FireServer" and getcallingscript().Name == "WorldClient" and type(args[1]) == "number" and type(args[2]) == "boolean" then
                -- Modify the first argument to prevent fall damage
                args[1] = 0.1
                return hook(Self, unpack(args)) -- Pass modified arguments to the original function
            end
        end
    end

    -- Call the original method if conditions aren't met
    return hook(Self, ...)
end)

local function updateMovementDirection()
    movementDirection = Vector3.new(0, 0, 0) -- Reset direction every frame
    
    -- Horizontal movement
    if UserInputService:IsKeyDown(Enum.KeyCode.W) then
        movementDirection = movementDirection + camera.CFrame.LookVector
    end
    if UserInputService:IsKeyDown(Enum.KeyCode.S) then
        movementDirection = movementDirection - camera.CFrame.LookVector
    end
    if UserInputService:IsKeyDown(Enum.KeyCode.A) then
        movementDirection = movementDirection - camera.CFrame.RightVector
    end
    if UserInputService:IsKeyDown(Enum.KeyCode.D) then
        movementDirection = movementDirection + camera.CFrame.RightVector
    end
    
    -- Vertical movement
    if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
        movementDirection = movementDirection + Vector3.new(0, 1, 0)
    end
    if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
        movementDirection = movementDirection - Vector3.new(0, 1, 0)
    end
    
    -- Normalize the direction and apply speed
    if movementDirection.Magnitude > 0 then
        movementDirection = movementDirection.Unit
    end
end

local function fly()
    if ESP.Exploits.flying and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local horizontalVelocity = Vector3.new(
            movementDirection.X * ESP.Exploits.flySpeed,
            movementDirection.Y * ESP.Exploits.verticalSpeed,
            movementDirection.Z * ESP.Exploits.flySpeed
        )
        LocalPlayer.Character.HumanoidRootPart.Velocity = horizontalVelocity
    end
end

local function onFlyToggle()
    ESP.Exploits.flying = not ESP.Exploits.flying
    if ESP.Exploits.flying then
        -- Disable character animations
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.PlatformStand = true
        end
    else
        -- Re-enable character animations and reset velocity
        if LocalPlayer.Character then
            if LocalPlayer.Character:FindFirstChild("Humanoid") then
                LocalPlayer.Character.Humanoid.PlatformStand = false
            end
            if LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
            end
        end
    end
end

-- Main loop
RunService.RenderStepped:Connect(function()
    if ESP.Exploits.flying then
        updateMovementDirection()
        fly()
    end
end)

-- Toggle flying with F key
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == ESP.Exploits.flykey then
        onFlyToggle()
    end
end)

-- Reset flying state when character respawns
LocalPlayer.CharacterAdded:Connect(function()
    ESP.Exploits.flying = false
end)

local function getInstancePosition(instance)
    if instance:IsA("BasePart") then
        return instance.Position
    elseif instance:IsA("Model") then
        return instance:GetPivot().Position
    else
        -- For other types, try to find a reference part
        local primaryPart = instance.PrimaryPart
        local lid = instance:FindFirstChild("Lid")
        local reference = primaryPart or lid or instance:FindFirstChildWhichIsA("BasePart")
        
        if reference then
            return reference.Position
        end
    end
    return nil
end

-- Utility Functions
local function getDistance(instance)
    local character = LocalPlayer.Character
    local rootPart = character and character:FindFirstChild("HumanoidRootPart")
    
    if not rootPart then return 0 end
    
    local targetPosition = getInstancePosition(instance)
    if not targetPosition then return 0 end
    
    return (rootPart.Position - targetPosition).Magnitude
end
local function createDrawing(class, properties)
    local drawing = Drawing.new(class)
    for property, value in pairs(properties) do
        drawing[property] = value
    end
    return drawing
end

local function createESP(instance, espType)
    if not instance:IsA("Model") and espType ~= "Chest" then return end
    
    local settings
    if espType == "Player" then
        settings = ESP.Players
    elseif espType == "Mob" then
        settings = ESP.Mobs
    else
        settings = ESP.Chests
    end
    
    local esp = {
        Drawings = {
            Info = nil,
            HealthBarOutline = nil,
            HealthBarBackground = nil,
            HealthBarFill = nil,
            Tracer = nil
        },
        Connection = nil
    }

    local function updateFont()
        if esp.Drawings.Info then
            esp.Drawings.Info.Font = settings.Text.Font
        end
    end
    
    -- Create Text ESP
    if settings.Text.Enabled then
        esp.Drawings.Info = createDrawing("Text", {
            Text = "",
            Size = settings.Text.Size,
            Center = true,
            Outline = settings.Text.Outline,
            OutlineColor = settings.Text.OutlineColor,
            Color = settings.Text.Color,
            Font = settings.Text.Font,
            Visible = false
        })
    end

    esp.UpdateFont = updateFont
    
    -- Create Health Bar (Players only)
    if espType == "Player" and settings.HealthBar.Enabled then
        esp.Drawings.HealthBarOutline = createDrawing("Square", {
            Thickness = 1,
            Color = settings.HealthBar.OutlineColor,
            Filled = false,
            Visible = false
        })
        
        esp.Drawings.HealthBarBackground = createDrawing("Square", {
            Color = settings.HealthBar.BackgroundColor,
            Filled = true,
            Visible = false
        })
        
        esp.Drawings.HealthBarFill = createDrawing("Square", {
            Color = settings.HealthBar.Color,
            Filled = true,
            Visible = false
        })
    end
    
    -- Create Tracer
    if settings.Tracer.Enabled then
        esp.Drawings.Tracer = createDrawing("Line", {
            Thickness = settings.Tracer.Thickness,
            Color = settings.Tracer.Color,
            Transparency = settings.Tracer.Transparency,
            Visible = false
        })
    end
    
    -- Modified Update Function with Toggle Checks
    local function updateESP()
        -- First check if main ESP and type-specific ESP are enabled
        if not ESP.Enabled or not settings.Enabled then
            -- Hide all drawings if ESP is disabled
            for _, drawing in pairs(esp.Drawings) do
                if drawing then
                    drawing.Visible = false
                end
            end
            return
        end
        
        if not instance:IsDescendantOf(workspace) then
            esp:Destroy()
            return
        end
        
        local root
        if espType == "Chest" then
            root = instance
        else
            root = instance:FindFirstChild("HumanoidRootPart") or instance.PrimaryPart
        end
        
        if not root then return end
        
        local position = getInstancePosition(instance)
        if not position then return end
        
        local screenPos, onScreen = workspace.CurrentCamera:WorldToViewportPoint(position)
        local distance = getDistance(instance)
        
        -- Check if player is on screen and within max distance
        local isVisible = onScreen and distance <= settings.MaxDistance
        
        -- Handle team check for players
        if espType == "Player" and settings.IgnoreTeammates then
            local player = Players:GetPlayerFromCharacter(instance)
            if player and player.Team == LocalPlayer.Team then
                isVisible = false
            end
        end
        
        if isVisible then
            local basePosition = Vector2.new(screenPos.X, screenPos.Y)
            local scaleFactor = 1 / (screenPos.Z * 0.75)
            local textOffset = Vector2.new(0, -45 * scaleFactor)
            
            -- Update Text ESP
            if esp.Drawings.Info and settings.Text.Enabled then
                esp.Drawings.Info.Position = basePosition + textOffset
                
                local infoText = ""
                if espType == "Chest" then
                    infoText = "Chest"
                    if settings.ShowDistance then
                        infoText = string.format("%s [%d]", infoText, distance)
                    end
                else
                    local humanoid = instance:FindFirstChild("Humanoid")
                    if humanoid then
                        local name = espType == "Player" and instance.Name or (instance:GetAttribute("MOB_rich_name") or instance.Name)
                        infoText = name
                        if settings.ShowHealth and humanoid then
                            infoText = string.format("%s [%d/%d]", infoText, humanoid.Health, humanoid.MaxHealth)
                        end
                        if settings.ShowDistance then
                            infoText = string.format("%s [%d]", infoText, distance)
                        end
                    end
                end
                
                esp.Drawings.Info.Text = infoText
                esp.Drawings.Info.Visible = true
            end
            
            -- Update Health Bar
            if espType == "Player" and settings.HealthBar.Enabled then
                local humanoid = instance:FindFirstChild("Humanoid")
                if humanoid and esp.Drawings.HealthBarOutline then
                    local healthBarWidth = settings.HealthBar.Width
                    local healthBarHeight = settings.HealthBar.Height * scaleFactor
                    local healthBarPosition = basePosition + Vector2.new(-30 * scaleFactor, -healthBarHeight/2)
                    
                    esp.Drawings.HealthBarOutline.Size = Vector2.new(healthBarWidth + 2, healthBarHeight + 2)
                    esp.Drawings.HealthBarOutline.Position = healthBarPosition - Vector2.new(1, 1)
                    esp.Drawings.HealthBarOutline.Visible = true
                    
                    esp.Drawings.HealthBarBackground.Size = Vector2.new(healthBarWidth, healthBarHeight)
                    esp.Drawings.HealthBarBackground.Position = healthBarPosition
                    esp.Drawings.HealthBarBackground.Visible = true
                    
                    local healthRatio = humanoid.Health / humanoid.MaxHealth
                    esp.Drawings.HealthBarFill.Size = Vector2.new(healthBarWidth, healthBarHeight * healthRatio)
                    esp.Drawings.HealthBarFill.Position = Vector2.new(
                        healthBarPosition.X,
                        healthBarPosition.Y + (healthBarHeight * (1 - healthRatio))
                    )
                    esp.Drawings.HealthBarFill.Visible = true
                end
            end
            
            -- Update Tracer
            if esp.Drawings.Tracer and settings.Tracer.Enabled then
                local origin
                if settings.Tracer.Origin == "Mouse" then
                    origin = Vector2.new(LocalPlayer:GetMouse().X, LocalPlayer:GetMouse().Y)
                elseif settings.Tracer.Origin == "Center" then
                    origin = Vector2.new(workspace.CurrentCamera.ViewportSize.X/2, workspace.CurrentCamera.ViewportSize.Y/2)
                else
                    origin = Vector2.new(workspace.CurrentCamera.ViewportSize.X/2, workspace.CurrentCamera.ViewportSize.Y)
                end
                
                esp.Drawings.Tracer.From = origin
                esp.Drawings.Tracer.To = basePosition
                esp.Drawings.Tracer.Visible = true
            end
        else
            -- Hide all drawings if not visible
            for _, drawing in pairs(esp.Drawings) do
                if drawing then
                    drawing.Visible = false
                end
            end
        end
    end
    
    -- Cleanup Function
    function esp:Destroy()
        for _, drawing in pairs(self.Drawings) do
            if drawing then
                drawing:Remove()
            end
        end
        if self.Connection then
            self.Connection:Disconnect()
        end
    end
    
    -- Connect update function
    esp.Connection = RunService.RenderStepped:Connect(updateESP)
    updateESP() -- Initial update
    
    return esp
end

-- Main ESP Management
local espObjects = {}

-- Chest ESP
local function onChestAdded(chest)
    if chest:IsA("Model") and chest:FindFirstChild("Lid") then
        espObjects[chest] = createESP(chest, "Chest")
    end
end

local function onChestRemoved(chest)
    if espObjects[chest] then
        espObjects[chest]:Destroy()
        espObjects[chest] = nil
    end
end

-- Mob ESP
local function onMobAdded(mob)
    if mob.Name:sub(1, 1) == "." then
        espObjects[mob] = createESP(mob, "Mob")
    end
end

local function onMobRemoved(mob)
    if espObjects[mob] then
        espObjects[mob]:Destroy()
        espObjects[mob] = nil
    end
end

-- Player ESP
local function onPlayerAdded(player)
    local function characterAdded(character)
        if character and player ~= LocalPlayer then
            espObjects[player] = createESP(character, "Player")
        end
    end
    
    player.CharacterAdded:Connect(characterAdded)
    if player.Character then
        characterAdded(player.Character)
    end
end

local function onPlayerRemoving(player)
    if espObjects[player] then
        espObjects[player]:Destroy()
        espObjects[player] = nil
    end
end

-- Initialize
for _, chest in pairs(workspace.Thrown:GetChildren()) do
    if chest:FindFirstChild("Lid") then
        onChestAdded(chest)
    end
end

for _, mob in pairs(workspace.Live:GetChildren()) do
    if mob.Name:sub(1, 1) == "." then
        onMobAdded(mob)
    end
end

for _, player in pairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then
        onPlayerAdded(player)
    end
end

-- Connect events
workspace.Thrown.ChildAdded:Connect(onChestAdded)
workspace.Thrown.ChildRemoved:Connect(onChestRemoved)
workspace.Live.ChildAdded:Connect(onMobAdded)
workspace.Live.ChildRemoved:Connect(onMobRemoved)
Players.PlayerAdded:Connect(onPlayerAdded)
Players.PlayerRemoving:Connect(onPlayerRemoving)


return ESP
