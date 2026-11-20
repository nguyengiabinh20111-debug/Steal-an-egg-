-- ----------------------------------------------------
-- Prometheus Deobf / by RT4O
-- Discord: https://discord.gg/uqhEpzXy9q
-- Deobf at 2026-10-03 11:17:16 UTC
-- Updated: Clearer BG, More Transparent Black Buttons, Text-Only ON State
-- ----------------------------------------------------

local proximityPromptService = game:GetService("ProximityPromptService")
local runService = game:GetService("RunService")
local players = game:GetService("Players")
local coreGui = game:GetService("CoreGui")
local localPlayer = players.LocalPlayer
local playerGui = localPlayer:WaitForChild("PlayerGui")
local v1 = gethui and gethui() or playerGui

if v1:FindFirstChild("AtrasGui") then
  v1.AtrasGui:Destroy()
end

local v2 = false
local v3 = false
local v5 = false
local v6 = false
local v7 = {}

local v9 = {
  Vector3.new(500.62, 241.28, -366.64), Vector3.new(504.45, 155.8, -366.35),
  Vector3.new(508.3, 70.28, -366.03), Vector3.new(513.86, 70.28, -366.25),
  Vector3.new(519.43, 70.28, -366.47), Vector3.new(524.32, 70.28, -366.59),
  Vector3.new(529.22, 70.28, -366.71), Vector3.new(538.01, 70.28, -365.55),
  Vector3.new(546.8, 70.28, -364.4),
}

-- Viền cầu vòng chỉ dùng cho khung menu bên ngoài và nút mở
local rainbowSequence = ColorSequence.new({
  ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 80)),
  ColorSequenceKeypoint.new(0.20, Color3.fromRGB(255, 150, 0)),
  ColorSequenceKeypoint.new(0.40, Color3.fromRGB(255, 230, 0)),
  ColorSequenceKeypoint.new(0.60, Color3.fromRGB(0, 255, 120)),
  ColorSequenceKeypoint.new(0.80, Color3.fromRGB(0, 180, 255)),
  ColorSequenceKeypoint.new(1.00, Color3.fromRGB(180, 0, 255)),
})

local rainbowGradients = {}
local function applyRainbowStroke(parent, thickness, transparency)
  local stroke = Instance.new("UIStroke")
  stroke.Color = Color3.fromRGB(255, 255, 255)
  stroke.Thickness = thickness or 2
  stroke.Transparency = transparency or 0.05
  stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
  stroke.Parent = parent

  local grad = Instance.new("UIGradient")
  grad.Color = rainbowSequence
  grad.Parent = stroke
  table.insert(rainbowGradients, grad)
  return stroke
end

local sourcesHubGui = Instance.new("ScreenGui")
sourcesHubGui.Name = "AtrasGui"
sourcesHubGui.ResetOnSpawn = false
sourcesHubGui.IgnoreGuiInset = true
sourcesHubGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
sourcesHubGui.DisplayOrder = 1000
sourcesHubGui.Parent = v1

-- Nút thu nhỏ / mở lại (icon ID 106041745164419)
local openBtn = Instance.new("ImageButton")
openBtn.Name = "OpenBtn"
openBtn.Size = UDim2.fromOffset(48, 48)
openBtn.Position = UDim2.new(0, 15, 0.34, -22)
openBtn.BackgroundColor3 = Color3.fromRGB(12, 12, 14)
openBtn.BackgroundTransparency = 0.5
openBtn.BorderSizePixel = 0
openBtn.Image = "rbxassetid://106041745164419"
openBtn.ScaleType = Enum.ScaleType.Crop
openBtn.Visible = false
openBtn.Active = true
openBtn.Draggable = true
openBtn.Parent = sourcesHubGui

local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(1, 0)
uiCorner.Parent = openBtn

applyRainbowStroke(openBtn, 2, 0.05)

-- Khung menu chính (trong suốt cao để thấy rõ hình nền)
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 240, 0, 270)
mainFrame.Position = UDim2.new(0.5, -120, 0.5, -135)
mainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 12)
mainFrame.BackgroundTransparency = 0.95
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = true
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = sourcesHubGui

local uiScale = Instance.new("UIScale")
uiScale.Scale = 1
uiScale.Parent = mainFrame

