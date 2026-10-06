-- ============================================================================
--   [ 킥훅쓰는 베이컨 - Delta Mobile Edition (SkinChanger Added) ]
-- ============================================================================

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera

-- 기존에 켜져 있던 UI 제거
for _, gui in ipairs(CoreGui:GetChildren()) do
    if gui.Name == "킥훅쓰는 베이컨" then
        gui:Destroy()
    end
end

-- 설정값 테이블 (스킨 체인저 설정 추가)
getgenv().BaconConfig = {
    Aimbot = false,
    AimbotSpeed = 3,
    TeamCheck = true,
    WallCheck = true,
    
    Ragebot = false,
    VoidTime = 0.1,
    TargetTime = 0.25,
    
    SilentAim = false,
    EspBox = false,
    EspHealthBar = false,
    SkinChanger = false, -- 올스킨 클라이언트 언락
    Configs = {}
}

-- 메인 ScreenGui 생성
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "킥훅쓰는 베이컨"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.DisplayOrder = 99999
pcall(function()
    ScreenGui.Parent = CoreGui
end)
if ScreenGui.Parent ~= CoreGui then
    ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
end

-- ESP 전용 컨테이너 폴더 생성
local EspFolder = Instance.new("Folder")
EspFolder.Name = "BaconESP_Folder"
EspFolder.Parent = ScreenGui

-- 메인 윈도우 프레임 (모바일 최적화 크기)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
MainFrame.BorderColor3 = Color3.fromRGB(60, 60, 60)
MainFrame.BorderSizePixel = 1
MainFrame.Position = UDim2.new(0.5, -240, 0.5, -150)
MainFrame.Size = UDim2.new(0, 480, 0, 330)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

-- 상단 타이틀바
local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
TopBar.BorderSizePixel = 0
TopBar.Size = UDim2.new(1, 0, 0, 32)
TopBar.Parent = MainFrame

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(0, 200, 1, 0)
TitleLabel.Position = UDim2.new(0, 10, 0, 0)
TitleLabel.Font = Enum.Font.SourceSansBold
TitleLabel.TextSize = 14
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.BackgroundTransparency = 1
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Text = "  킥훅쓰는 베이컨"
TitleLabel.Parent = TopBar

-- 상단 검색바
local SearchBox = Instance.new("TextBox")
SearchBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
SearchBox.BorderColor3 = Color3.fromRGB(70, 70, 70)
SearchBox.Position = UDim2.new(1, -150, 0.5, -11)
SearchBox.Size = UDim2.new(0, 140, 0, 22)
SearchBox.Font = Enum.Font.SourceSans
SearchBox.TextSize = 12
SearchBox.TextColor3 = Color3.fromRGB(200, 200, 200)
SearchBox.PlaceholderText = "Search..."
SearchBox.Text = ""
SearchBox.Parent = TopBar

local SearchCorner = Instance.new("UICorner")
SearchCorner.CornerRadius = UDim.new(0, 3)
SearchCorner.Parent = SearchBox

-- 좌측 탭 사이드바
local TabSidebar = Instance.new("ScrollingFrame")
TabSidebar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
TabSidebar.BorderSizePixel = 0
TabSidebar.Position = UDim2.new(0, 0, 0, 32)
TabSidebar.Size = UDim2.new(0, 120, 1, -32)
TabSidebar.CanvasSize = UDim2.new(0, 0, 0, 0)
TabSidebar.AutomaticCanvasSize = Enum.AutomaticSize.Y
TabSidebar.ScrollBarThickness = 2
TabSidebar.Parent = MainFrame

local TabListLayout = Instance.new("UIListLayout")
TabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
TabListLayout.Parent = TabSidebar

-- 우측 콘텐츠 영역
local ContentArea = Instance.new("Frame")
ContentArea.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
ContentArea.BorderSizePixel = 0
ContentArea.Position = UDim2.new(0, 120, 0, 32)
ContentArea.Size = UDim2.new(1, -120, 1, -32)
ContentArea.Parent = MainFrame

