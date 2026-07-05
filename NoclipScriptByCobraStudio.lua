local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local noclipEnabled = false

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player.PlayerGui
screenGui.ResetOnSpawn = false

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 120)
frame.Position = UDim2.new(0.5, -100, 0.1, 0)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BackgroundTransparency = 0.15
frame.BorderSizePixel = 2
frame.BorderColor3 = Color3.fromRGB(0, 170, 255)
frame.Active = true
frame.Parent = screenGui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0.3, 0)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "Noclip By: CobraStudio"
title.TextColor3 = Color3.fromRGB(0, 170, 255)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.Parent = frame

local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(1, 0, 0.3, 0)
statusLabel.Position = UDim2.new(0, 0, 0.3, 0)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "OFF"
statusLabel.TextColor3 = Color3.fromRGB(255, 50, 50)
statusLabel.TextScaled = true
statusLabel.Font = Enum.Font.GothamBold
statusLabel.Parent = frame

local button = Instance.new("TextButton")
button.Size = UDim2.new(0.6, 0, 0.3, 0)
button.Position = UDim2.new(0.2, 0, 0.65, 0)
button.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
button.BackgroundTransparency = 0.2
button.BorderSizePixel = 2
button.BorderColor3 = Color3.fromRGB(255, 255, 255)
button.Text = "ВКЛ"
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.TextScaled = true
button.Font = Enum.Font.GothamBold
button.Parent = frame

local function toggleNoclip()
    noclipEnabled = not noclipEnabled
    
    if noclipEnabled then
        for _, part in pairs(char:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
        statusLabel.Text = "ON"
        statusLabel.TextColor3 = Color3.fromRGB(50, 255, 50)
        frame.BorderColor3 = Color3.fromRGB(50, 255, 50)
        button.Text = "ВЫКЛ"
        button.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    else
        for _, part in pairs(char:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = true
            end
        end
        statusLabel.Text = "OFF"
        statusLabel.TextColor3 = Color3.fromRGB(255, 50, 50)
        frame.BorderColor3 = Color3.fromRGB(0, 170, 255)
        button.Text = "ВКЛ"
        button.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
    end
end

button.MouseButton1Click:Connect(toggleNoclip)

player.CharacterAdded:Connect(function(newChar)
    char = newChar
    task.wait(0.5)
    if noclipEnabled then
        for _, part in pairs(char:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)