local uiCorner2 = Instance.new("UICorner")
uiCorner2.CornerRadius = UDim.new(0, 10)
uiCorner2.Parent = mainFrame

-- Hình nền menu rõ nét nhất (ID: 78034177322041)
local bgImage = Instance.new("ImageLabel")
bgImage.Name = "MenuBackground"
bgImage.Size = UDim2.fromScale(1, 1)
bgImage.Position = UDim2.fromScale(0, 0)
bgImage.BackgroundTransparency = 1
bgImage.Image = "rbxassetid://78034177322041"
bgImage.ImageTransparency = 0
bgImage.ScaleType = Enum.ScaleType.Crop
bgImage.ZIndex = 0
bgImage.Parent = mainFrame

local bgCorner = Instance.new("UICorner")
bgCorner.CornerRadius = UDim.new(0, 10)
bgCorner.Parent = bgImage

applyRainbowStroke(mainFrame, 2.2, 0.05)

-- Icon nhỏ trên menu: to (26x26) và bo tròn
local titleIcon = Instance.new("ImageLabel")
titleIcon.Name = "TitleIcon"
titleIcon.Size = UDim2.fromOffset(26, 26)
titleIcon.Position = UDim2.new(0, 10, 0, 5)
titleIcon.BackgroundColor3 = Color3.fromRGB(12, 12, 14)
titleIcon.BackgroundTransparency = 0.55
titleIcon.Image = "rbxassetid://106041745164419"
titleIcon.ScaleType = Enum.ScaleType.Crop
titleIcon.ZIndex = 2
titleIcon.Parent = mainFrame

local iconCorner = Instance.new("UICorner")
iconCorner.CornerRadius = UDim.new(1, 0)
iconCorner.Parent = titleIcon

-- Tên menu: Hirose x Miyano màu trắng
local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "TitleLabel"
titleLabel.Size = UDim2.new(0, 150, 0, 18)
titleLabel.Position = UDim2.new(0, 42, 0, 4)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Hirose x Miyano"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextSize = 13
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.ZIndex = 2
titleLabel.Parent = mainFrame

local discordSubLabel = Instance.new("TextLabel")
discordSubLabel.Name = "DiscordSubLabel"
discordSubLabel.Size = UDim2.new(1, -80, 0, 14)
discordSubLabel.Position = UDim2.new(0, 42, 0, 20)
discordSubLabel.BackgroundTransparency = 1
discordSubLabel.Text = "discord.gg/uqhEpzXy9q"
discordSubLabel.TextColor3 = Color3.fromRGB(240, 240, 240)
discordSubLabel.TextSize = 10
discordSubLabel.Font = Enum.Font.Gotham
discordSubLabel.TextXAlignment = Enum.TextXAlignment.Left
discordSubLabel.ZIndex = 2
discordSubLabel.Parent = mainFrame

-- Nút thu nhỏ màu đen trong suốt nhẹ
local textButton = Instance.new("TextButton")
textButton.Size = UDim2.new(0, 24, 0, 24)
textButton.Position = UDim2.new(1, -32, 0, 6)
textButton.BackgroundColor3 = Color3.fromRGB(12, 12, 14)
textButton.BackgroundTransparency = 0.78
textButton.BorderSizePixel = 0
textButton.Text = "_"
textButton.TextColor3 = Color3.fromRGB(255, 255, 255)
textButton.TextSize = 13
textButton.Font = Enum.Font.GothamBold
textButton.ZIndex = 2
textButton.Parent = mainFrame

local uiCorner4 = Instance.new("UICorner")
uiCorner4.CornerRadius = UDim.new(0, 6)
uiCorner4.Parent = textButton

textButton.MouseButton1Click:Connect(function()
  mainFrame.Visible = false
  openBtn.Visible = true
end)

openBtn.MouseButton1Click:Connect(function()
  mainFrame.Visible = true
  openBtn.Visible = false
end)