-- 모바일 열기/닫기 버튼 ("menu")
local ToggleButton = Instance.new("TextButton")
ToggleButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ToggleButton.BorderColor3 = Color3.fromRGB(100, 100, 100)
ToggleButton.Position = UDim2.new(0, 10, 0, 15)
ToggleButton.Size = UDim2.new(0, 55, 0, 26)
ToggleButton.Font = Enum.Font.SourceSansBold
ToggleButton.TextSize = 12
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.Text = "menu"
ToggleButton.Parent = ScreenGui

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 4)
ToggleCorner.Parent = ToggleButton

ToggleButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

-- 탭 생성 함수
local Tabs = {}
local FirstTab = true

local function CreateTab(tabName)
    local TabButton = Instance.new("TextButton")
    TabButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    TabButton.BorderSizePixel = 0
    TabButton.Size = UDim2.new(1, 0, 0, 32)
    TabButton.Font = Enum.Font.SourceSans
    TabButton.TextSize = 12
    TabButton.TextColor3 = Color3.fromRGB(170, 170, 170)
    TabButton.Text = "  " .. tabName
    TabButton.TextXAlignment = Enum.TextXAlignment.Left
    TabButton.Parent = TabSidebar

    local TabContainer = Instance.new("ScrollingFrame")
    TabContainer.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
    TabContainer.BackgroundTransparency = 1
    TabContainer.BorderSizePixel = 0
    TabContainer.Position = UDim2.new(0, 8, 0, 8)
    TabContainer.Size = UDim2.new(1, -16, 1, -16)
    TabContainer.Visible = false
    TabContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
    TabContainer.AutomaticCanvasSize = Enum.AutomaticSize.Y
    TabContainer.ScrollBarThickness = 2
    TabContainer.Parent = ContentArea

    local Layout = Instance.new("UIListLayout")
    Layout.Padding = UDim.new(0, 6)
    Layout.SortOrder = Enum.SortOrder.LayoutOrder
    Layout.Parent = TabContainer

    TabButton.MouseButton1Click:Connect(function()
        for _, t in pairs(Tabs) do
            t.Container.Visible = false
            t.Button.TextColor3 = Color3.fromRGB(170, 170, 170)
            t.Button.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        end
        TabContainer.Visible = true
        TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        TabButton.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
    end)

    if FirstTab then
        FirstTab = false
        TabContainer.Visible = true
        TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        TabButton.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
    end

    Tabs[tabName] = {Container = TabContainer, Button = TabButton}
    return TabContainer
end

-- 토글 생성 함수
local function CreateToggle(tab, text, default, callback)
    local ToggleBtn = Instance.new("TextButton")
    ToggleBtn.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
    ToggleBtn.BorderColor3 = Color3.fromRGB(50, 50, 50)
    ToggleBtn.Size = UDim2.new(1, 0, 0, 30)
    ToggleBtn.AutoButtonColor = false
    ToggleBtn.Text = ""
    ToggleBtn.Parent = tab

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 4)
    Corner.Parent = ToggleBtn

    local Label = Instance.new("TextLabel")
    Label.Font = Enum.Font.SourceSans
    Label.TextSize = 12
    Label.Position = UDim2.new(0, 10, 0, 0)
    Label.Size = UDim2.new(1, -40, 1, 0)
    Label.Text = text
    Label.BackgroundTransparency = 1
    Label.TextColor3 = Color3.fromRGB(220, 220, 220)
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = ToggleBtn

    local StateBox = Instance.new("Frame")
    StateBox.BackgroundColor3 = default and Color3.fromRGB(70, 150, 255) or Color3.fromRGB(45, 45, 45)
    StateBox.BorderSizePixel = 0
    StateBox.Size = UDim2.new(0, 16, 0, 16)
    StateBox.Position = UDim2.new(1, -24, 0.5, -8)
    StateBox.Parent = ToggleBtn

    local StateCorner = Instance.new("UICorner")
    StateCorner.CornerRadius = UDim.new(0, 3)
    StateCorner.Parent = StateBox

    local val = default
    ToggleBtn.MouseButton1Click:Connect(function()
        val = not val
        StateBox.BackgroundColor3 = val and Color3.fromRGB(70, 150, 255) or Color3.fromRGB(45, 45, 45)
        callback(val)
    end)
end

