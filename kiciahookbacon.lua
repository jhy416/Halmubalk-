-- ============================================================================
--   [ 킥훅쓰는 베이컨 - Delta Mobile Optimized ]
--   [ Obfuscated & Protected by Custom Heavy Engine v6.9 ]
-- ============================================================================

local _0x_Junk_Data_Table = {
    0x3F2A1B, 0x984B2C, 0x1104AE, 0xFF3810, 0x552A1F, 0x99283C, 0x482911, 0x19283A,
    0x58291B, 0x33421C, 0x99182D, 0x77281E, 0x55621F, 0x112830, 0x442919, 0x993828,
    0x128391, 0x492810, 0x559281, 0x882391, 0x991283, 0x334281, 0x221938, 0x556781,
    0x889123, 0x443219, 0x998123, 0x112938, 0x665432, 0x778899, 0x123456, 0xFEDCBA
}

local function _0x_Junk_Eval()
    local _0x_acc = 0
    for _0x_i = 1, #_0x_Junk_Data_Table do
        _0x_acc = (_0x_acc + _0x_Junk_Data_Table[_0x_i]) % 0xFFFF
    end
    return _0x_acc ~= -1
end

if _0x_Junk_Eval() then
    local _0x_HOME_DIR = "kiciahook/rivals/"
    if makefolder then
        pcall(makefolder, _0x_HOME_DIR)
        pcall(makefolder, _0x_HOME_DIR .. "cosmetics")
        pcall(makefolder, _0x_HOME_DIR .. "configs")
    end

    do
        repeat task.wait() until game:IsLoaded()

        local function _0x_safeRef(_0x_ref)
            return cloneref and cloneref(_0x_ref) or _0x_ref
        end

        local _0x_setidentity = setthreadcontext or setthreadidentity or set_thread_identity or set_thread_context or setidentity

        local _0x_Players = _0x_safeRef(game:GetService("Players"))
        local _0x_RunService = _0x_safeRef(game:GetService("RunService"))
        local _0x_UserInputService = _0x_safeRef(game:GetService("UserInputService"))
        local _0x_CoreGui = _0x_safeRef(game:GetService("CoreGui"))
        local _0x_HttpService = _0x_safeRef(game:GetService("HttpService"))
        local _0x_ReplicatedStorage = _0x_safeRef(game:GetService("ReplicatedStorage"))
        local _0x_Workspace = _0x_safeRef(game:GetService("Workspace"))
        local _0x_Camera = _0x_Workspace.CurrentCamera
        local _0x_LocalPlayer = _0x_Players.LocalPlayer

        for _, _0x_name in ipairs({"킥훅쓰는 베이컨", "vallkmult free v1", "mult up free v1", "MuteUpGUI", "RagebotStatusHUD", "RagebotdkCenterHUD", "zero up 나다 free v1", "LuminousPureHub", "HoNyang💩FOV", "HalmuESP", "multvallkRageUI", "ExecutorToggleUI"}) do
            local _0x_oldGui = _0x_CoreGui:FindFirstChild(_0x_name) or (_0x_LocalPlayer:FindFirstChild("PlayerGui") and _0x_LocalPlayer.PlayerGui:FindFirstChild(_0x_name))
            if _0x_oldGui then _0x_oldGui:Destroy() end
        end

        --------------------------------------------------------------------
        -- [ CONFIGURATION & SETTINGS ]
        --------------------------------------------------------------------
        getgenv().MultConfig = {
            RageEnabled = true,
            FireRate = 0.0005,
            RageVersion = "vallkmult_premium_v6",
            AimbotEnabled = false,
            AimbotHitPart = "Head",
            AimbotDrawFOV = false,
            AimbotFOVSize = 120,
            AimbotWallCheck = false,
            SilentEnabled = false,
            SilentHitPart = "Head",
            SilentDrawFOV = false,
            SilentFOVSize = 150,
            SilentWallCheck = false,
            EspEnabled = false,
            BoxEsp = false,
            NameEsp = false,
            HealthEsp = false
        }

        --------------------------------------------------------------------
        -- [ 화면 중앙 상태 HUD ]
        --------------------------------------------------------------------
        local _0x_centerHudGui = Instance.new("ScreenGui")
        _0x_centerHudGui.Name = "Bacon_HUD"
        _0x_centerHudGui.ResetOnSpawn = false
        _0x_centerHudGui.IgnoreGuiInset = true
        _0x_centerHudGui.DisplayOrder = 100001
        if _0x_setidentity then pcall(function() _0x_setidentity(8) end) end
        
        local _0x_successGui = pcall(function()
            _0x_centerHudGui.Parent = _0x_CoreGui
        end)
        if not _0x_successGui and _0x_LocalPlayer:FindFirstChild("PlayerGui") then
            _0x_centerHudGui.Parent = _0x_LocalPlayer.PlayerGui
        end

        local _0x_centerLabel = Instance.new("TextLabel")
        _0x_centerLabel.Name = "StatusLabel"
        _0x_centerLabel.Size = UDim2.new(0, 300, 0, 28)
        _0x_centerLabel.Position = UDim2.new(0.5, 0, 0.08, 0)
        _0x_centerLabel.AnchorPoint = Vector2.new(0.5, 0)
        _0x_centerLabel.Font = Enum.Font.Code
        _0x_centerLabel.TextSize = 12
        _0x_centerLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        _0x_centerLabel.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
        _0x_centerLabel.BorderColor3 = Color3.fromRGB(80, 80, 80)
        _0x_centerLabel.BorderSizePixel = 1
        _0x_centerLabel.Text = "킥훅쓰는 베이컨 [Active]"
        _0x_centerLabel.Parent = _0x_centerHudGui

        local _0x_centerCorner = Instance.new("UICorner")
        _0x_centerCorner.CornerRadius = UDim.new(0, 4)
        _0x_centerCorner.Parent = _0x_centerLabel

        --------------------------------------------------------------------
        -- [ 모바일 이미지 스타일 UI 프레임워크 (좌측 탭 구조) ]
        --------------------------------------------------------------------
        local _0x_UIBase = {}
        _0x_UIBase.__index = _0x_UIBase
        function _0x_UIBase.new()
            local _0x_self = setmetatable({}, _0x_UIBase)
            _0x_self.instances = {}
            _0x_self.visible = true
            _0x_self.tabs = {}
            _0x_self.tabButtons = {}
            _0x_self.currentTab = nil

            local _0x_screenGui = Instance.new("ScreenGui")
            _0x_screenGui.Name = "킥훅쓰는 베이컨"
            _0x_screenGui.ResetOnSpawn = false
            _0x_screenGui.IgnoreGuiInset = true
            _0x_screenGui.DisplayOrder = 99999
            _0x_self.instances.gui = _0x_screenGui

            -- 메인 윈도우 (모바일 가로모드 최적화 크기)
            local _0x_container = Instance.new("Frame")
            _0x_container.Name = "MainContainer"
            _0x_container.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
            _0x_container.BorderSizePixel = 1
            _0x_container.BorderColor3 = Color3.fromRGB(50, 50, 50)
            _0x_container.AnchorPoint = Vector2.new(0.5, 0.5)
            _0x_container.Position = UDim2.new(0.5, 0, 0.5, 0)
            _0x_container.Size = UDim2.new(0, 480, 0, 300)
            _0x_container.Parent = _0x_screenGui
            _0x_self.instances.container = _0x_container

            local _0x_uiScale = Instance.new("UIScale")
            _0x_uiScale.Scale = 1.0
            _0x_uiScale.Parent = _0x_container

            -- 상단 타이틀바 (아이콘 + 이름 + 검색바)
            local _0x_topBar = Instance.new("Frame")
            _0x_topBar.Name = "TopBar"
            _0x_topBar.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
            _0x_topBar.BorderSizePixel = 0
            _0x_topBar.Size = UDim2.new(1, 0, 0, 32)
            _0x_topBar.Parent = _0x_container

            local _0x_title = Instance.new("TextLabel")
            _0x_title.Size = UDim2.new(0, 160, 1, 0)
            _0x_title.Position = UDim2.new(0, 10, 0, 0)
            _0x_title.Font = Enum.Font.SourceSansBold
            _0x_title.TextSize = 13
            _0x_title.BackgroundTransparency = 1
            _0x_title.TextXAlignment = Enum.TextXAlignment.Left
            _0x_title.TextColor3 = Color3.fromRGB(240, 240, 240)
            _0x_title.Text = "  킥훅쓰는 베이컨"
            _0x_title.Parent = _0x_topBar

            -- 상단 검색바 박스
            local _0x_searchBox = Instance.new("TextBox")
            _0x_searchBox.Name = "SearchBox"
            _0x_searchBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            _0x_searchBox.BorderColor3 = Color3.fromRGB(60, 60, 60)
            _0x_searchBox.Position = UDim2.new(1, -150, 0.5, -11)
            _0x_searchBox.Size = UDim2.new(0, 140, 0, 22)
            _0x_searchBox.Font = Enum.Font.SourceSans
            _0x_searchBox.TextSize = 12
            _0x_searchBox.TextColor3 = Color3.fromRGB(200, 200, 200)
            _0x_searchBox.PlaceholderText = "Search..."
            _0x_searchBox.Text = ""
            _0x_searchBox.Parent = _0x_topBar

            local _0x_searchCorner = Instance.new("UICorner")
            _0x_searchCorner.CornerRadius = UDim.new(0, 3)
            _0x_searchCorner.Parent = _0x_searchBox

            -- 좌측 탭 사이드바 메뉴 영역
            local _0x_tabSidebar = Instance.new("ScrollingFrame")
            _0x_tabSidebar.Name = "TabSidebar"
            _0x_tabSidebar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
            _0x_tabSidebar.BorderSizePixel = 0
            _0x_tabSidebar.Position = UDim2.new(0, 0, 0, 32)
            _0x_tabSidebar.Size = UDim2.new(0, 115, 1, -32)
            _0x_tabSidebar.CanvasSize = UDim2.new(0, 0, 0, 0)
            _0x_tabSidebar.AutomaticCanvasSize = Enum.AutomaticSize.Y
            _0x_tabSidebar.ScrollBarThickness = 2
            _0x_tabSidebar.Parent = _0x_container

            local _0x_tabLayout = Instance.new("UIListLayout")
            _0x_tabLayout.SortOrder = Enum.SortOrder.LayoutOrder
            _0x_tabLayout.Padding = UDim.new(0, 2)
            _0x_tabLayout.Parent = _0x_tabSidebar

            _0x_self.instances.tabSidebar = _0x_tabSidebar

            -- 우측 콘텐츠 컨테이너 영역
            local _0x_contentArea = Instance.new("Frame")
            _0x_contentArea.Name = "ContentArea"
            _0x_contentArea.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
            _0x_contentArea.BorderSizePixel = 0
            _0x_contentArea.Position = UDim2.new(0, 115, 0, 32)
            _0x_contentArea.Size = UDim2.new(1, -115, 1, -32)
            _0x_contentArea.Parent = _0x_container
            _0x_self.instances.contentArea = _0x_contentArea

            -- 모바일 오픈/클로즈 토글 버튼
            local _0x_openBtn = Instance.new("TextButton")
            _0x_openBtn.Name = "OpenButton"
            _0x_openBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
            _0x_openBtn.BorderColor3 = Color3.fromRGB(80, 80, 80)
            _0x_openBtn.Position = UDim2.new(0.92, 0, 0.04, 0)
            _0x_openBtn.AnchorPoint = Vector2.new(1, 0)
            _0x_openBtn.Size = UDim2.new(0, 60, 0, 26)
            _0x_openBtn.Font = Enum.Font.SourceSansBold
            _0x_openBtn.TextSize = 12
            _0x_openBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
            _0x_openBtn.Text = "Menu"
            _0x_openBtn.Parent = _0x_screenGui

            local _0x_openCorner = Instance.new("UICorner")
            _0x_openCorner.CornerRadius = UDim.new(0, 4)
            _0x_openCorner.Parent = _0x_openBtn

            _0x_openBtn.MouseButton1Click:Connect(function()
                _0x_self.visible = not _0x_self.visible
                _0x_container.Visible = _0x_self.visible
            end)

            -- 창 드래그 기능 (모바일 터치 완벽 호환)
            local _0x_dragging, _0x_dragStart, _0x_startPos
            _0x_topBar.InputBegan:Connect(function(_0x_input)
                if _0x_input.UserInputType == Enum.UserInputType.MouseButton1 or _0x_input.UserInputType == Enum.UserInputType.Touch then
                    _0x_dragging = true
                    _0x_dragStart = _0x_input.Position
                    _0x_startPos = _0x_container.Position
                end
            end)

            _0x_UserInputService.InputChanged:Connect(function(_0x_input)
                if _0x_dragging and (_0x_input.UserInputType == Enum.UserInputType.MouseMovement or _0x_input.UserInputType == Enum.UserInputType.Touch) then
                    local _0x_delta = _0x_input.Position - _0x_dragStart
                    _0x_container.Position = UDim2.new(_0x_startPos.X.Scale, _0x_startPos.X.Offset + _0x_delta.X, _0x_startPos.Y.Scale, _0x_startPos.Y.Offset + _0x_delta.Y)
                end
            end)

            _0x_UserInputService.InputEnded:Connect(function(_0x_input)
                if _0x_input.UserInputType == Enum.UserInputType.MouseButton1 or _0x_input.UserInputType == Enum.UserInputType.Touch then
                    _0x_dragging = false
                end
            end)

            return _0x_self
        end

        function _0x_UIBase:AddTab(_0x_name)
            local _0x_tabBtn = Instance.new("TextButton")
            _0x_tabBtn.Name = _0x_name .. "TabBtn"
            _0x_tabBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
            _0x_tabBtn.BorderSizePixel = 0
            _0x_tabBtn.Size = UDim2.new(1, 0, 0, 30)
            _0x_tabBtn.Font = Enum.Font.SourceSans
            _0x_tabBtn.TextSize = 12
            _0x_tabBtn.TextColor3 = Color3.fromRGB(160, 160, 160)
            _0x_tabBtn.Text = "  " .. _0x_name
            _0x_tabBtn.TextXAlignment = Enum.TextXAlignment.Left
            _0x_tabBtn.Parent = self.instances.tabSidebar

            local _0x_tabHolder = Instance.new("ScrollingFrame")
            _0x_tabHolder.Name = _0x_name .. "Holder"
            _0x_tabHolder.BackgroundTransparency = 1
            _0x_tabHolder.Position = UDim2.new(0, 8, 0, 8)
            _0x_tabHolder.Size = UDim2.new(1, -16, 1, -16)
            _0x_tabHolder.Visible = false
            _0x_tabHolder.CanvasSize = UDim2.new(0, 0, 0, 0)
            _0x_tabHolder.AutomaticCanvasSize = Enum.AutomaticSize.Y
            _0x_tabHolder.ScrollBarThickness = 3
            _0x_tabHolder.Parent = self.instances.contentArea

            local _0x_uiLayout = Instance.new("UIListLayout")
            _0x_uiLayout.Padding = UDim.new(0, 6)
            _0x_uiLayout.SortOrder = Enum.SortOrder.LayoutOrder
            _0x_uiLayout.Parent = _0x_tabHolder

            self.tabs[_0x_name] = _0x_tabHolder
            self.tabButtons[_0x_name] = _0x_tabBtn

            _0x_tabBtn.MouseButton1Click:Connect(function()
                for _0x_tName, _0x_h in pairs(self.tabs) do
                    local _0x_btn = self.tabButtons[_0x_tName]
                    local _0x_isTarget = (_0x_tName == _0x_name)
                    _0x_h.Visible = _0x_isTarget
                    if _0x_btn then
                        _0x_btn.TextColor3 = _0x_isTarget and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(160, 160, 160)
                        _0x_btn.BackgroundColor3 = _0x_isTarget and Color3.fromRGB(32, 32, 32) or Color3.fromRGB(20, 20, 20)
                    end
                end
            end)

            if not self.currentTab then
                self.currentTab = _0x_name
                _0x_tabHolder.Visible = true
                _0x_tabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
                _0x_tabBtn.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
            end

            return _0x_tabHolder
        end

        function _0x_UIBase:Finish()
            if _0x_setidentity then pcall(function() _0x_setidentity(8) end) end
            pcall(function()
                self.instances.gui.Parent = _0x_CoreGui
            end)
            if self.instances.gui.Parent ~= _0x_CoreGui and _0x_LocalPlayer:FindFirstChild("PlayerGui") then
                self.instances.gui.Parent = _0x_LocalPlayer.PlayerGui
            end
        end

        --------------------------------------------------------------------
        -- [ 모바일 맞춤형 UI 컴포넌트 (토글, 슬라이더, 드롭다운) ]
        --------------------------------------------------------------------
        local _0x_UIToggle = {}
        _0x_UIToggle.__index = _0x_UIToggle
        function _0x_UIToggle.new(_0x_tab, _0x_labelText, _0x_defaultVal, _0x_callback)
            local _0x_self = setmetatable({}, _0x_UIToggle)
            _0x_self.value = _0x_defaultVal or false
            _0x_self.callback = _0x_callback or function() end

            local _0x_btn = Instance.new("TextButton")
            _0x_btn.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
            _0x_btn.BorderColor3 = Color3.fromRGB(50, 50, 50)
            _0x_btn.Size = UDim2.new(1, 0, 0, 28)
            _0x_btn.AutoButtonColor = false
            _0x_btn.Text = ""
            _0x_btn.Parent = _0x_tab

            local _0x_corner = Instance.new("UICorner")
            _0x_corner.CornerRadius = UDim.new(0, 4)
            _0x_corner.Parent = _0x_btn

            local _0x_lbl = Instance.new("TextLabel")
            _0x_lbl.Font = Enum.Font.SourceSans
            _0x_lbl.TextSize = 12
            _0x_lbl.Position = UDim2.new(0, 10, 0, 0)
            _0x_lbl.Size = UDim2.new(1, -40, 1, 0)
            _0x_lbl.Text = _0x_labelText
            _0x_lbl.BackgroundTransparency = 1
            _0x_lbl.TextColor3 = Color3.fromRGB(220, 220, 220)
            _0x_lbl.TextXAlignment = Enum.TextXAlignment.Left
            _0x_lbl.Parent = _0x_btn

            local _0x_box = Instance.new("Frame")
            _0x_box.BackgroundColor3 = _0x_self.value and Color3.fromRGB(70, 150, 255) or Color3.fromRGB(45, 45, 45)
            _0x_box.BorderSizePixel = 0
            _0x_box.Size = UDim2.new(0, 14, 0, 14)
            _0x_box.Position = UDim2.new(1, -22, 0.5, -7)
            _0x_box.Parent = _0x_btn

            local _0x_boxCorner = Instance.new("UICorner")
            _0x_boxCorner.CornerRadius = UDim.new(0, 3)
            _0x_boxCorner.Parent = _0x_box

            _0x_btn.MouseButton1Click:Connect(function()
                _0x_self.value = not _0x_self.value
                _0x_box.BackgroundColor3 = _0x_self.value and Color3.fromRGB(70, 150, 255) or Color3.fromRGB(45, 45, 45)
                _0x_self.callback(_0x_self.value)
            end)

            return _0x_self
        end

        local _0x_UISlider = {}
        _0x_UISlider.__index = _0x_UISlider
        function _0x_UISlider.new(_0x_tab, _0x_labelText, _0x_min, _0x_max, _0x_defaultVal, _0x_callback)
            local _0x_self = setmetatable({}, _0x_UISlider)
            _0x_self.min = _0x_min or 0
            _0x_self.max = _0x_max or 100
            _0x_self.value = _0x_defaultVal or _0x_min
            _0x_self.callback = _0x_callback or function() end

            local _0x_container = Instance.new("Frame")
            _0x_container.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
            _0x_container.BorderColor3 = Color3.fromRGB(50, 50, 50)
            _0x_container.Size = UDim2.new(1, 0, 0, 42)
            _0x_container.Parent = _0x_tab

            local _0x_corner = Instance.new("UICorner")
            _0x_corner.CornerRadius = UDim.new(0, 4)
            _0x_corner.Parent = _0x_container

            local _0x_lbl = Instance.new("TextLabel")
            _0x_lbl.Font = Enum.Font.SourceSans
            _0x_lbl.TextSize = 12
            _0x_lbl.Position = UDim2.new(0, 10, 0, 4)
            _0x_lbl.Size = UDim2.new(1, -20, 0, 14)
            _0x_lbl.Text = string.format("%s: %s", _0x_labelText, tostring(_0x_self.value))
            _0x_lbl.BackgroundTransparency = 1
            _0x_lbl.TextColor3 = Color3.fromRGB(220, 220, 220)
            _0x_lbl.TextXAlignment = Enum.TextXAlignment.Left
            _0x_lbl.Parent = _0x_container

            local _0x_track = Instance.new("TextButton")
            _0x_track.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            _0x_track.BorderSizePixel = 0
            _0x_track.Size = UDim2.new(1, -20, 0, 6)
            _0x_track.Position = UDim2.new(0, 10, 0, 26)
            _0x_track.Text = ""
            _0x_track.AutoButtonColor = false
            _0x_track.Parent = _0x_container

            local _0x_fill = Instance.new("Frame")
            _0x_fill.BorderSizePixel = 0
            _0x_fill.Size = UDim2.new((_0x_self.value - _0x_self.min)/(_0x_self.max - _0x_self.min), 0, 1, 0)
            _0x_fill.BackgroundColor3 = Color3.fromRGB(70, 150, 255)
            _0x_fill.Parent = _0x_track

            local function _0x_update(_0x_input)
                local _0x_pct = math.clamp((_0x_input.Position.X - _0x_track.AbsolutePosition.X) / _0x_track.AbsoluteSize.X, 0, 1)
                _0x_self.value = math.floor((_0x_self.min + (_0x_self.max - _0x_self.min) * _0x_pct) * 10000) / 10000
                _0x_fill.Size = UDim2.new(_0x_pct, 0, 1, 0)
                _0x_lbl.Text = string.format("%s: %s", _0x_labelText, tostring(_0x_self.value))
                _0x_self.callback(_0x_self.value)
            end

            local _0x_sliding = false
            _0x_track.InputBegan:Connect(function(_0x_input)
                if _0x_input.UserInputType == Enum.UserInputType.MouseButton1 or _0x_input.UserInputType == Enum.UserInputType.Touch then
                    _0x_sliding = true
                    _0x_update(_0x_input)
                end
            end)
            _0x_UserInputService.InputChanged:Connect(function(_0x_input)
                if _0x_sliding and (_0x_input.UserInputType == Enum.UserInputType.MouseMovement or _0x_input.UserInputType == Enum.UserInputType.Touch) then
                    _0x_update(_0x_input)
                end
            end)
            _0x_UserInputService.InputEnded:Connect(function(_0x_input)
                if _0x_input.UserInputType == Enum.UserInputType.MouseButton1 or _0x_input.UserInputType == Enum.UserInputType.Touch then
                    _0x_sliding = false
                end
            end)

            return _0x_self
        end

        local _0x_UIDropdown = {}
        _0x_UIDropdown.__index = _0x_UIDropdown
        function _0x_UIDropdown.new(_0x_tab, _0x_labelText, _0x_list, _0x_defaultVal, _0x_callback)
            local _0x_self = setmetatable({}, _0x_UIDropdown)
            _0x_self.value = _0x_defaultVal or _0x_list[1]
            _0x_self.callback = _0x_callback or function() end
            _0x_self.open = false

            local _0x_container = Instance.new("Frame")
            _0x_container.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
            _0x_container.BorderColor3 = Color3.fromRGB(50, 50, 50)
            _0x_container.Size = UDim2.new(1, 0, 0, 48)
            _0x_container.Parent = _0x_tab

            local _0x_corner = Instance.new("UICorner")
            _0x_corner.CornerRadius = UDim.new(0, 4)
            _0x_corner.Parent = _0x_container

            local _0x_lbl = Instance.new("TextLabel")
            _0x_lbl.Font = Enum.Font.SourceSans
            _0x_lbl.TextSize = 12
            _0x_lbl.Position = UDim2.new(0, 10, 0, 4)
            _0x_lbl.Size = UDim2.new(1, -20, 0, 14)
            _0x_lbl.Text = _0x_labelText
            _0x_lbl.BackgroundTransparency = 1
            _0x_lbl.TextColor3 = Color3.fromRGB(220, 220, 220)
            _0x_lbl.TextXAlignment = Enum.TextXAlignment.Left
            _0x_lbl.Parent = _0x_container

            local _0x_btn = Instance.new("TextButton")
            _0x_btn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            _0x_btn.BorderColor3 = Color3.fromRGB(60, 60, 60)
            _0x_btn.Size = UDim2.new(1, -20, 0, 22)
            _0x_btn.Position = UDim2.new(0, 10, 0, 21)
            _0x_btn.Font = Enum.Font.SourceSans
            _0x_btn.TextSize = 12
            _0x_btn.TextColor3 = Color3.fromRGB(255, 255, 255)
            _0x_btn.Text = tostring(_0x_self.value)
            _0x_btn.Parent = _0x_container

            local _0x_dropFrame = Instance.new("Frame")
            _0x_dropFrame.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
            _0x_dropFrame.BorderColor3 = Color3.fromRGB(70, 150, 255)
            _0x_dropFrame.Position = UDim2.new(0, 10, 0, 45)
            _0x_dropFrame.Size = UDim2.new(1, -20, 0, #_0x_list * 22)
            _0x_dropFrame.Visible = false
            _0x_dropFrame.ZIndex = 15
            _0x_dropFrame.Parent = _0x_container

            local _0x_listLayout = Instance.new("UIListLayout")
            _0x_listLayout.Parent = _0x_dropFrame

            for _, _0x_item in ipairs(_0x_list) do
                local _0x_itemBtn = Instance.new("TextButton")
                _0x_itemBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                _0x_itemBtn.BorderSizePixel = 0
                _0x_itemBtn.Size = UDim2.new(1, 0, 0, 22)
                _0x_itemBtn.Font = Enum.Font.SourceSans
                _0x_itemBtn.TextSize = 12
                _0x_itemBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
                _0x_itemBtn.Text = tostring(_0x_item)
                _0x_itemBtn.ZIndex = 16
                _0x_itemBtn.Parent = _0x_dropFrame

                _0x_itemBtn.MouseButton1Click:Connect(function()
                    _0x_self.value = _0x_item
                    _0x_btn.Text = tostring(_0x_item)
                    _0x_dropFrame.Visible = false
                    _0x_self.open = false
                    _0x_self.callback(_0x_self.value)
                end)
            end

            _0x_btn.MouseButton1Click:Connect(function()
                _0x_self.open = not _0x_self.open
                _0x_dropFrame.Visible = _0x_self.open
            end)

            return _0x_self
        end

        --------------------------------------------------------------------
        -- [ UI 탭 생성 및 기능 배치 ]
        --------------------------------------------------------------------
        local _0x_UI = _0x_UIBase.new()

        local _0x_rageTab = _0x_UI:AddTab("Ragebot")
        local _0x_combatTab = _0x_UI:AddTab("Combat")
        local _0x_espTab = _0x_UI:AddTab("ESP")
        local _0x_settingsTab = _0x_UI:AddTab("Settings")

        -- Ragebot 탭 내용
        _0x_UIDropdown.new(_0x_rageTab, "Rage Version", {"vallkmult_premium_v6", "vallkmult_old_rage_bot_v3"}, "vallkmult_premium_v6", function(_0x_sel)
            getgenv().MultConfig.RageVersion = _0x_sel
        end)
        _0x_UIToggle.new(_0x_rageTab, "레이지봇 활성화", true, function(_0x_val)
            getgenv().MultConfig.RageEnabled = _0x_val
        end)
        _0x_UISlider.new(_0x_rageTab, "발사 속도", 0.0001, 0.01, 0.0005, function(_0x_val)
            getgenv().MultConfig.FireRate = _0x_val
        end)

        -- Combat 탭 내용
        _0x_UIToggle.new(_0x_combatTab, "에임봇 활성화", false, function(_0x_v) getgenv().MultConfig.AimbotEnabled = _0x_v end)
        _0x_UIDropdown.new(_0x_combatTab, "에임 타겟 파트", {"Head", "HumanoidRootPart", "Torso"}, "Head", function(_0x_v) getgenv().MultConfig.AimbotHitPart = _0x_v end)
        _0x_UIToggle.new(_0x_combatTab, "에임 FOV 표시", false, function(_0x_v) getgenv().MultConfig.AimbotDrawFOV = _0x_v end)
        _0x_UIToggle.new(_0x_combatTab, "사일런트 활성화", false, function(_0x_v) getgenv().MultConfig.SilentEnabled = _0x_v end)

        -- ESP 탭 내용
        _0x_UIToggle.new(_0x_espTab, "ESP 전체 활성화", false, function(_0x_v) getgenv().MultConfig.EspEnabled = _0x_v end)
        _0x_UIToggle.new(_0x_espTab, "박스 ESP", false, function(_0x_v) getgenv().MultConfig.BoxEsp = _0x_v end)
        _0x_UIToggle.new(_0x_espTab, "이름 ESP", false, function(_0x_v) getgenv().MultConfig.NameEsp = _0x_v end)
        _0x_UIToggle.new(_0x_espTab, "체력바 ESP", false, function(_0x_v) getgenv().MultConfig.HealthEsp = _0x_v end)

        -- Settings 탭 내용
        _0x_UIToggle.new(_0x_settingsTab, "UI 상태 세이브 유지", true, function(_0x_v) end)

        _0x_UI:Finish()

        --------------------------------------------------------------------
        -- [ ESP & DRAWING SYSTEM ENGINE ]
        --------------------------------------------------------------------
        local _0x_ESP_Cache = {}

        local function _0x_createESP(_0x_plr)
            if _0x_ESP_Cache[_0x_plr] or not Drawing then return end
            local _0x_success, _0x_drawings = pcall(function()
                return {
                    Box = Drawing.new("Square"),
                    Name = Drawing.new("Text"),
                    HealthBar = Drawing.new("Line"),
                    HealthBarBack = Drawing.new("Line")
                }
            end)
            if not _0x_success or not _0x_drawings then return end

            _0x_drawings.Box.Visible = false
            _0x_drawings.Box.Thickness = 1
            _0x_drawings.Box.Color = Color3.fromRGB(70, 150, 255)
            _0x_drawings.Box.Filled = false

            _0x_drawings.Name.Visible = false
            _0x_drawings.Name.Size = 12
            _0x_drawings.Name.Center = true
            _0x_drawings.Name.Outline = true
            _0x_drawings.Name.Color = Color3.fromRGB(255, 255, 255)

            _0x_drawings.HealthBar.Visible = false
            _0x_drawings.HealthBar.Thickness = 2
            _0x_drawings.HealthBar.Color = Color3.fromRGB(0, 255, 0)

            _0x_drawings.HealthBarBack.Visible = false
            _0x_drawings.HealthBarBack.Thickness = 2
            _0x_drawings.HealthBarBack.Color = Color3.fromRGB(0, 0, 0)

            _0x_ESP_Cache[_0x_plr] = _0x_drawings
        end

        local function _0x_removeESP(_0x_plr)
            if _0x_ESP_Cache[_0x_plr] then
                for _, _0x_obj in pairs(_0x_ESP_Cache[_0x_plr]) do
                    pcall(function() _0x_obj:Remove() end)
                end
                _0x_ESP_Cache[_0x_plr] = nil
            end
        end

        for _, _0x_p in ipairs(_0x_Players:GetPlayers()) do
            if _0x_p ~= _0x_LocalPlayer then _0x_createESP(_0x_p) end
        end
        _0x_Players.PlayerAdded:Connect(_0x_createESP)
        _0x_Players.PlayerRemoving:Connect(_0x_removeESP)

        --------------------------------------------------------------------
        -- [ CORE COMBAT & RAGEBOT LOOP ]
        --------------------------------------------------------------------
        local _0x_Utility = pcall(function() return require(_0x_ReplicatedStorage.Modules.Utility) end) and require(_0x_ReplicatedStorage.Modules.Utility) or nil
        local _0x_EnumLibrary = pcall(function() return require(_0x_ReplicatedStorage.Modules.EnumLibrary) end) and require(_0x_ReplicatedStorage.Modules.EnumLibrary) or nil
        local _0x_FighterController = pcall(function() return require(_0x_LocalPlayer.PlayerScripts.Controllers.FighterController) end) and require(_0x_LocalPlayer.PlayerScripts.Controllers.FighterController) or nil
        local _0x_SpectateController = pcall(function() return require(_0x_LocalPlayer.PlayerScripts.Controllers:WaitForChild("SpectateController")) end) and require(_0x_LocalPlayer.PlayerScripts.Controllers:WaitForChild("SpectateController")) or nil

        local _0x_lastFireTick = 0

        local function _0x_isEnemy(_0x_plr)
            if _0x_plr == _0x_LocalPlayer then return false end
            if _0x_SpectateController then
                local _0x_subject = _0x_SpectateController.CurrentDuelSubject
                local _0x_dueler = _0x_subject and _0x_subject:GetDueler(_0x_LocalPlayer)
                local _0x_teamID = _0x_dueler and _0x_dueler:Get("TeamID") or nil
                if _0x_teamID and _0x_subject and _0x_subject.Duelers then
                    for _, _0x_d in _0x_subject.Duelers do
                        if _0x_d.Player == _0x_plr then
                            return _0x_d:Get("TeamID") ~= _0x_teamID
                        end
                    end
                end
            end
            return _0x_plr:GetAttribute("TeamID") ~= _0x_LocalPlayer:GetAttribute("TeamID")
        end

        _0x_RunService.Heartbeat:Connect(function()
            for _0x_plr, _0x_drawings in pairs(_0x_ESP_Cache) do
                local _0x_show = getgenv().MultConfig.EspEnabled and _0x_plr.Character and _0x_plr.Character:FindFirstChild("HumanoidRootPart") and _0x_plr.Character:FindFirstChildWhichIsA("Humanoid") and _0x_plr.Character.Humanoid.Health > 0
                if _0x_show then
                    local _0x_char = _0x_plr.Character
                    local _0x_hrp = _0x_char.HumanoidRootPart
                    local _0x_hum = _0x_char.Humanoid
                    local _0x_vector, _0x_onScreen = _0x_Camera:WorldToViewportPoint(_0x_hrp.Position)
                    if _0x_onScreen then
                        local _0x_head = _0x_char:FindFirstChild("Head")
                        local _0x_topPos = _0x_head and _0x_Camera:WorldToViewportPoint(_0x_head.Position + Vector3.new(0, 0.5, 0)) or _0x_vector
                        local _0x_bottomPos = _0x_Camera:WorldToViewportPoint(_0x_hrp.Position - Vector3.new(0, 3, 0))
                        local _0x_height = math.abs(_0x_topPos.Y - _0x_bottomPos.Y)
                        local _0x_width = _0x_height / 2

                        if getgenv().MultConfig.BoxEsp then
                            _0x_drawings.Box.Visible = true
                            _0x_drawings.Box.Size = Vector2.new(_0x_width, _0x_height)
                            _0x_drawings.Box.Position = Vector2.new(_0x_vector.X - _0x_width / 2, _0x_topPos.Y)
                        else
                            _0x_drawings.Box.Visible = false
                        end

                        if getgenv().MultConfig.NameEsp then
                            _0x_drawings.Name.Visible = true
                            _0x_drawings.Name.Text = _0x_plr.Name
                            _0x_drawings.Name.Position = Vector2.new(_0x_vector.X, _0x_topPos.Y - 14)
                        else
                            _0x_drawings.Name.Visible = false
                        end

                        if getgenv().MultConfig.HealthEsp then
                            local _0x_healthPct = math.clamp(_0x_hum.Health / _0x_hum.MaxHealth, 0, 1)
                            _0x_drawings.HealthBarBack.Visible = true
                            _0x_drawings.HealthBarBack.From = Vector2.new(_0x_vector.X - _0x_width / 2 - 6, _0x_topPos.Y + _0x_height)
                            _0x_drawings.HealthBarBack.To = Vector2.new(_0x_vector.X - _0x_width / 2 - 6, _0x_topPos.Y)

                            _0x_drawings.HealthBar.Visible = true
                            _0x_drawings.HealthBar.From = Vector2.new(_0x_vector.X - _0x_width / 2 - 6, _0x_topPos.Y + _0x_height)
                            _0x_drawings.HealthBar.To = Vector2.new(_0x_vector.X - _0x_width / 2 - 6, _0x_topPos.Y + (_0x_height * (1 - _0x_healthPct)))
                            _0x_drawings.HealthBar.Color = Color3.fromRGB(255 * (1 - _0x_healthPct), 255 * _0x_healthPct, 0)
                        else
                            _0x_drawings.HealthBar.Visible = false
                            _0x_drawings.HealthBarBack.Visible = false
                        end
                    else
                        for _, _0x_d in pairs(_0x_drawings) do _0x_d.Visible = false end
                    end
                else
                    for _, _0x_d in pairs(_0x_drawings) do _0x_d.Visible = false end
                end
            end

            if not getgenv().MultConfig.RageEnabled then return end
            
            local _0x_char = _0x_LocalPlayer.Character
            local _0x_hrp = _0x_char and _0x_char:FindFirstChild("HumanoidRootPart")
            if not _0x_hrp then return end

            local _0x_targetPlr, _0x_targetHRP, _0x_targetHead = nil, nil, nil
            local _0x_maxDist = 500

            for _, _0x_plr in ipairs(_0x_Players:GetPlayers()) do
                if _0x_isEnemy(_0x_plr) then
                    local _0x_pChar = _0x_plr.Character
                    local _0x_pHRP = _0x_pChar and _0x_pChar:FindFirstChild("HumanoidRootPart")
                    local _0x_pHead = _0x_pChar and _0x_pChar:FindFirstChild("Head")
                    local _0x_pHum = _0x_pChar and _0x_pChar:FindFirstChildWhichIsA("Humanoid")
                    if _0x_pHRP and _0x_pHead and _0x_pHum and _0x_pHum.Health > 0 then
                        local _0x_dist = (_0x_hrp.Position - _0x_pHRP.Position).Magnitude
                        if _0x_dist < _0x_maxDist then
                            _0x_maxDist = _0x_dist
                            _0x_targetPlr = _0x_plr
                            _0x_targetHRP = _0x_pHRP
                            _0x_targetHead = _0x_pHead
                        end
                    end
                end
            end

            if _0x_targetPlr and _0x_targetHead and _0x_targetHRP then
                _0x_centerLabel.Text = "킥훅쓰는 베이컨 -> " .. _0x_targetPlr.Name
                _0x_centerLabel.TextColor3 = Color3.fromRGB(255, 75, 75)

                local _0x_targetPos = (_0x_targetHRP.CFrame * CFrame.new(0, 1, 2)).Position
                local _0x_targetCFrame = CFrame.lookAt(_0x_targetPos, _0x_targetHead.Position)

                local _0x_origCF, _0x_origVel, _0x_origRot = _0x_hrp.CFrame, _0x_hrp.Velocity, _0x_hrp.RotVelocity
                _0x_hrp.CFrame = _0x_targetCFrame
                _0x_RunService:BindToRenderStep("__restore", 101, function()
                    if _0x_hrp then
                        _0x_hrp.CFrame, _0x_hrp.Velocity, _0x_hrp.RotVelocity = _0x_origCF, _0x_origVel, _0x_origRot
                    end
                    _0x_RunService:UnbindFromRenderStep("__restore")
                end)

                if _0x_FighterController and _0x_FighterController.LocalFighter and _0x_Utility and _0x_EnumLibrary then
                    local _0x_item = _0x_FighterController.LocalFighter.EquippedItem
                    if _0x_item and tick() - _0x_lastFireTick >= getgenv().MultConfig.FireRate then
                        _0x_lastFireTick = tick()
                        local _0x_payload = {
                            [utf8.char(1)] = {
                                [utf8.char(0)] = _0x_Utility:EncodeCFrame(CFrame.lookAt(_0x_targetPos, _0x_targetHead.Position)),
                                [utf8.char(1)] = _0x_Utility:EncodeCFrame(_0x_targetHead.CFrame),
                                [utf8.char(2)] = _0x_targetHead,
                                [utf8.char(3)] = _0x_Utility:ZoomCFrame and _0x_Utility:EncodeCFrame(_0x_targetHead.CFrame:ToObjectSpace(CFrame.new(_0x_targetHead.Position))) or _0x_Utility:EncodeCFrame(_0x_targetHead.CFrame)
                            }
                        }
                        pcall(function()
                            _0x_ReplicatedStorage.Remotes.Replication.Fighter.UseItem:FireServer(_0x_item:Get("ObjectID"), _0x_EnumLibrary:ToEnum("StartShooting"), _0x_payload, nil)
                        end)
                    end
                end
            else
                _0x_centerLabel.Text = "킥훅쓰는 베이컨 [Searching...]"
                _0x_centerLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            end
        end)
    end
end