local textButton3 = Instance.new("TextButton")
textButton3.Size = UDim2.new(0.5, -12, 0, 22)
textButton3.Position = UDim2.new(0, 8, 0, 38)
textButton3.BackgroundColor3 = Color3.fromRGB(12, 12, 14)
textButton3.BackgroundTransparency = 0.65
textButton3.BorderSizePixel = 0
textButton3.Text = "Main"
textButton3.TextColor3 = Color3.fromRGB(255, 255, 255)
textButton3.TextSize = 12
textButton3.Font = Enum.Font.GothamBold
textButton3.ZIndex = 2
textButton3.Parent = mainFrame

local uiCorner6 = Instance.new("UICorner")
uiCorner6.CornerRadius = UDim.new(0, 6)
uiCorner6.Parent = textButton3

local textButton4 = Instance.new("TextButton")
textButton4.Size = UDim2.new(0.5, -12, 0, 22)
textButton4.Position = UDim2.new(0.5, 4, 0, 38)
textButton4.BackgroundColor3 = Color3.fromRGB(12, 12, 14)
textButton4.BackgroundTransparency = 0.78
textButton4.BorderSizePixel = 0
textButton4.Text = "Misc"
textButton4.TextColor3 = Color3.fromRGB(220, 220, 220)
textButton4.TextSize = 12
textButton4.Font = Enum.Font.GothamSemibold
textButton4.ZIndex = 2
textButton4.Parent = mainFrame

local uiCorner7 = Instance.new("UICorner")
uiCorner7.CornerRadius = UDim.new(0, 6)
uiCorner7.Parent = textButton4

local frame = Instance.new("Frame")
frame.Size = UDim2.new(1, 0, 1, -68)
frame.Position = UDim2.new(0, 0, 0, 66)
frame.BackgroundTransparency = 1
frame.Visible = true
frame.ZIndex = 2
frame.Parent = mainFrame

local frame2 = Instance.new("Frame")
frame2.Size = UDim2.new(1, 0, 1, -68)
frame2.Position = UDim2.new(0, 0, 0, 66)
frame2.BackgroundTransparency = 1
frame2.Visible = false
frame2.ZIndex = 2
frame2.Parent = mainFrame

textButton3.MouseButton1Click:Connect(function()
  frame.Visible = true
  frame2.Visible = false

  textButton3.BackgroundColor3 = Color3.fromRGB(12, 12, 14)
  textButton3.BackgroundTransparency = 0.65
  textButton3.TextColor3 = Color3.fromRGB(255, 255, 255)
  textButton3.Font = Enum.Font.GothamBold

  textButton4.BackgroundColor3 = Color3.fromRGB(12, 12, 14)
  textButton4.BackgroundTransparency = 0.78
  textButton4.TextColor3 = Color3.fromRGB(220, 220, 220)
  textButton4.Font = Enum.Font.GothamSemibold
end)

textButton4.MouseButton1Click:Connect(function()
  frame.Visible = false
  frame2.Visible = true

  textButton4.BackgroundColor3 = Color3.fromRGB(12, 12, 14)
  textButton4.BackgroundTransparency = 0.65
  textButton4.TextColor3 = Color3.fromRGB(255, 255, 255)
  textButton4.Font = Enum.Font.GothamBold

  textButton3.BackgroundColor3 = Color3.fromRGB(12, 12, 14)
  textButton3.BackgroundTransparency = 0.78
  textButton3.TextColor3 = Color3.fromRGB(220, 220, 220)
  textButton3.Font = Enum.Font.GothamSemibold
end)

local antiHitBtn = Instance.new("TextButton")
antiHitBtn.Name = "AntiHitBtn"
antiHitBtn.Size = UDim2.new(1, -20, 0, 32)
antiHitBtn.Position = UDim2.new(0, 10, 0, 6)
antiHitBtn.BackgroundColor3 = Color3.fromRGB(12, 12, 14)
antiHitBtn.BackgroundTransparency = 0.78
antiHitBtn.BorderSizePixel = 0
antiHitBtn.Text = "Anti-Hit: OFF"
antiHitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
antiHitBtn.TextSize = 12
antiHitBtn.Font = Enum.Font.GothamSemibold
antiHitBtn.ZIndex = 3
antiHitBtn.Parent = frame

local uiCorner8 = Instance.new("UICorner")
uiCorner8.CornerRadius = UDim.new(0, 6)
uiCorner8.Parent = antiHitBtn