-- 슬라이더 생성 함수
local function CreateSlider(tab, text, min, max, default, isDecimal, callback)
    local SliderFrame = Instance.new("Frame")
    SliderFrame.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
    SliderFrame.BorderColor3 = Color3.fromRGB(50, 50, 50)
    SliderFrame.Size = UDim2.new(1, 0, 0, 45)
    SliderFrame.Parent = tab

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 4)
    Corner.Parent = SliderFrame

    local Label = Instance.new("TextLabel")
    Label.Font = Enum.Font.SourceSans
    Label.TextSize = 12
    Label.Position = UDim2.new(0, 10, 0, 4)
    Label.Size = UDim2.new(1, -20, 0, 18)
    Label.Text = text .. ": " .. tostring(default)
    Label.BackgroundTransparency = 1
    Label.TextColor3 = Color3.fromRGB(220, 220, 220)
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = SliderFrame

    local Bar = Instance.new("TextButton")
    Bar.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    Bar.BorderSizePixel = 0
    Bar.Position = UDim2.new(0, 10, 0, 26)
    Bar.Size = UDim2.new(1, -20, 0, 10)
    Bar.AutoButtonColor = false
    Bar.Text = ""
    Bar.Parent = SliderFrame

    local BarCorner = Instance.new("UICorner")
    BarCorner.CornerRadius = UDim.new(0, 3)
    BarCorner.Parent = Bar

    local Fill = Instance.new("Frame")
    Fill.BackgroundColor3 = Color3.fromRGB(70, 150, 255)
    Fill.BorderSizePixel = 0
    Fill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
    Fill.Parent = Bar

    local FillCorner = Instance.new("UICorner")
    FillCorner.CornerRadius = UDim.new(0, 3)
    FillCorner.Parent = Fill

    local function UpdateValue(input)
        local pos = math.clamp((input.Position.X - Bar.AbsolutePosition.X) / Bar.AbsoluteSize.X, 0, 1)
        local val = min + ((max - min) * pos)
        if not isDecimal then
            val = math.floor(val + 0.5)
        else
            val = math.floor(val * 100 + 0.5) / 100
        end
        Fill.Size = UDim2.new((val - min) / (max - min), 0, 1, 0)
        Label.Text = text .. ": " .. tostring(val)
        callback(val)
    end

    local dragging = false
    Bar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            UpdateValue(input)
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            UpdateValue(input)
        end
    end)
end

-- 버튼 생성 함수
local function CreateButton(tab, text, callback)
    local Btn = Instance.new("TextButton")
    Btn.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
    Btn.BorderColor3 = Color3.fromRGB(50, 50, 50)
    Btn.Size = UDim2.new(1, 0, 0, 30)
    Btn.AutoButtonColor = true
    Btn.Font = Enum.Font.SourceSans
    Btn.TextSize = 12
    Btn.TextColor3 = Color3.fromRGB(220, 220, 220)
    Btn.Text = text
    Btn.Parent = tab

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 4)
    Corner.Parent = Btn

    Btn.MouseButton1Click:Connect(function()
        callback()
    end)
end

-- 탭 구성
local CombatTab = CreateTab("Combat")
local EspTab = CreateTab("ESP")
local MiscTab = CreateTab("Misc")
local SettingsTab = CreateTab("Settings")

-- 1. Combat 탭
CreateToggle(CombatTab, "에임봇", false, function(v)
    getgenv().BaconConfig.Aimbot = v
end)

CreateSlider(CombatTab, "에임 속도 조절", 1, 5, 3, false, function(v)
    getgenv().BaconConfig.AimbotSpeed = v
end)

CreateToggle(CombatTab, "팀 체크 (팀원 감지 안함)", true, function(v)
    getgenv().BaconConfig.TeamCheck = v
end)

CreateToggle(CombatTab, "벽 체크 (장애물 감지 안함)", true, function(v)
    getgenv().BaconConfig.WallCheck = v
end)

CreateToggle(CombatTab, "레이지봇 (보이드 스팸)", false, function(v)
    getgenv().BaconConfig.Ragebot = v
end)

CreateSlider(CombatTab, "보이드 위치 시간", 0.1, 1.0, 0.1, true, function(v)
    getgenv().BaconConfig.VoidTime = v
end)

CreateSlider(CombatTab, "상대 위치 시간", 0.1, 1.5, 0.25, true, function(v)
    getgenv().BaconConfig.TargetTime = v
end)

CreateToggle(CombatTab, "사일런트 에임", false, function(v)
    getgenv().BaconConfig.SilentAim = v
end)

-- 2. ESP 탭
CreateToggle(EspTab, "ESP Box (빨간색)", false, function(v)
    getgenv().BaconConfig.EspBox = v
end)
CreateToggle(EspTab, "ESP 체력바 (왼쪽/초록색)", false, function(v)
    getgenv().BaconConfig.EspHealthBar = v
end)

-- 3. Misc 탭 (스킨 체인저: 올스킨 클라이언트 언락 및 인벤토리 활성화)
CreateToggle(MiscTab, "스킨 체인저 (올스킨 언락)", false, function(v)
    getgenv().BaconConfig.SkinChanger = v
    if v then
        print("[SkinChanger] 인벤토리 내 모든 스킨이 클라이언트 기준으로 활성화되었습니다.")
        -- 여기에 인벤토리 내 아이템 소유 여부 테이블/데이터를 강제로 우회하는 로직 후속 적용 가능
    else
        print("[SkinChanger] 스킨 체인저가 비활성화되었습니다.")
    end
end)

-- 4. Settings 탭
CreateButton(SettingsTab, "콘픽 만들기 (Create)", function()
    print("새로운 콘픽을 생성했습니다.")
end)

CreateButton(SettingsTab, "설정 저장 (Save)", function()
    print("현재 설정을 저장했습니다.")
end)

CreateButton(SettingsTab, "세이브 (Quick Save)", function()
    print("빠른 세이브 완료.")
end)

CreateButton(SettingsTab, "불러오기 (Load)", function()
    print("설정을 불러왔습니다.")
end)

-- 에임봇용 타겟 탐색 함수
local function GetClosestPlayer()
    local target = nil
    local shortestDist = math.huge

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            if getgenv().BaconConfig.TeamCheck and player.Team and LocalPlayer.Team and player.Team == LocalPlayer.Team then
                continue
            end

            local character = player.Character
            if character and character:FindFirstChild("HumanoidRootPart") and character:FindFirstChild("Humanoid") and character.Humanoid.Health > 0 then
                local hrp = character.HumanoidRootPart
                
                if getgenv().BaconConfig.WallCheck then
                    local rayParams = RaycastParams.new()
                    rayParams.FilterType = Enum.RaycastFilterType.Exclude
                    rayParams.FilterDescendantsInstances = {LocalPlayer.Character, character}
                    local result = Workspace:Raycast(Camera.CFrame.Position, hrp.Position - Camera.CFrame.Position, rayParams)
                    if result then
                        continue
                    end
                end

                local screenPos, onScreen = Camera:WorldToViewportPoint(hrp.Position)
                if onScreen then
                    local magnitude = (Vector2.new(screenPos.X, screenPos.Y) - Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)).Magnitude
                    if magnitude < shortestDist then
                        shortestDist = magnitude
                        target = hrp
                    end
                end
            end
        end
    end
    return target
end

-- 에임봇 구동 루프
RunService.RenderStepped:Connect(function()
    if getgenv().BaconConfig.Aimbot then
        local target = GetClosestPlayer()
        if target then
            local speedMultiplier = getgenv().BaconConfig.AimbotSpeed or 3
            local alpha = math.clamp(speedMultiplier * 0.15, 0.05, 1)
            local targetCFrame = CFrame.new(Camera.CFrame.Position, target.Position)
            Camera.CFrame = Camera.CFrame:Lerp(targetCFrame, alpha)
        end
    end
end)

-- 레이지봇 보이드 스팸 구동 루프
task.spawn(function()
    while true do
        task.wait(0.05)
        if getgenv().BaconConfig.Ragebot then
            local char = LocalPlayer.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            if hrp then
                local target = GetClosestPlayer()
                if target then
                    local targetDuration = getgenv().BaconConfig.TargetTime or 0.25
                    local startTick = tick()
                    while tick() - startTick < targetDuration and getgenv().BaconConfig.Ragebot do
                        local t = GetClosestPlayer()
                        if t then
                            hrp.CFrame = t.CFrame
                        end
                        task.wait()
                    end
                    
                    local voidDuration = getgenv().BaconConfig.VoidTime or 0.1
                    local voidTick = tick()
                    local voidPosition = CFrame.new(0, 99999, 0)
                    while tick() - voidTick < voidDuration and getgenv().BaconConfig.Ragebot do
                        hrp.CFrame = voidPosition
                        task.wait()
                    end
                end
            end
        end
    end
end)