local instantGrabBtn = Instance.new("TextButton")
instantGrabBtn.Name = "InstantGrabBtn"
instantGrabBtn.Size = UDim2.new(1, -20, 0, 32)
instantGrabBtn.Position = UDim2.new(0, 10, 0, 44)
instantGrabBtn.BackgroundColor3 = Color3.fromRGB(12, 12, 14)
instantGrabBtn.BackgroundTransparency = 0.78
instantGrabBtn.BorderSizePixel = 0
instantGrabBtn.Text = "Instant Grab: OFF"
instantGrabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
instantGrabBtn.TextSize = 12
instantGrabBtn.Font = Enum.Font.GothamSemibold
instantGrabBtn.ZIndex = 3
instantGrabBtn.Parent = frame

local uiCorner9 = Instance.new("UICorner")
uiCorner9.CornerRadius = UDim.new(0, 6)
uiCorner9.Parent = instantGrabBtn

local antiRagdollBtn = Instance.new("TextButton")
antiRagdollBtn.Name = "AntiRagdollBtn"
antiRagdollBtn.Size = UDim2.new(1, -20, 0, 32)
antiRagdollBtn.Position = UDim2.new(0, 10, 0, 82)
antiRagdollBtn.BackgroundColor3 = Color3.fromRGB(12, 12, 14)
antiRagdollBtn.BackgroundTransparency = 0.78
antiRagdollBtn.BorderSizePixel = 0
antiRagdollBtn.Text = "Anti-Ragdoll: OFF"
antiRagdollBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
antiRagdollBtn.TextSize = 12
antiRagdollBtn.Font = Enum.Font.GothamSemibold
antiRagdollBtn.ZIndex = 3
antiRagdollBtn.Parent = frame

local uiCorner11 = Instance.new("UICorner")
uiCorner11.CornerRadius = UDim.new(0, 6)
uiCorner11.Parent = antiRagdollBtn

local connect

local function f1(p1)
  if not p1 then
    return
  end

  pcall(function()
    p1:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, not v5)
    p1:SetStateEnabled(Enum.HumanoidStateType.FallingDown, not v5)
  end)
end

local function f2()
  if connect then
    return
  end

  connect = runService.Heartbeat:Connect(function()
    if not v5 then
      return
    end

    local character2 = localPlayer.Character

    if not character2 then
      return
    end

    local humanoid2 = character2:FindFirstChildOfClass("Humanoid")

    if humanoid2 then
      pcall(function()
        local getState = humanoid2:GetState()

        if getState == Enum.HumanoidStateType.Physics
          or getState == Enum.HumanoidStateType.Ragdoll
          or getState == Enum.HumanoidStateType.FallingDown then
          for index, value in ipairs(character2:GetDescendants()) do
            if value:IsA("BasePart") then
              value.AssemblyLinearVelocity = Vector3.zero
              value.AssemblyAngularVelocity = Vector3.zero
            end
          end

          humanoid2:ChangeState(Enum.HumanoidStateType.GettingUp)
        end
      end)
    end
  end)
end

antiRagdollBtn.MouseButton1Click:Connect(function()
  v5 = not v5
  local character3 = localPlayer.Character

  if character3 then
    f1(character3:FindFirstChildOfClass("Humanoid"))
  end

  if v5 then
    antiRagdollBtn.Text = "Anti-Ragdoll: ON"
    f2()
  else
    antiRagdollBtn.Text = "Anti-Ragdoll: OFF"
  end
end)

localPlayer.CharacterAdded:Connect(function(character4)
  task.wait(0.5)

  if v5 then
    f1(character4:FindFirstChildOfClass("Humanoid"))
  end
end)

local function f3(p2)
  if p2:IsA("ProximityPrompt") then
    if v3 then
      if v7[p2] == nil then
        v7[p2] = p2.HoldDuration
      end

      p2.HoldDuration = 0.01
    elseif v7[p2] ~= nil then
      p2.HoldDuration = v7[p2]
      v7[p2] = nil
    end
  end
end

proximityPromptService.PromptShown:Connect(function(p3)
  if v3 then
    f3(p3)
  end
end)

workspace.DescendantAdded:Connect(function(descendant)
  if v3 and descendant:IsA("ProximityPrompt") then
    f3(descendant)
  end
end)

instantGrabBtn.MouseButton1Click:Connect(function()
  v3 = not v3

  if v3 then
    instantGrabBtn.Text = "Instant Grab: ON"

    for index2, value2 in ipairs(workspace:GetDescendants()) do
      f3(value2)
    end
  else
    instantGrabBtn.Text = "Instant Grab: OFF"

    for key, value3 in pairs(v7) do
      if key and key.Parent then
        key.HoldDuration = value3
      end
    end

    table.clear(v7)
  end
end)

local scaleBtn = Instance.new("TextButton")
scaleBtn.Name = "ScaleBtn"
scaleBtn.Size = UDim2.new(1, -20, 0, 30)
scaleBtn.Position = UDim2.new(0, 10, 0, 38)
scaleBtn.BackgroundColor3 = Color3.fromRGB(12, 12, 14)
scaleBtn.BackgroundTransparency = 0.78
scaleBtn.BorderSizePixel = 0
scaleBtn.Text = "GUI Scale: 1.0x"
scaleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
scaleBtn.TextSize = 11
scaleBtn.Font = Enum.Font.GothamSemibold
scaleBtn.ZIndex = 3
scaleBtn.Parent = frame2

local uiCorner14 = Instance.new("UICorner")
uiCorner14.CornerRadius = UDim.new(0, 6)
uiCorner14.Parent = scaleBtn

local v12 = { 0.8, 1, 1.2, 1.4 }
local v13 = 2

scaleBtn.MouseButton1Click:Connect(function()
  v13 = v13 + 1

  if v13 > #v12 then
    v13 = 1
  end

  local v14 = v12[v13]
  uiScale.Scale = v14
  scaleBtn.Text = "GUI Scale: " .. v14 .. "x"
end)

local discordBtn = Instance.new("TextButton")
discordBtn.Name = "DiscordBtn"
discordBtn.Size = UDim2.new(1, -20, 0, 30)
discordBtn.Position = UDim2.new(0, 10, 0, 72)
discordBtn.BackgroundColor3 = Color3.fromRGB(12, 12, 14)
discordBtn.BackgroundTransparency = 0.78
discordBtn.BorderSizePixel = 0
discordBtn.Text = "Discord: Copy Link"
discordBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
discordBtn.TextSize = 11
discordBtn.Font = Enum.Font.GothamSemibold
discordBtn.ZIndex = 3
discordBtn.Parent = frame2

local uiCorner15 = Instance.new("UICorner")
uiCorner15.CornerRadius = UDim.new(0, 6)
uiCorner15.Parent = discordBtn

discordBtn.MouseButton1Click:Connect(function()
  if setclipboard then
    setclipboard("https://discord.gg/uqhEpzXy9q")
  end

  discordBtn.Text = "COPIED DISCORD LINK!"
  task.wait(1.2)
  discordBtn.Text = "Discord: Copy Link"
end)

local function f4(p4)
  if not v2 or not p4 or not p4.Parent then
    return
  end

  for index3, value4 in ipairs(v9) do
    if not v2 then
      return
    end
    p4:PivotTo(CFrame.new(value4))
    if index3 < #v9 then
      runService.Heartbeat:Wait()
    end
  end
end

antiHitBtn.MouseButton1Click:Connect(function()
  v2 = not v2

  if v2 then
    antiHitBtn.Text = "Anti-Hit: ON"
  else
    antiHitBtn.Text = "Anti-Hit: OFF"
  end
end)

proximityPromptService.PromptTriggered:Connect(function(p5, p6)
  if p6 ~= localPlayer then
    return
  end

  if not v2 or v6 then
    return
  else
    local character6 = localPlayer.Character

    if not character6 then
      return
    end

    f4(character6)
    v6 = false
    return
  end
end)

-- Xoay màu cầu vòng ở viền ngoài menu
task.spawn(function()
  local angle = 0
  while sourcesHubGui and sourcesHubGui.Parent do
    angle = (angle + 1.5) % 360
    for _, grad in ipairs(rainbowGradients) do
      if grad and grad.Parent then
        grad.Rotation = angle
      end
    end
    runService.RenderStepped:Wait()
  end
end)

-- Discord: https://discord.gg/uqhEpzXy9q