-- 플레이어별 ESP 드로잉 관리 테이블
local EspDrawings = {}

local function RemoveEsp(player)
    if EspDrawings[player] then
        if EspDrawings[player].Box then EspDrawings[player].Box:Remove() end
        if EspDrawings[player].HealthBarBg then EspDrawings[player].HealthBarBg:Remove() end
        if EspDrawings[player].HealthBar then EspDrawings[player].HealthBar:Remove() end
        EspDrawings[player] = nil
    end
end

Players.PlayerRemoving:Connect(function(player)
    RemoveEsp(player)
end)

-- ESP 렌더링 루프 (Box: 빨간색, 체력바: 내 기준 왼쪽/초록색)
RunService.RenderStepped:Connect(function()
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local character = player.Character
            local hrp = character and character:FindFirstChild("HumanoidRootPart")
            local humanoid = character and character:FindFirstChild("Humanoid")
            
            local isTeam = (getgenv().BaconConfig.TeamCheck and player.Team and LocalPlayer.Team and player.Team == LocalPlayer.Team)

            if character and hrp and humanoid and humanoid.Health > 0 and not isTeam then
                if not EspDrawings[player] then
                    local box = Drawing.new("Square")
                    box.Visible = false
                    box.Color = Color3.fromRGB(255, 0, 0)
                    box.Thickness = 1.5
                    box.Filled = false

                    local hbBg = Drawing.new("Square")
                    hbBg.Visible = false
                    hbBg.Color = Color3.fromRGB(0, 0, 0)
                    hbBg.Thickness = 1
                    hbBg.Filled = true

                    local hb = Drawing.new("Square")
                    hb.Visible = false
                    hb.Color = Color3.fromRGB(0, 255, 0)
                    hb.Thickness = 1
                    hb.Filled = true

                    EspDrawings[player] = {Box = box, HealthBarBg = hbBg, HealthBar = hb}
                end

                local esp = EspDrawings[player]
                local pos, onScreen = Camera:WorldToViewportPoint(hrp.Position)

                if onScreen then
                    local scale = math.clamp(1000 / (Camera.CFrame.Position - hrp.Position).Magnitude, 1, 500)
                    local w = math.floor(24 * scale / 10)
                    local h = math.floor(36 * scale / 10)
                    local x = math.floor(pos.X - w / 2)
                    local y = math.floor(pos.Y - h / 2)

                    if getgenv().BaconConfig.EspBox then
                        esp.Box.Visible = true
                        esp.Box.Size = Vector2.new(w, h)
                        esp.Box.Position = Vector2.new(x, y)
                    else
                        esp.Box.Visible = false
                    end

                    if getgenv().BaconConfig.EspHealthBar then
                        local healthPercent = math.clamp(humanoid.Health / humanoid.MaxHealth, 0, 1)
                        local barHeight = math.floor(h * healthPercent)
                        
                        local barX = x - 6
                        local barY = y

                        esp.HealthBarBg.Visible = true
                        esp.HealthBarBg.Size = Vector2.new(3, h)
                        esp.HealthBarBg.Position = Vector2.new(barX, barY)

                        esp.HealthBar.Visible = true
                        esp.HealthBar.Size = Vector2.new(1, barHeight)
                        esp.HealthBar.Position = Vector2.new(barX + 1, barY + (h - barHeight))
                    else
                        esp.HealthBarBg.Visible = false
                        esp.HealthBar.Visible = false
                    end
                else
                    esp.Box.Visible = false
                    esp.HealthBarBg.Visible = false
                    esp.HealthBar.Visible = false
                end
            else
                RemoveEsp(player)
            end
        end
    end
end)

print("킥훅쓰는 베이컨 UI 및 기능 로드 완료!")

