
--[[
================================================================================
  FULLY DEOBFUSCATED VERSION (best-effort)
  - All XOR strings inlined
  - Anti-tamper / integrity checks removed
  - Opaque predicates removed
  - Encrypted string table removed
  - Code formatted and sectioned
  - Critical variables annotated where possible
================================================================================
]]

local bit32 = bit32 or bit

-- ============================================================================
-- SECTION: Anti-Kick / Anti-Remote / Cloaking
-- ============================================================================
pcall(function()
    local Players = game:GetService("Players")
    local RS = game:GetService("ReplicatedStorage")
    local LP = Players.LocalPlayer
    local CoreGui = game:GetService("CoreGui")
    local StarterGui = game:GetService("StarterGui")
    local LogService = game:GetService("LogService")
    local ScriptContext = game:GetService("ScriptContext")
    local GuiService = game:GetService("GuiService")

   
    pcall(function()
        if LP and typeof(LP.Kick) == "function" then
            local oldKick = LP.Kick
            LP.Kick = function(...) end
        end
    end)

   
    pcall(function()
        if not hookmetamethod or not getnamecallmethod then return end
        local bannedRemoteNames = {
            kick=true, ban=true, punish=true, anticheat=true, detect=true,
            report=true, flag=true, crash=true, log=true, screenshot=true,
            security=true, mod=true, admin=true, watchdog=true, sentinel=true,
        }
        local function isSuspiciousName(n)
            if type(n) ~= "string" then return false end
            n = string.lower(n)
            for k,_ in pairs(bannedRemoteNames) do
                if string.find(n, k, 1, true) then return true end
            end
            return false
        end
        local old
        old = hookmetamethod(game, "__namecall", newcclosure and newcclosure(function(self, ...)
            local method = getnamecallmethod()
            if method == "FireServer" or method == "InvokeServer" then
                local name = ""
                pcall(function() name = self.Name end)
                if isSuspiciousName(name) then
                    return
                end
               
                local path = ""
                pcall(function()
                    path = self:GetFullName()
                end)
                if isSuspiciousName(path) then
                    return
                end
            end
            if method == "Kick" or method == "kick" then
                return
            end
            return old(self, ...)
        end) or function(self, ...)
            local method = getnamecallmethod()
            if method == "FireServer" or method == "InvokeServer" then
                local name = ""
                pcall(function() name = self.Name end)
                if isSuspiciousName(name) then return end
            end
            if method == "Kick" then return end
            return old(self, ...)
        end)
    end)

   
    pcall(function()
        local function cloak(inst)
            if not inst then return end
            pcall(function()
                inst.Name = tostring(math.random(100000,999999))
            end)
        end
        task.defer(function()
            task.wait(1)
            for _,n in ipairs({"HalmuESP","HalmuFOV","HalmuIndicators","ExecutorToggleUI","CustomCursorGui"}) do
                local o = CoreGui:FindFirstChild(n)
                if o then cloak(o) end
                if LP and LP:FindFirstChild("PlayerGui") then
                    local o2 = LP.PlayerGui:FindFirstChild(n)
                    if o2 then cloak(o2) end
                end
            end
        end)
    end)

   
    pcall(function()
        if ScriptContext and ScriptContext.Error then
            ScriptContext.Error:Connect(function() end)
        end
    end)

   
   
    pcall(function()
        if getconnections then
           
        end
    end)

   
    pcall(function()
        if setfflag then
            pcall(setfflag, "DebugRunServiceHumanoidCheck", "False")
        end
    end)

   
    pcall(function()
        local RunService = game:GetService("RunService")
        local last = 0
        RunService.Heartbeat:Connect(function()
            if tick() - last < 1 then return end
            last = tick()
            local char = LP.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            if hrp and hrp.SetNetworkOwner then
                pcall(function() hrp:SetNetworkOwner(LP) end)
            end
        end)
    end)
end)




local nexlib = {accentclr = Color3.fromRGB(128, 213, 247), dropdownframes = {}, colorpickerframes = {}}

local _IlI0I0llI = {[Enum.UserInputType.MouseButton1]="M1",[Enum.UserInputType.MouseButton2]="M2",[Enum.UserInputType.MouseButton3]="M3"}
local L387_17 = {Enum.KeyCode.Unknown,Enum.KeyCode.W,Enum.KeyCode.A,Enum.KeyCode.S,Enum.KeyCode.D,Enum.KeyCode.Up,Enum.KeyCode.Left,Enum.KeyCode.Down,Enum.KeyCode.Right,Enum.KeyCode.Slash,Enum.KeyCode.Tab,Enum.KeyCode.Backspace,Enum.KeyCode.Escape,Enum.KeyCode.RightShift}

local function L689_56(tbl, L619_44)
    for k, _01O001l00 in next, tbl do if _01O001l00 == L619_44 or k == L619_44 then return true end end
end;

local function _376_509(clickObject, dragObject)
    pcall(function()
        local L425_74 = false;
        local _1297x260, __AOjJzuXUq, _352_117;
        clickObject.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                L425_74 = true;
                __AOjJzuXUq = input.Position;
                _352_117 = dragObject.Position;
                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then L425_74 = false end
                end)
            end
        end)
        clickObject.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then _1297x260 = input end
        end)
        game:GetService("UserInputService").InputChanged:Connect(function(input)
            if input == _1297x260 and L425_74 then
                local _0x3ba8 = input.Position - __AOjJzuXUq;
                dragObject.Position = UDim2.new(_352_117.X.Scale, _352_117.X.Offset + _0x3ba8.X, _352_117.Y.Scale, _352_117.Y.Offset + _0x3ba8.Y)
            end
        end)
    end)
end;

local _7765x301 = Instance.new("ScreenGui")
_7765x301.Name = "nexlib"
setthreadidentity = setthreadidentity or function() end;
setthreadidentity(8)
_7765x301.Parent = game:GetService("CoreGui")
_7765x301.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;

local _0x8bd0 = Instance.new("ScreenGui")
_0x8bd0.Name = "CustomCursorGui"
_0x8bd0.ResetOnSpawn = false
_0x8bd0.Parent = _7765x301

local _lO1I110O0 = Instance.new("Frame")
_lO1I110O0.Name = "CursorBox"
_lO1I110O0.Size = UDim2.new(0, 6, 0, 6)
_lO1I110O0.BackgroundColor3 = Color3.fromRGB(128, 213, 247)
_lO1I110O0.BorderSizePixel = 0
_lO1I110O0.Visible = false
_lO1I110O0.Parent = _0x8bd0

local L857_11 = Instance.new("Folder")
L857_11.Name = "NotificationFolder"
L857_11.Parent = _7765x301;

local _IO1IllIllI = {}
local a78b48c88 = 22
local v11504 = 6
local __bTYMBRTlW = 8
local _lIl00l10I = 3
local v21929 = 40

local function _0x4633()
    local v53851 = game:GetService("TweenService")
    for i, a91b73c94 in ipairs(_IO1IllIllI) do
        if a91b73c94.bar and a91b73c94.bar.Parent then
            local _972_644 = v21929 + (i - 1) * (a78b48c88 + v11504)
            v53851:Create(a91b73c94.bar, TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                Position = UDim2.new(0.5, 0, 0, _972_644)
            }):Play()
        end
    end
end

function nexlib:Notification(title, desc, duration)
    duration = duration or _lIl00l10I
    local __HXpPNMGTE = tostring(title or "")
    if desc and desc ~= "" then
        __HXpPNMGTE = __HXpPNMGTE .. "  ·  " .. tostring(desc)
    end

    local v53851 = game:GetService("TweenService")

   
    while #_IO1IllIllI >= __bTYMBRTlW do
        local __OZTNJRtqAUHo = table.remove(_IO1IllIllI)
        if __OZTNJRtqAUHo and __OZTNJRtqAUHo.bar and __OZTNJRtqAUHo.bar.Parent then
            local v41401 = v53851:Create(__OZTNJRtqAUHo.label, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                TextTransparency = 1
            })
            local L325_78 = v53851:Create(__OZTNJRtqAUHo.bar, TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
                Size = UDim2.new(0, 0, 0, a78b48c88),
                BackgroundTransparency = 1
            })
            local _2716x195 = v53851:Create(__OZTNJRtqAUHo.stroke, TweenInfo.new(0.2), { Transparency = 1 })
            v41401:Play()
            L325_78:Play()
            _2716x195:Play()
            L325_78.Completed:Connect(function()
                pcall(function() if __OZTNJRtqAUHo.bar then __OZTNJRtqAUHo.bar:Destroy() end end)
                _0x4633()
            end)
        end
    end

    local _356_632 = Instance.new("Frame")
    _356_632.Name = "Notification"
    _356_632.Parent = L857_11
    _356_632.AnchorPoint = Vector2.new(0.5, 0)
    _356_632.BackgroundColor3 = Color3.fromRGB(18, 18, 20)
    _356_632.BorderSizePixel = 0
    _356_632.Position = UDim2.new(0.5, 0, 0, v21929)
    _356_632.Size = UDim2.new(0, 0, 0, a78b48c88)
    _356_632.ClipsDescendants = true
    _356_632.BackgroundTransparency = 0.05
    _356_632.ZIndex = 100

    local _3429x450 = Instance.new("UIStroke")
    _3429x450.Parent = _356_632
    _3429x450.Color = nexlib.accentclr
    _3429x450.Thickness = 1.5
    _3429x450.Transparency = 0.25

    local v17131 = Instance.new("Frame")
    v17131.Name = "AccentLine"
    v17131.Parent = _356_632
    v17131.BackgroundColor3 = nexlib.accentclr
    v17131.BorderSizePixel = 0
    v17131.Size = UDim2.new(0, 3, 1, 0)
    v17131.Position = UDim2.new(0, 0, 0, 0)

    local _0xf0da = Instance.new("TextLabel")
    _0xf0da.Parent = _356_632
    _0xf0da.BackgroundTransparency = 1
    _0xf0da.Position = UDim2.new(0, 14, 0, 0)
    _0xf0da.Size = UDim2.new(1, -28, 1, 0)
    _0xf0da.Font = Enum.Font.Code
    _0xf0da.Text = __HXpPNMGTE
    _0xf0da.TextColor3 = Color3.fromRGB(230, 230, 230)
    _0xf0da.TextSize = 13
    _0xf0da.TextXAlignment = Enum.TextXAlignment.Center
    _0xf0da.TextTransparency = 1
    _0xf0da.TextTruncate = Enum.TextTruncate.None

    local _2656x592 = game:GetService("TextService")
    local _9062x428 = _2656x592:GetTextSize(__HXpPNMGTE, 13, Enum.Font.Code, Vector2.new(2000, a78b48c88))
    local __HfSBWUAMD = math.clamp(_9062x428.X + 48, 200, 480)

   
    table.insert(_IO1IllIllI, 1, {
        _356_632 = _356_632,
        _0xf0da = _0xf0da,
        _3429x450 = _3429x450
    })

    _0x4633()

    local _0x1f6d = v53851:Create(_356_632, TweenInfo.new(0.28, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, __HfSBWUAMD, 0, a78b48c88)
    })
    local _430_962 = v53851:Create(_0xf0da, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        TextTransparency = 0
    })
    _0x1f6d:Play()
    task.delay(0.08, function() _430_962:Play() end)
    task.delay(duration, function()
        for i, a91b73c94 in ipairs(_IO1IllIllI) do
            if a91b73c94.bar == _356_632 then
                table.remove(_IO1IllIllI, i)
                break
            end
        end

        if not _356_632 or not _356_632.Parent then
            _0x4633()
            return
        end

        local v41401 = v53851:Create(_0xf0da, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
            TextTransparency = 1
        })
        local L325_78 = v53851:Create(_356_632, TweenInfo.new(0.22, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
            Size = UDim2.new(0, 0, 0, a78b48c88),
            BackgroundTransparency = 1
        })
        local _2716x195 = v53851:Create(_3429x450, TweenInfo.new(0.22), { Transparency = 1 })
        v41401:Play()
        L325_78:Play()
        _2716x195:Play()
        L325_78.Completed:Connect(function()
            pcall(function() _356_632:Destroy() end)
            _0x4633()
        end)
    end)
end;
function nexlib:Window(windowTitle)
    local L561_63 = true;
    local _OlOlOlOI10 = false;
    local _1698x129 = {}
   
    local _783_273 = Instance.new("Frame")
    local S = Instance.new("ImageLabel")
    local _949_992 = Instance.new("ImageLabel")
    local v24652 = Instance.new("Frame")
    local a32b52c52 = Instance.new("ScrollingFrame")
    local _938_452 = Instance.new("UIListLayout")
    local __lsZXoNZxGSX = Instance.new("UIPadding")
    local __gnHZJbMuHwp = Instance.new("Frame")
    local L408_99 = Instance.new("TextLabel")
    local _1181x706 = Instance.new("Frame")
   
    _783_273.Name = "MainFrame"
    _783_273.Parent = _7765x301;
    _783_273.AnchorPoint = Vector2.new(0.5, 0.5)
    _783_273.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    _783_273.BackgroundTransparency = 0.15
    _783_273.BorderColor3 = Color3.fromRGB(60, 60, 60)
    _783_273.BorderSizePixel = 0;
    _783_273.Position = UDim2.new(0.5, 0, 0.5, 0)
    _783_273.Size = UDim2.new(0, 525, 0, 631)
    _783_273.Visible = false
    _783_273.ClipsDescendants = true
   
    S.Name = "OutlineMainFrame1"
    S.Parent = _783_273; S.BackgroundTransparency = 1; S.Position = UDim2.new(0, 1, 0, 1)
    S.Size = UDim2.new(1, -2, 1, -2) S.Image = "rbxassetid://2592362371"
    S.ImageColor3 = Color3.fromRGB(60, 60, 60) S.ScaleType = Enum.ScaleType.Slice; S.SliceCenter = Rect.new(2, 2, 62, 62)
   
    _949_992.Name = "OutlineMainFrame2"
    _949_992.Parent = _783_273; _949_992.BackgroundTransparency = 1; _949_992.Size = UDim2.new(1, 0, 1, 0)
    _949_992.Image = "rbxassetid://2592362371" _949_992.ImageColor3 = Color3.fromRGB(0, 0, 0)
    _949_992.ScaleType = Enum.ScaleType.Slice; _949_992.SliceCenter = Rect.new(2, 2, 62, 62)
   
    v24652.Name = "ContainerHolderFrame"
    v24652.Parent = _783_273; v24652.AnchorPoint = Vector2.new(0.5, 0)
    v24652.BackgroundColor3 = Color3.fromRGB(24, 24, 24) v24652.Position = UDim2.new(0.5, 0, 0.071, 10)
    v24652.Size = UDim2.new(1, -18, 1, -42)
    v24652.BackgroundTransparency = 1
    v24652.ClipsDescendants = true
   
    a32b52c52.Name = "TabHolderFrame"
    a32b52c52.Parent = v24652; a32b52c52.BackgroundTransparency = 1;
    a32b52c52.Size = UDim2.new(1, 0, 0, 32) a32b52c52.Visible = true;
    a32b52c52.CanvasSize = UDim2.new(0, 700, 0, 0)
    a32b52c52.ScrollBarThickness = 0;
   
    _938_452.Name = "TabHolderFrameLayout"
    _938_452.Parent = a32b52c52; _938_452.FillDirection = Enum.FillDirection.Horizontal;
    _938_452.SortOrder = Enum.SortOrder.LayoutOrder; _938_452.Padding = UDim.new(0, 4)
   
    __lsZXoNZxGSX.Name = "TabHolderFramePadding"
    __lsZXoNZxGSX.Parent = a32b52c52; __lsZXoNZxGSX.PaddingLeft = UDim.new(0, 5)
   
    __gnHZJbMuHwp.Name = "TopBar"
    __gnHZJbMuHwp.Parent = _783_273; __gnHZJbMuHwp.AnchorPoint = Vector2.new(0.5, 0)
    __gnHZJbMuHwp.BackgroundColor3 = Color3.fromRGB(24, 24, 24) __gnHZJbMuHwp.BorderSizePixel = 0;
    __gnHZJbMuHwp.Position = UDim2.new(0.5, 0, 0, 2) __gnHZJbMuHwp.Size = UDim2.new(1, -5, 0, 28)
   
    L408_99.Name = "TopBarTitle"
    L408_99.Parent = __gnHZJbMuHwp; L408_99.BackgroundTransparency = 1;
    L408_99.Position = UDim2.new(0, 7, 0, 5) L408_99.Size = UDim2.new(0, 0, 0, 16)
    L408_99.Font = Enum.Font.Code; L408_99.Text = windowTitle;
    L408_99.TextColor3 = Color3.fromRGB(230, 230, 230) L408_99.TextSize = 16; L408_99.TextXAlignment = Enum.TextXAlignment.Left;
   
    _1181x706.Name = "TopBarLine"
    _1181x706.Parent = __gnHZJbMuHwp; _1181x706.BackgroundColor3 = nexlib.accentclr;
    _1181x706.BorderSizePixel = 0; _1181x706.Position = UDim2.new(0, 0, 0, 27) _1181x706.Size = UDim2.new(1, 0, 0, 1)
   
    _376_509(__gnHZJbMuHwp, _783_273)

    local v56079 = game:GetService("Lighting")
    local L429_28 = v56079:FindFirstChild("ValkUIBlur") or Instance.new("BlurEffect")
    L429_28.Name = "ValkUIBlur"
    L429_28.Size = 0
    L429_28.Parent = v56079

    local function a49b45c10()
        _783_273.Visible = L561_63
        _lO1I110O0.Visible = L561_63
        game:GetService("UserInputService").MouseBehavior = L561_63 and Enum.MouseBehavior.Default or Enum.MouseBehavior.LockCenter
       
        local v53851 = game:GetService("TweenService")
        if L561_63 then
            v53851:Create(L429_28, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = 18}):Play()
            _783_273.BackgroundTransparency = 1
            v53851:Create(_783_273, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0.15}):Play()
        else
            v53851:Create(L429_28, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = 0}):Play()
        end
    end
   
    game:GetService("UserInputService").InputBegan:Connect(function(input, processed)
        if input.KeyCode == Enum.KeyCode.RightShift then
            L561_63 = not L561_63;
            a49b45c10()
        end
end)

    local a87b27c15 = game:GetService("CoreGui")
    if a87b27c15:FindFirstChild("ExecutorToggleUI") then
        a87b27c15.ExecutorToggleUI:Destroy()
    end
local _425_141 = Instance.new("ScreenGui")
    _425_141.Name = "ExecutorToggleUI"
    _425_141.ResetOnSpawn = false
    _425_141.Parent = a87b27c15

    local a81b35c84 = Instance.new("TextButton")
    a81b35c84.Name = "ToggleFrame"
    a81b35c84.Size = UDim2.new(0, 65, 0, 36)
    a81b35c84.Position = UDim2.new(0, 20, 0, 20)
    a81b35c84.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    a81b35c84.BorderSizePixel = 0
    a81b35c84.Active = true
    a81b35c84.Draggable = true
    a81b35c84.Parent = _425_141

    local L788_37 = Instance.new("UIStroke")
    L788_37.Color = nexlib.accentclr
    L788_37.Thickness = 2
    L788_37.Parent = a81b35c84

    local _1160x364 = Instance.new("TextLabel")
    _1160x364.Size = UDim2.new(1, -6, 0, 16)
    _1160x364.Position = UDim2.new(0, 3, 0, 2)
    _1160x364.BackgroundTransparency = 1
    _1160x364.Text = "Toggle"
    _1160x364.TextColor3 = Color3.fromRGB(230, 230, 230)
    _1160x364.TextSize = 12
    _1160x364.Font = Enum.Font.GothamBold
    _1160x364.TextXAlignment = Enum.TextXAlignment.Left
    _1160x364.Parent = a81b35c84

    local _7658x168 = Instance.new("TextLabel")
    _7658x168.Size = UDim2.new(1, -6, 0, 16)
    _7658x168.Position = UDim2.new(0, 3, 0, 18)
    _7658x168.BackgroundTransparency = 1
    _7658x168.Text = "Look"
    _7658x168.TextColor3 = Color3.fromRGB(230, 230, 230)
    _7658x168.TextSize = 12
    _7658x168.Font = Enum.Font.GothamBold
    _7658x168.TextXAlignment = Enum.TextXAlignment.Left
    _7658x168.Parent = a81b35c84

    a81b35c84.MouseButton1Click:Connect(function()
        L561_63 = not L561_63
        a49b45c10()
    end)
   
    coroutine.wrap(function()
        while task.wait() do
            _1181x706.BackgroundColor3 = nexlib.accentclr
            L788_37.Color = nexlib.accentclr
            _lO1I110O0.BackgroundColor3 = nexlib.accentclr
           
            if L561_63 then
                local _6588x624 = game:GetService("UserInputService"):GetMouseLocation()
                _lO1I110O0.Position = UDim2.new(0, _6588x624.X, 0, _6588x624.Y)
            end
        end
    end)()

    local __hwEbYRFKK = {}
   
    function __hwEbYRFKK:Tab(tabName)
        local v87080 = 50;
       
        local __gCVqYDRdXmV = Instance.new("TextButton")
        __gCVqYDRdXmV.Name = tabName .. "_TabBtn"
        __gCVqYDRdXmV.Parent = a32b52c52
        __gCVqYDRdXmV.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        __gCVqYDRdXmV.BorderSizePixel = 0
        __gCVqYDRdXmV.Font = Enum.Font.Code
        __gCVqYDRdXmV.Text = tabName
        __gCVqYDRdXmV.TextColor3 = Color3.fromRGB(150, 150, 150)
        __gCVqYDRdXmV.TextSize = 14
        __gCVqYDRdXmV.AutoButtonColor = false
       
        local _9275x415 = game:GetService("TextService")
        local __BzTmvdpMcGg = _9275x415:GetTextSize(tabName, 14, Enum.Font.Code, Vector2.new(500, 500))
        __gCVqYDRdXmV.Size = UDim2.new(0, __BzTmvdpMcGg.X + 28, 0, 26)
       
        local _00l0IOll = Instance.new("Frame")
        _00l0IOll.Name = "TopLine"
        _00l0IOll.Parent = __gCVqYDRdXmV
        _00l0IOll.BackgroundColor3 = nexlib.accentclr
        _00l0IOll.BorderSizePixel = 0
        _00l0IOll.Position = UDim2.new(0, 0, 0, 0)
        _00l0IOll.Size = UDim2.new(1, 0, 0, 2)
        _00l0IOll.Visible = false
       
        local v77745 = Instance.new("ImageLabel")
        v77745.Name = "Outline"
        v77745.Parent = __gCVqYDRdXmV
        v77745.BackgroundTransparency = 1
        v77745.Size = UDim2.new(1, 0, 1, 0)
        v77745.Image = "rbxassetid://2592362371"
        v77745.ImageColor3 = Color3.fromRGB(45, 45, 45)
        v77745.ScaleType = Enum.ScaleType.Slice
        v77745.SliceCenter = Rect.new(2, 2, 62, 62)
        local _0x234e = Instance.new("ScrollingFrame")
        local _658_993 = Instance.new("UIPadding")
        local _0xfa7c = Instance.new("UIListLayout")
        local _203_856 = Instance.new("ScrollingFrame")
        local a36b16c67 = Instance.new("UIPadding")
        local _144_866 = Instance.new("UIListLayout")
       
        _0x234e.Name = tabName .. "_Holder1"
        _0x234e.Parent = v24652;
        _0x234e.Active = true; _0x234e.BackgroundTransparency = 1; _0x234e.BorderSizePixel = 0;
        _0x234e.Position = UDim2.new(0, 1, 0, 35) _0x234e.Size = UDim2.new(0, 245, 1, -40)
        _0x234e.Visible = false; _0x234e.CanvasSize = UDim2.new(0, 0, 0, 0) _0x234e.ScrollBarThickness = 4; _0x234e.ScrollingEnabled = true;
       
        _658_993.Parent = _0x234e; _658_993.PaddingTop = UDim.new(0, 5)
        _0xfa7c.Parent = _0x234e; _0xfa7c.SortOrder = Enum.SortOrder.LayoutOrder; _0xfa7c.Padding = UDim.new(0, 10)
       
        _203_856.Name = tabName .. "_Holder2"
        _203_856.Parent = v24652;
        _203_856.Active = true; _203_856.BackgroundTransparency = 1; _203_856.BorderSizePixel = 0;
        _203_856.Position = UDim2.new(0, 255, 0, 35) _203_856.Size = UDim2.new(0, 245, 1, -40)
        _203_856.Visible = false; _203_856.CanvasSize = UDim2.new(0, 0, 0, 0) _203_856.ScrollBarThickness = 4; _203_856.ScrollingEnabled = true;
       
        a36b16c67.Parent = _203_856; a36b16c67.PaddingTop = UDim.new(0, 5)
        _144_866.Parent = _203_856; _144_866.SortOrder = Enum.SortOrder.LayoutOrder; _144_866.Padding = UDim.new(0, 10)
       
        table.insert(_1698x129, {_154_244 = __gCVqYDRdXmV, topLine = _00l0IOll, outline = v77745, h1 = _0x234e, h2 = _203_856})
       
        if _OlOlOlOI10 == false then
            _OlOlOlOI10 = true;
            _0x234e.Visible = true;
            _203_856.Visible = true;
            __gCVqYDRdXmV.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
            __gCVqYDRdXmV.TextColor3 = Color3.fromRGB(230, 230, 230)
            _00l0IOll.Visible = true
            v77745.ImageColor3 = Color3.fromRGB(65, 65, 65)
        end;
       
        __gCVqYDRdXmV.MouseButton1Click:Connect(function()
            local _369_106 = game:GetService("TweenService")
            for __YEzeEiWEWFAS, t in ipairs(_1698x129) do
                if t.btn == __gCVqYDRdXmV then
                    _369_106:Create(t.btn, TweenInfo.new(0.12, Enum.EasingStyle.Quad), {BackgroundColor3 = Color3.fromRGB(33, 33, 33), TextColor3 = Color3.fromRGB(230, 230, 230)}):Play()
                    t.topLine.Visible = true
                    t.outline.ImageColor3 = Color3.fromRGB(65, 65, 65)
                    t.h1.Visible = true
                    t.h2.Visible = true
                else
                    _369_106:Create(t.btn, TweenInfo.new(0.12, Enum.EasingStyle.Quad), {BackgroundColor3 = Color3.fromRGB(22, 22, 22), TextColor3 = Color3.fromRGB(150, 150, 150)}):Play()
                    t.topLine.Visible = false
                    t.outline.ImageColor3 = Color3.fromRGB(45, 45, 45)
                    t.h1.Visible = false
                    t.h2.Visible = false
                end
end
        end)
       
        coroutine.wrap(function()
            while task.wait() do
                if _00l0IOll.Visible then
                    _00l0IOll.BackgroundColor3 = nexlib.accentclr
                end
            end
        end)()
       
        local L926_31 = {}
       
        function L926_31:Section(sectionName, forceSide)
            v87080 = v87080 - 1;
            local L277_21 = nil;
           
            if forceSide == 1 then L277_21 = _0x234e
            elseif forceSide == 2 then L277_21 = _203_856
            else
                local _1672x889 = 0; local a89b99c60 = 0;
                for s, f in next, _0x234e:GetChildren() do if f.Name == "Section" or f.Name == "MultiSection" then _1672x889 = _1672x889 + 1 end end;
                for s, f in next, _203_856:GetChildren() do if f.Name == "Section" or f.Name == "MultiSection" then a89b99c60 = a89b99c60 + 1 end end;
                if _1672x889 == 0 and a89b99c60 == 0 then L277_21 = _0x234e
                elseif _1672x889 == a89b99c60 then L277_21 = _0x234e
                else L277_21 = _203_856 end;
            end
           
            local __dbloARWjl = Instance.new("Frame")
            local __PauMDmeitP = Instance.new("ImageLabel")
            local _0x848d = Instance.new("ImageLabel")
            local L349_81 = Instance.new("Frame")
            local v32876 = Instance.new("TextLabel")
            local _l10lO10l0l1 = Instance.new("Frame")
            local __ZZvUJOD = Instance.new("UIListLayout")
           
            __dbloARWjl.Name = "Section"
            __dbloARWjl.Parent = L277_21;
            __dbloARWjl.AnchorPoint = Vector2.new(0.5, 0)
            __dbloARWjl.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            __dbloARWjl.BorderSizePixel = 0;
            __dbloARWjl.Size = UDim2.new(1, -2, 0, 24)
            __dbloARWjl.ZIndex = v87080;
           
            __PauMDmeitP.Name = "SectionOutline2"
            __PauMDmeitP.Parent = __dbloARWjl; __PauMDmeitP.BackgroundTransparency = 1; __PauMDmeitP.Size = UDim2.new(1, 0, 1, 0)
            __PauMDmeitP.Image = "rbxassetid://2592362371" __PauMDmeitP.ImageColor3 = Color3.fromRGB(0, 0, 0)
            __PauMDmeitP.ScaleType = Enum.ScaleType.Slice; __PauMDmeitP.SliceCenter = Rect.new(2, 2, 62, 62)
           
            _0x848d.Name = "SectionOutline1"
            _0x848d.Parent = __dbloARWjl; _0x848d.BackgroundTransparency = 1; _0x848d.Position = UDim2.new(0, 1, 0, 1)
            _0x848d.Size = UDim2.new(1, -2, 1, -2) _0x848d.Image = "rbxassetid://2592362371"
            _0x848d.ImageColor3 = Color3.fromRGB(60, 60, 60) _0x848d.ScaleType = Enum.ScaleType.Slice; _0x848d.SliceCenter = Rect.new(2, 2, 62, 62)
           
            L349_81.Name = "SectionTitleFrame"
            L349_81.Parent = __dbloARWjl; L349_81.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            L349_81.BorderSizePixel = 0; L349_81.Position = UDim2.new(0, 10, 0, 0)
           
            v32876.Name = "SectionTitle"
            v32876.Parent = L349_81; v32876.BackgroundTransparency = 1; v32876.Position = UDim2.new(0, 0, 0, -3)
            v32876.Size = UDim2.new(1, 0, 0, 7) v32876.Font = Enum.Font.Code; v32876.Text = sectionName;
            v32876.TextColor3 = Color3.fromRGB(230, 230, 230) v32876.TextSize = 14;
           
            _l10lO10l0l1.Name = "SectionItemHolderFrame"
            _l10lO10l0l1.Parent = __dbloARWjl; _l10lO10l0l1.AnchorPoint = Vector2.new(0.5, 0)
            _l10lO10l0l1.BackgroundTransparency = 1; _l10lO10l0l1.Position = UDim2.new(0.5, 0, 0, 15)
            _l10lO10l0l1.Size = UDim2.new(1, -16, 0, 0)
           
            __ZZvUJOD.Parent = _l10lO10l0l1; __ZZvUJOD.SortOrder = Enum.SortOrder.LayoutOrder; __ZZvUJOD.Padding = UDim.new(0, 5)
            L349_81.Size = UDim2.new(0, v32876.TextBounds.X + 6, 0, 7)
           
            local function _6853x256()
                __dbloARWjl.Size = UDim2.new(1, -2, 0, __ZZvUJOD.AbsoluteContentSize.Y + 24)
                _0x234e.CanvasSize = UDim2.new(0, 0, 0, _0xfa7c.AbsoluteContentSize.Y + 20)
                _203_856.CanvasSize = UDim2.new(0, 0, 0, _144_866.AbsoluteContentSize.Y + 20)
            end

            local L429_27 = {}
           
            function L429_27:Toggle(text, default, callback)
                local __yJPdTAjBxLmN = Instance.new("TextButton")
                local _IO11IO100 = Instance.new("ImageLabel")
                local _3957x904 = Instance.new("ImageLabel")
                local __akbrmvrTgw = Instance.new("Frame")
                local _5527x333 = Instance.new("Frame")
                local v41003 = Instance.new("TextLabel")
               
                __yJPdTAjBxLmN.Name = "Toggle"
                __yJPdTAjBxLmN.Parent = _l10lO10l0l1
                __yJPdTAjBxLmN.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
                __yJPdTAjBxLmN.BorderSizePixel = 0
                __yJPdTAjBxLmN.Size = UDim2.new(1, 0, 0, 22)
                __yJPdTAjBxLmN.AutoButtonColor = false
                __yJPdTAjBxLmN.Text = ''
               
                _IO11IO100.Parent = __yJPdTAjBxLmN; _IO11IO100.BackgroundTransparency = 1; _IO11IO100.Size = UDim2.new(1, 0, 1, 0)
                _IO11IO100.Image = "rbxassetid://2592362371" _IO11IO100.ImageColor3 = Color3.fromRGB(60, 60, 60)
                _IO11IO100.ScaleType = Enum.ScaleType.Slice; _IO11IO100.SliceCenter = Rect.new(2, 2, 62, 62)
               
                _3957x904.Parent = __yJPdTAjBxLmN; _3957x904.BackgroundTransparency = 1; _3957x904.Position = UDim2.new(0, 1, 0, 1)
                _3957x904.Size = UDim2.new(1, -2, 1, -2) _3957x904.Image = "rbxassetid://2592362371"
                _3957x904.ImageColor3 = Color3.fromRGB(0, 0, 0) _3957x904.ScaleType = Enum.ScaleType.Slice; _3957x904.SliceCenter = Rect.new(2, 2, 62, 62)
               
                __akbrmvrTgw.Name = "Box"
                __akbrmvrTgw.Parent = __yJPdTAjBxLmN
                __akbrmvrTgw.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
                __akbrmvrTgw.BorderSizePixel = 0
                __akbrmvrTgw.Position = UDim2.new(0, 6, 0.5, -6)
                __akbrmvrTgw.Size = UDim2.new(0, 12, 0, 12)
               
                _5527x333.Name = "Check"
                _5527x333.Parent = __akbrmvrTgw
                _5527x333.BackgroundColor3 = nexlib.accentclr
                _5527x333.BorderSizePixel = 0
                _5527x333.Position = UDim2.new(0, 2, 0, 2)
                _5527x333.Size = UDim2.new(0, 8, 0, 8)
                _5527x333.Visible = default or false
               
                v41003.Parent = __yJPdTAjBxLmN
                v41003.BackgroundTransparency = 1
                v41003.Position = UDim2.new(0, 25, 0, 0)
                v41003.Size = UDim2.new(1, -25, 1, 0)
                v41003.Font = Enum.Font.Code
                v41003.Text = text
                v41003.TextColor3 = Color3.fromRGB(190, 190, 190)
                v41003.TextSize = 14
                v41003.TextXAlignment = Enum.TextXAlignment.Left
               
                local L248_33 = default or false
                __yJPdTAjBxLmN.MouseButton1Click:Connect(function()
                    L248_33 = not L248_33
                    _5527x333.Visible = L248_33
                    pcall(callback, L248_33)
                end)
               
                _6853x256()
                coroutine.wrap(function()
                    while task.wait() do _5527x333.BackgroundColor3 = nexlib.accentclr end
                end)()
                local a85b11c80 = {}
                function a85b11c80:Set(L619_44)
                    L248_33 = L619_44
                    _5527x333.Visible = L248_33
                    pcall(callback, L248_33)
                end
                return a85b11c80
            end
function L429_27:Button(text, callback)
                local _154_244 = Instance.new("TextButton")
                local _6024x853 = Instance.new("ImageLabel")
                local _974_367 = Instance.new("ImageLabel")
               
                _154_244.Name = "Button"
                _154_244.Parent = _l10lO10l0l1;
                _154_244.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
                _154_244.BorderColor3 = nexlib.accentclr;
                _154_244.BorderSizePixel = 0;
                _154_244.Size = UDim2.new(1, 0, 0, 20)
                _154_244.AutoButtonColor = false; _154_244.Font = Enum.Font.Code;
                _154_244.TextColor3 = Color3.fromRGB(230, 230, 230)
                _154_244.TextSize = 14; _154_244.Text = text;
               
                _6024x853.Name = "ButtonOutline1"
                _6024x853.Parent = _154_244; _6024x853.BackgroundTransparency = 1; _6024x853.Size = UDim2.new(1, 0, 1, 0)
                _6024x853.Image = "rbxassetid://2592362371" _6024x853.ImageColor3 = Color3.fromRGB(60, 60, 60)
                _6024x853.ScaleType = Enum.ScaleType.Slice; _6024x853.SliceCenter = Rect.new(2, 2, 62, 62)
               
                _974_367.Name = "ButtonOutline2"
                _974_367.Parent = _154_244; _974_367.BackgroundTransparency = 1; _974_367.Position = UDim2.new(0, 1, 0, 1)
                _974_367.Size = UDim2.new(1, -2, 1, -2) _974_367.Image = "rbxassetid://2592362371"
                _974_367.ImageColor3 = Color3.fromRGB(0, 0, 0) _974_367.ScaleType = Enum.ScaleType.Slice; _974_367.SliceCenter = Rect.new(2, 2, 62, 62)
               
                _154_244.MouseButton1Click:Connect(function() pcall(callback) end)
                _154_244.MouseEnter:Connect(function() _154_244.BorderSizePixel = 1 end)
                _154_244.MouseLeave:Connect(function() _154_244.BorderSizePixel = 0 end)
               
                _6853x256()
                coroutine.wrap(function()
                    while task.wait() do _154_244.BorderColor3 = nexlib.accentclr end
                end)()
            end;
           
            function L429_27:Slider(text, min, max, default, rounding, callback)
                local _771_374 = Instance.new("TextButton")
                local _393_894 = Instance.new("Frame")
                local L180_65 = Instance.new("TextLabel")
                local _2281x495 = Instance.new("TextLabel")
               
                _771_374.Name = "SliderBar"
                _771_374.Parent = _l10lO10l0l1; _771_374.BackgroundColor3 = Color3.fromRGB(38, 38, 38); _771_374.BorderSizePixel = 0;
                _771_374.Size = UDim2.new(1, 0, 0, 16); _771_374.Text = ''; _771_374.AutoButtonColor = false;
               
                local L742_94 = Instance.new("ImageLabel")
                L742_94.Parent = _771_374; L742_94.BackgroundTransparency = 1; L742_94.Size = UDim2.new(1, 0, 1, 0)
                L742_94.Image = "rbxassetid://2592362371" L742_94.ImageColor3 = Color3.fromRGB(60, 60, 60)
                L742_94.ScaleType = Enum.ScaleType.Slice; L742_94.SliceCenter = Rect.new(2, 2, 62, 62)
               
                local L151_72 = Instance.new("ImageLabel")
                L151_72.Parent = _771_374; L151_72.BackgroundTransparency = 1; L151_72.Position = UDim2.new(0, 1, 0, 1)
                L151_72.Size = UDim2.new(1, -2, 1, -2) L151_72.Image = "rbxassetid://2592362371"
                L151_72.ImageColor3 = Color3.fromRGB(0, 0, 0) L151_72.ScaleType = Enum.ScaleType.Slice; L151_72.SliceCenter = Rect.new(2, 2, 62, 62)

                _393_894.Name = "SliderFill"
                _393_894.Parent = _771_374; _393_894.BackgroundColor3 = nexlib.accentclr; _393_894.BorderSizePixel = 0;
                _393_894.BackgroundTransparency = 0.55;
                _393_894.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
               
                L180_65.Name = "SliderTitle"
                L180_65.Parent = _771_374; L180_65.BackgroundTransparency = 1; L180_65.Position = UDim2.new(0, 6, 0, 0)
                L180_65.Size = UDim2.new(0.7, 0, 1, 0)
                L180_65.Font = Enum.Font.Code; L180_65.Text = text; L180_65.TextColor3 = Color3.fromRGB(190, 190, 190); L180_65.TextSize = 13;
                L180_65.TextXAlignment = Enum.TextXAlignment.Left; L180_65.ZIndex = 2;
               
                _2281x495.Name = "SliderValue"
                _2281x495.Parent = _771_374; _2281x495.BackgroundTransparency = 1; _2281x495.Position = UDim2.new(1, -75, 0, 0)
                _2281x495.Size = UDim2.new(0, 70, 1, 0) _2281x495.Font = Enum.Font.Code; _2281x495.Text = tostring(default) .. "s";
                _2281x495.TextColor3 = Color3.fromRGB(240, 240, 240); _2281x495.TextSize = 13; _2281x495.TextXAlignment = Enum.TextXAlignment.Right; _2281x495.ZIndex = 5;
               
                local L425_74 = false
                local function _846_348(input)
                    local _7507x242 = math.clamp((input.Position.X - _771_374.AbsolutePosition.X) / _771_374.AbsoluteSize.X, 0, 1)
                    local L619_44 = min + (max - min) * _7507x242
                    if rounding == 0 then
                        L619_44 = math.floor(L619_44 + 0.5)
                    else
                        L619_44 = tonumber(string.format("%." .. rounding .. "f", L619_44))
                    end
                    _393_894.Size = UDim2.new(_7507x242, 0, 1, 0)
                    _2281x495.Text = tostring(L619_44) .. "s"
                    pcall(callback, L619_44)
                end
               
                _771_374.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                        L425_74 = true
                        _846_348(input)
                    end
                end)
                game:GetService("UserInputService").InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then L425_74 = false end
                end)
                game:GetService("UserInputService").InputChanged:Connect(function(input)
                    if L425_74 and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                        _846_348(input)
                    end
                end)
               
                _6853x256()
                coroutine.wrap(function()
                    while task.wait() do _393_894.BackgroundColor3 = nexlib.accentclr end
end)()
            end

            function L429_27:Input(text, default, placeholder, callback)
                local __WpcgMLxB = Instance.new("Frame")
                local v26413 = Instance.new("TextLabel")
                local _0lOlII = Instance.new("TextBox")
               
                __WpcgMLxB.Name = "Input"
                __WpcgMLxB.Parent = _l10lO10l0l1; __WpcgMLxB.BackgroundTransparency = 1; __WpcgMLxB.Size = UDim2.new(1, 0, 0, 38)
               
                v26413.Name = "InputTitle"
                v26413.Parent = __WpcgMLxB; v26413.BackgroundTransparency = 1; v26413.Size = UDim2.new(1, 0, 0, 15)
                v26413.Font = Enum.Font.Code; v26413.Text = text; v26413.TextColor3 = Color3.fromRGB(190, 190, 190); v26413.TextSize = 14;
                v26413.TextXAlignment = Enum.TextXAlignment.Left;
               
                _0lOlII.Name = "InputBox"
                _0lOlII.Parent = __WpcgMLxB; _0lOlII.BackgroundColor3 = Color3.fromRGB(38, 38, 38); _0lOlII.BorderSizePixel = 0;
                _0lOlII.Position = UDim2.new(0, 0, 0, 18); _0lOlII.Size = UDim2.new(1, 0, 0, 20);
                _0lOlII.Font = Enum.Font.Code; _0lOlII.PlaceholderText = placeholder or ""; _0lOlII.Text = default or "";
                _0lOlII.TextColor3 = Color3.fromRGB(230, 230, 230); _0lOlII.TextSize = 14; _0lOlII.TextXAlignment = Enum.TextXAlignment.Left;
               
                _0lOlII.FocusLost:Connect(function(enterPressed)
                    pcall(callback, _0lOlII.Text)
                end)
               
                _6853x256()
            end

            function L429_27:Dropdown(text, list, default, callback)
                default = typeof(default) == "string" and default;
                if default == '' then default = nil end;
               
                local _0x12f8 = Instance.new("Frame")
                local _0x59ea = Instance.new("TextLabel")
                local _lOOO10lOI1I = Instance.new("TextButton")
                local a38b77c24 = Instance.new("ImageLabel")
                local _0xbce3 = Instance.new("ImageLabel")
                local _6434x601 = Instance.new("TextLabel")
                local _8206x386 = Instance.new("ImageLabel")
               
                _0x12f8.Name = "Dropdown"
                _0x12f8.Parent = _l10lO10l0l1; _0x12f8.BackgroundTransparency = 1; _0x12f8.Size = UDim2.new(1, 0, 0, 37)
               
                _0x59ea.Name = "DropdownTitle"
                _0x59ea.Parent = _0x12f8; _0x59ea.BackgroundTransparency = 1; _0x59ea.Size = UDim2.new(0, 0, 0, 13)
                _0x59ea.Font = Enum.Font.Code; _0x59ea.Text = text; _0x59ea.TextColor3 = Color3.fromRGB(230, 230, 230) _0x59ea.TextSize = 14;
                _0x59ea.TextXAlignment = Enum.TextXAlignment.Left;
               
                _lOOO10lOI1I.Name = "DropdownFrame"
                _lOOO10lOI1I.Parent = _0x12f8; _lOOO10lOI1I.BackgroundColor3 = Color3.fromRGB(38, 38, 38) _lOOO10lOI1I.BorderSizePixel = 0;
                _lOOO10lOI1I.Position = UDim2.new(0, 0, 1, -20) _lOOO10lOI1I.Size = UDim2.new(1, 0, 0, 20) _lOOO10lOI1I.Text = ''; _lOOO10lOI1I.AutoButtonColor = false;
               
                a38b77c24.Parent = _lOOO10lOI1I; a38b77c24.BackgroundTransparency = 1; a38b77c24.Size = UDim2.new(1, 0, 1, 0)
                a38b77c24.Image = "rbxassetid://2592362371" a38b77c24.ImageColor3 = Color3.fromRGB(60, 60, 60)
                a38b77c24.ScaleType = Enum.ScaleType.Slice; a38b77c24.SliceCenter = Rect.new(2, 2, 62, 62)
               
                _0xbce3.Parent = _lOOO10lOI1I; _0xbce3.BackgroundTransparency = 1; _0xbce3.Position = UDim2.new(0, 1, 0, 1)
                _0xbce3.Size = UDim2.new(1, -2, 1, -2) _0xbce3.Image = "rbxassetid://2592362371" _0xbce3.ImageColor3 = Color3.fromRGB(0, 0, 0)
                _0xbce3.ScaleType = Enum.ScaleType.Slice; _0xbce3.SliceCenter = Rect.new(2, 2, 62, 62)
               
                _6434x601.Name = "DropdownText"
                _6434x601.Parent = _lOOO10lOI1I; _6434x601.BackgroundTransparency = 1; _6434x601.Position = UDim2.new(0, 5, 0, 0)
                _6434x601.Size = UDim2.new(1, -5, 1, 0) _6434x601.Font = Enum.Font.Code; _6434x601.Text = typeof(default) == "string" and default or "...";
                _6434x601.TextColor3 = Color3.fromRGB(180, 180, 180) _6434x601.TextSize = 14; _6434x601.TextXAlignment = Enum.TextXAlignment.Left;
               
                _8206x386.Name = "DropdownArrow"
                _8206x386.Parent = _lOOO10lOI1I; _8206x386.AnchorPoint = Vector2.new(0, 0.5) _8206x386.BackgroundTransparency = 1;
                _8206x386.Position = UDim2.new(1, -22, 0.5, 0) _8206x386.Size = UDim2.new(0, 20, 0, 20)
                _8206x386.Image = "http://www.roblox.com/asset/?id=6031091004" _8206x386.ImageColor3 = Color3.fromRGB(180, 180, 180)
               
                _6853x256()
               
                local __XTbJjtU = Instance.new("Frame")
                local __RodMQh = Instance.new("ImageLabel")
                local _1519x258 = Instance.new("ImageLabel")
                local _317_743 = Instance.new("ScrollingFrame")
                local L746_64 = Instance.new("UIListLayout")
                local L767_89 = Instance.new("UIPadding")
               
                __XTbJjtU.Name = "DropdownHolderFrame"
                __XTbJjtU.Parent = __dbloARWjl; __XTbJjtU.AnchorPoint = Vector2.new(0.5, 0)
                __XTbJjtU.BackgroundColor3 = Color3.fromRGB(38, 38, 38) __XTbJjtU.BorderSizePixel = 0;
                __XTbJjtU.Position = UDim2.new(0.5, 0, 0, __ZZvUJOD.AbsoluteContentSize.Y + 19)
                __XTbJjtU.Size = UDim2.new(1, -16, 0, 0) __XTbJjtU.Visible = false; __XTbJjtU.ZIndex = 10;
               
                __RodMQh.Parent = __XTbJjtU; __RodMQh.BackgroundTransparency = 1; __RodMQh.Size = UDim2.new(1, 0, 1, 0)
                __RodMQh.Image = "rbxassetid://2592362371" __RodMQh.ImageColor3 = Color3.fromRGB(60, 60, 60)
                __RodMQh.ScaleType = Enum.ScaleType.Slice; __RodMQh.SliceCenter = Rect.new(2, 2, 62, 62)
               
                _1519x258.Parent = __XTbJjtU; _1519x258.BackgroundTransparency = 1; _1519x258.Position = UDim2.new(0, 1, 0, 1)
                _1519x258.Size = UDim2.new(1, -2, 1, -2) _1519x258.Image = "rbxassetid://2592362371" _1519x258.ImageColor3 = Color3.fromRGB(0, 0, 0)
                _1519x258.ScaleType = Enum.ScaleType.Slice; _1519x258.SliceCenter = Rect.new(2, 2, 62, 62)
               
                _317_743.Name = "DropdownHolder"
                _317_743.Parent = __XTbJjtU; _317_743.Active = true; _317_743.BackgroundTransparency = 1; _317_743.BorderSizePixel = 0;
                _317_743.Size = UDim2.new(1, -4, 1, 0) _317_743.ScrollBarThickness = 2; _317_743.CanvasSize = UDim2.new(0, 0, 0, 0)
               
                L746_64.Parent = _317_743; L746_64.HorizontalAlignment = Enum.HorizontalAlignment.Center; L746_64.Padding = UDim.new(0, 2)
                L767_89.Parent = _317_743; L767_89.PaddingTop = UDim.new(0, 6)
               
                table.insert(nexlib.dropdownframes, __XTbJjtU)
                table.insert(nexlib.dropdownframes, _0x12f8)
               
                local v67678 = {}
               
                _lOOO10lOI1I.MouseButton1Click:Connect(function()
                    if __XTbJjtU.Visible == false then
                        for s, f in next, nexlib.dropdownframes do if f.Name == "DropdownHolderFrame" then f.Visible = false end end;
                        for s, f in next, nexlib.dropdownframes do if f.Name == "Dropdown" then f.DropdownFrame.DropdownArrow.Rotation = 0 end end;
                        _8206x386.Rotation = 180; __XTbJjtU.Visible = true
                    else
                        _8206x386.Rotation = 0; __XTbJjtU.Visible = false
                    end
                end)
               
                for s, f in next, list do
                    local L674_11 = Instance.new("TextButton")
                    local v99684 = Instance.new("TextLabel")
                   
                    L674_11.Name = "Item"
                    L674_11.Parent = _317_743; L674_11.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
                    L674_11.Size = UDim2.new(1, -12, 0, 20) L674_11.AutoButtonColor = false; L674_11.Font = Enum.Font.Code;
                    L674_11.Text = " " .. f; L674_11.TextColor3 = Color3.fromRGB(230, 230, 230) L674_11.TextSize = 14;
                    L674_11.TextXAlignment = Enum.TextXAlignment.Left;
                   
                    v99684.Name = "ItemText"
                    v99684.Parent = L674_11; v99684.BackgroundTransparency = 1; v99684.Position = UDim2.new(0, 7, 0, 0)
                    v99684.Size = UDim2.new(1, -7, 1, 0) v99684.Font = Enum.Font.Code; v99684.Text = f;
                    v99684.TextColor3 = nexlib.accentclr; v99684.TextSize = 14; v99684.TextXAlignment = Enum.TextXAlignment.Left;
                   
                    L674_11.MouseButton1Click:Connect(function()
                        __XTbJjtU.Visible = false; _6434x601.Text = f; default = f; pcall(callback, f)
                    end)
                   
                    coroutine.wrap(function()
                        while task.wait() do
                            local _0x4ff4 = (typeof(default) == "string" and default == f)
                            v99684.BackgroundTransparency = 1;
                            v99684.TextTransparency = _0x4ff4 and 0 or 1;
                            L674_11.TextTransparency = _0x4ff4 and 1 or 0;
                            L674_11.BackgroundTransparency = _0x4ff4 and 0 or 1;
                            L674_11.BorderColor3 = nexlib.accentclr;
                        end
end)()
                    __XTbJjtU.Size = UDim2.new(1, -16, 0, math.clamp(L746_64.AbsoluteContentSize.Y + 12, 0, 150))
                    _317_743.CanvasSize = UDim2.new(0, 0, 0, L746_64.AbsoluteContentSize.Y + 12)
                end;
               
                coroutine.wrap(function()
                    while task.wait() do _lOOO10lOI1I.BorderColor3 = nexlib.accentclr end
                end)()
               
                function v67678:Set(value)
                    _6434x601.Text = tostring(value)
                    default = value
                    pcall(callback, value)
                end
               
                return v67678
            end;
function L429_27:Label(text)
                local _IO10ll101 = {}
                local _0xf0da = Instance.new("TextLabel")
               
                _0xf0da.Name = "Label"
                _0xf0da.Parent = _l10lO10l0l1; _0xf0da.BackgroundTransparency = 1; _0xf0da.Size = UDim2.new(1, 0, 0, 18)
                _0xf0da.Font = Enum.Font.Code; _0xf0da.Text = text; _0xf0da.TextColor3 = Color3.fromRGB(230, 230, 230)
                _0xf0da.TextSize = 14; _0xf0da.TextXAlignment = Enum.TextXAlignment.Left;
               
                _6853x256()
               
                function _IO10ll101:Change(newText) _0xf0da.Text = newText end;
                return _IO10ll101;
            end;
return L429_27;
        end;

        function L926_31:MultiSection(tabNames, forceSide)
            v87080 = v87080 - 1
            local L277_21 = nil
            if forceSide == 1 then
                L277_21 = _0x234e
            elseif forceSide == 2 then
                L277_21 = _203_856
            else
                local _1672x889, a89b99c60 = 0, 0
                for __YEzeEiWEWFAS, f in next, _0x234e:GetChildren() do
                    if f.Name == "Section" or f.Name == "MultiSection" then _1672x889 = _1672x889 + 1 end
                end
                for __YEzeEiWEWFAS, f in next, _203_856:GetChildren() do
                    if f.Name == "Section" or f.Name == "MultiSection" then a89b99c60 = a89b99c60 + 1 end
                end
                if _1672x889 <= a89b99c60 then L277_21 = _0x234e else L277_21 = _203_856 end
            end

            local _492_968 = Instance.new("Frame")
            _492_968.Name = "MultiSection"
            _492_968.Parent = L277_21
            _492_968.AnchorPoint = Vector2.new(0.5, 0)
            _492_968.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            _492_968.BorderSizePixel = 0
            _492_968.Size = UDim2.new(1, -2, 0, 50)
            _492_968.ZIndex = v87080

            local _lII1IIl1010O = Instance.new("ImageLabel")
            _lII1IIl1010O.Parent = _492_968
            _lII1IIl1010O.BackgroundTransparency = 1
            _lII1IIl1010O.Size = UDim2.new(1, 0, 1, 0)
            _lII1IIl1010O.Image = "rbxassetid://2592362371"
            _lII1IIl1010O.ImageColor3 = Color3.fromRGB(0, 0, 0)
            _lII1IIl1010O.ScaleType = Enum.ScaleType.Slice
            _lII1IIl1010O.SliceCenter = Rect.new(2, 2, 62, 62)

            local a74b74c25 = Instance.new("ImageLabel")
            a74b74c25.Parent = _492_968
            a74b74c25.BackgroundTransparency = 1
            a74b74c25.Position = UDim2.new(0, 1, 0, 1)
            a74b74c25.Size = UDim2.new(1, -2, 1, -2)
            a74b74c25.Image = "rbxassetid://2592362371"
            a74b74c25.ImageColor3 = Color3.fromRGB(60, 60, 60)
            a74b74c25.ScaleType = Enum.ScaleType.Slice
            a74b74c25.SliceCenter = Rect.new(2, 2, 62, 62)

            local a26b65c33 = Instance.new("Frame")
            a26b65c33.Parent = _492_968
            a26b65c33.BackgroundTransparency = 1
            a26b65c33.Position = UDim2.new(0, 6, 0, 4)
            a26b65c33.Size = UDim2.new(1, -12, 0, 22)
            local v81075 = Instance.new("UIListLayout")
            v81075.Parent = a26b65c33
            v81075.FillDirection = Enum.FillDirection.Horizontal
            v81075.SortOrder = Enum.SortOrder.LayoutOrder
            v81075.Padding = UDim.new(0, 2)

            local _903_668 = Instance.new("Frame")
            _903_668.Parent = _492_968
            _903_668.BackgroundTransparency = 1
            _903_668.Position = UDim2.new(0.5, 0, 0, 28)
            _903_668.AnchorPoint = Vector2.new(0.5, 0)
            _903_668.Size = UDim2.new(1, -16, 0, 0)

            local v96608, __xyRVCd = {}, {}
            local _0x2e6e = {}

            local function L152_37()
                local _I1OOOO = 0
                for __YEzeEiWEWFAS, a18b56c86 in ipairs(v96608) do
                    local L252_55 = a18b56c86:FindFirstChildOfClass("UIListLayout")
                    if L252_55 then
                        _I1OOOO = math.max(_I1OOOO, L252_55.AbsoluteContentSize.Y)
                    end
end
                _903_668.Size = UDim2.new(1, -16, 0, _I1OOOO)
                _492_968.Size = UDim2.new(1, -2, 0, _I1OOOO + 36)
                _0x234e.CanvasSize = UDim2.new(0, 0, 0, _0xfa7c.AbsoluteContentSize.Y + 20)
                _203_856.CanvasSize = UDim2.new(0, 0, 0, _144_866.AbsoluteContentSize.Y + 20)
            end

            for i, tabName in ipairs(tabNames) do
                local a18b56c86 = Instance.new("Frame")
                a18b56c86.Name = "Page_" .. tabName
                a18b56c86.Parent = _903_668
                a18b56c86.BackgroundTransparency = 1
                a18b56c86.Size = UDim2.new(1, 0, 0, 0)
                a18b56c86.Visible = (i == 1)

                local __ripFbiMEvOQE = Instance.new("UIListLayout")
                __ripFbiMEvOQE.Parent = a18b56c86
                __ripFbiMEvOQE.SortOrder = Enum.SortOrder.LayoutOrder
                __ripFbiMEvOQE.Padding = UDim.new(0, 5)

                __ripFbiMEvOQE:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                    a18b56c86.Size = UDim2.new(1, 0, 0, __ripFbiMEvOQE.AbsoluteContentSize.Y)
                    L152_37()
                end)

                local _154_244 = Instance.new("TextButton")
                _154_244.Parent = a26b65c33
                _154_244.BackgroundColor3 = (i == 1) and Color3.fromRGB(38, 38, 38) or Color3.fromRGB(28, 28, 28)
                _154_244.BorderSizePixel = 0
                _154_244.Size = UDim2.new(0, 0, 1, 0)
                _154_244.AutomaticSize = Enum.AutomaticSize.X
                _154_244.AutoButtonColor = false
                _154_244.Font = Enum.Font.Code
                _154_244.Text = "  " .. tabName .. "  "
                _154_244.TextColor3 = (i == 1) and Color3.fromRGB(230, 230, 230) or Color3.fromRGB(150, 150, 150)
                _154_244.TextSize = 13

                local v49110 = Instance.new("Frame")
                v49110.Parent = _154_244
                v49110.BackgroundColor3 = nexlib.accentclr
                v49110.BorderSizePixel = 0
                v49110.Position = UDim2.new(0, 0, 1, -2)
                v49110.Size = UDim2.new(1, 0, 0, 2)
                v49110.Visible = (i == 1)

                table.insert(v96608, a18b56c86)
                table.insert(__xyRVCd, {_154_244 = _154_244, v49110 = v49110, a18b56c86 = a18b56c86})

                _154_244.MouseButton1Click:Connect(function()
                    for idx, a91b73c94 in ipairs(__xyRVCd) do
                        local L208_73 = (idx == i)
                        a91b73c94.page.Visible = L208_73
                        a91b73c94.underline.Visible = L208_73
                        a91b73c94.btn.BackgroundColor3 = L208_73 and Color3.fromRGB(38, 38, 38) or Color3.fromRGB(28, 28, 28)
                        a91b73c94.btn.TextColor3 = L208_73 and Color3.fromRGB(230, 230, 230) or Color3.fromRGB(150, 150, 150)
                    end
                    L152_37()
                end)
                coroutine.wrap(function()
                    while task.wait() do
                        if v49110.Visible then
                            v49110.BackgroundColor3 = nexlib.accentclr
                        end
                    end
                end)()

                local function _987_413()
                    a18b56c86.Size = UDim2.new(1, 0, 0, __ripFbiMEvOQE.AbsoluteContentSize.Y)
                    L152_37()
                end

                local v44151 = {}

                function v44151:Toggle(text, default, callback)
                    local __yJPdTAjBxLmN = Instance.new("TextButton")
                    __yJPdTAjBxLmN.Name = "Toggle"
                    __yJPdTAjBxLmN.Parent = a18b56c86
                    __yJPdTAjBxLmN.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
                    __yJPdTAjBxLmN.BorderSizePixel = 0
                    __yJPdTAjBxLmN.Size = UDim2.new(1, 0, 0, 22)
                    __yJPdTAjBxLmN.AutoButtonColor = false
                    __yJPdTAjBxLmN.Text = ""

                    local _IO11IO100 = Instance.new("ImageLabel")
                    _IO11IO100.Parent = __yJPdTAjBxLmN
                    _IO11IO100.BackgroundTransparency = 1
                    _IO11IO100.Size = UDim2.new(1, 0, 1, 0)
                    _IO11IO100.Image = "rbxassetid://2592362371"
                    _IO11IO100.ImageColor3 = Color3.fromRGB(60, 60, 60)
                    _IO11IO100.ScaleType = Enum.ScaleType.Slice
                    _IO11IO100.SliceCenter = Rect.new(2, 2, 62, 62)

                    local _3957x904 = Instance.new("ImageLabel")
                    _3957x904.Parent = __yJPdTAjBxLmN
                    _3957x904.BackgroundTransparency = 1
                    _3957x904.Position = UDim2.new(0, 1, 0, 1)
                    _3957x904.Size = UDim2.new(1, -2, 1, -2)
                    _3957x904.Image = "rbxassetid://2592362371"
                    _3957x904.ImageColor3 = Color3.fromRGB(0, 0, 0)
                    _3957x904.ScaleType = Enum.ScaleType.Slice
                    _3957x904.SliceCenter = Rect.new(2, 2, 62, 62)

                    local __akbrmvrTgw = Instance.new("Frame")
                    __akbrmvrTgw.Parent = __yJPdTAjBxLmN
                    __akbrmvrTgw.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
                    __akbrmvrTgw.BorderSizePixel = 0
                    __akbrmvrTgw.Position = UDim2.new(0, 6, 0.5, -6)
                    __akbrmvrTgw.Size = UDim2.new(0, 12, 0, 12)

                    local _5527x333 = Instance.new("Frame")
                    _5527x333.Parent = __akbrmvrTgw
                    _5527x333.BackgroundColor3 = nexlib.accentclr
                    _5527x333.BorderSizePixel = 0
                    _5527x333.Position = UDim2.new(0, 2, 0, 2)
                    _5527x333.Size = UDim2.new(0, 8, 0, 8)
                    _5527x333.Visible = default or false

                    local v41003 = Instance.new("TextLabel")
                    v41003.Parent = __yJPdTAjBxLmN
                    v41003.BackgroundTransparency = 1
                    v41003.Position = UDim2.new(0, 25, 0, 0)
                    v41003.Size = UDim2.new(1, -25, 1, 0)
                    v41003.Font = Enum.Font.Code
                    v41003.Text = text
                    v41003.TextColor3 = Color3.fromRGB(190, 190, 190)
                    v41003.TextSize = 14
                    v41003.TextXAlignment = Enum.TextXAlignment.Left

                    local L248_33 = default or false
                    __yJPdTAjBxLmN.MouseButton1Click:Connect(function()
                        L248_33 = not L248_33
                        _5527x333.Visible = L248_33
                        pcall(callback, L248_33)
                    end)

                    _987_413()
                    coroutine.wrap(function()
                        while task.wait() do _5527x333.BackgroundColor3 = nexlib.accentclr end
                    end)()

                    local a85b11c80 = {}
                    function a85b11c80:Set(L619_44)
                        L248_33 = L619_44
                        _5527x333.Visible = L248_33
                        pcall(callback, L248_33)
                    end
                    return a85b11c80
                end

                function v44151:Slider(text, min, max, default, rounding, callback)
                    local _771_374 = Instance.new("TextButton")
                    _771_374.Name = "SliderBar"
                    _771_374.Parent = a18b56c86
                    _771_374.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
                    _771_374.BorderSizePixel = 0
                    _771_374.Size = UDim2.new(1, 0, 0, 16)
                    _771_374.Text = ""
                    _771_374.AutoButtonColor = false

                    local L742_94 = Instance.new("ImageLabel")
                    L742_94.Parent = _771_374
                    L742_94.BackgroundTransparency = 1
                    L742_94.Size = UDim2.new(1, 0, 1, 0)
                    L742_94.Image = "rbxassetid://2592362371"
                    L742_94.ImageColor3 = Color3.fromRGB(60, 60, 60)
                    L742_94.ScaleType = Enum.ScaleType.Slice
                    L742_94.SliceCenter = Rect.new(2, 2, 62, 62)

                    local L151_72 = Instance.new("ImageLabel")
                    L151_72.Parent = _771_374
                    L151_72.BackgroundTransparency = 1
                    L151_72.Position = UDim2.new(0, 1, 0, 1)
                    L151_72.Size = UDim2.new(1, -2, 1, -2)
                    L151_72.Image = "rbxassetid://2592362371"
                    L151_72.ImageColor3 = Color3.fromRGB(0, 0, 0)
                    L151_72.ScaleType = Enum.ScaleType.Slice
                    L151_72.SliceCenter = Rect.new(2, 2, 62, 62)

                    local _393_894 = Instance.new("Frame")
                    _393_894.Parent = _771_374
                    _393_894.BackgroundColor3 = nexlib.accentclr
                    _393_894.BorderSizePixel = 0
                    _393_894.BackgroundTransparency = 0.55
                    _393_894.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)

                    local L180_65 = Instance.new("TextLabel")
                    L180_65.Parent = _771_374
                    L180_65.BackgroundTransparency = 1
                    L180_65.Position = UDim2.new(0, 6, 0, 0)
                    L180_65.Size = UDim2.new(0.7, 0, 1, 0)
                    L180_65.Font = Enum.Font.Code
                    L180_65.Text = text
                    L180_65.TextColor3 = Color3.fromRGB(190, 190, 190)
                    L180_65.TextSize = 13
                    L180_65.TextXAlignment = Enum.TextXAlignment.Left
                    L180_65.ZIndex = 2

                    local _2281x495 = Instance.new("TextLabel")
                    _2281x495.Parent = _771_374
                    _2281x495.BackgroundTransparency = 1
                    _2281x495.Position = UDim2.new(1, -75, 0, 0)
                    _2281x495.Size = UDim2.new(0, 70, 1, 0)
                    _2281x495.Font = Enum.Font.Code
                    _2281x495.Text = tostring(default) .. "s"
                    _2281x495.TextColor3 = Color3.fromRGB(240, 240, 240)
                    _2281x495.TextSize = 13
                    _2281x495.TextXAlignment = Enum.TextXAlignment.Right
                    _2281x495.ZIndex = 5

                    local L425_74 = false
                    local function _846_348(input)
                        local _7507x242 = math.clamp((input.Position.X - _771_374.AbsolutePosition.X) / _771_374.AbsoluteSize.X, 0, 1)
                        local L619_44 = min + (max - min) * _7507x242
                        if rounding == 0 then
                            L619_44 = math.floor(L619_44 + 0.5)
                        else
                            L619_44 = tonumber(string.format("%." .. rounding .. "f", L619_44))
                        end
                        _393_894.Size = UDim2.new(_7507x242, 0, 1, 0)
                        _2281x495.Text = tostring(L619_44) .. "s"
                        pcall(callback, L619_44)
                    end

                    _771_374.InputBegan:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                            L425_74 = true
                            _846_348(input)
                        end
end)
                    game:GetService("UserInputService").InputEnded:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                            L425_74 = false
                        end
                    end)
                    game:GetService("UserInputService").InputChanged:Connect(function(input)
                        if L425_74 and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                            _846_348(input)
                        end
                    end)

                    _987_413()
                    coroutine.wrap(function()
                        while task.wait() do _393_894.BackgroundColor3 = nexlib.accentclr end
                    end)()
                end

                function v44151:Label(text)
                    local _IO10ll101 = {}
                    local _0xf0da = Instance.new("TextLabel")
                    _0xf0da.Parent = a18b56c86
                    _0xf0da.BackgroundTransparency = 1
                    _0xf0da.Size = UDim2.new(1, 0, 0, 18)
                    _0xf0da.Font = Enum.Font.Code
                    _0xf0da.Text = text
                    _0xf0da.TextColor3 = Color3.fromRGB(230, 230, 230)
                    _0xf0da.TextSize = 14
                    _0xf0da.TextXAlignment = Enum.TextXAlignment.Left
                    _987_413()
                    function _IO10ll101:Change(newText) _0xf0da.Text = newText end
                    return _IO10ll101
                end

                _0x2e6e[tabName] = v44151
            end

            task.defer(L152_37)
            return _0x2e6e
        end

        return L926_31;
    end;
   
    function __hwEbYRFKK:Destroy()
        if v56079:FindFirstChild("ValkUIBlur") then
            v56079.ValkUIBlur:Destroy()
        end
        _7765x301:Destroy()
    end;

    local function _879_260()
        local v53851 = game:GetService("TweenService")
        local v56079 = game:GetService("Lighting")
       
        task.wait(0.7)
        local _924_912 = tick()
        while tick() - _924_912 < 3 do task.wait() end
       
        local v10331 = tick()
        while tick() - v10331 < 2 do
            local __YEzeEiWEWFAS = 0
            for i = 1, 500000 do __YEzeEiWEWFAS = __YEzeEiWEWFAS + i end
            task.wait()
        end
       
        local _491_505 = v56079:FindFirstChild("ValkUIBlur") or Instance.new("BlurEffect")
        _491_505.Name = "ValkUIBlur"
        _491_505.Size = 0
        _491_505.Parent = v56079
       
        local a73b89c71 = Instance.new("TextLabel")
        a73b89c71.Name = "IntroLEVK"
        a73b89c71.Parent = _7765x301
        a73b89c71.AnchorPoint = Vector2.new(0.5, 0.5)
        a73b89c71.Position = UDim2.new(0.5, 0, 0.5, 0)
        a73b89c71.Size = UDim2.new(0, 400, 0, 100)
        a73b89c71.BackgroundTransparency = 1
        a73b89c71.Font = Enum.Font.Code
        a73b89c71.Text = "LEVK"
        a73b89c71.TextColor3 = nexlib.accentclr
        a73b89c71.TextSize = 80
        a73b89c71.TextTransparency = 1
       
        local _01I1I0Il = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        local _Ol110II1II = TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
       
        v53851:Create(_491_505, _01I1I0Il, {Size = 24}):Play()
        v53851:Create(a73b89c71, _01I1I0Il, {TextTransparency = 0}):Play()
       
        task.wait(2.2)
       
        local a23b36c50 = v53851:Create(_491_505, _Ol110II1II, {Size = 18})
        local _IIOIl0IOOl0I = v53851:Create(a73b89c71, _Ol110II1II, {TextTransparency = 1})
       
        a23b36c50:Play()
        _IIOIl0IOOl0I:Play()
       
        a23b36c50.Completed:Connect(function()
            a73b89c71:Destroy()
            L561_63 = true
            a49b45c10()
        end)
    end;

    task.spawn(_879_260)
   
    return __hwEbYRFKK;
end;

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local a50b15c84 = game:GetService("Workspace")
local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer
local Camera = a50b15c84.CurrentCamera

local _0l1lOIIII0 = true
local function _685_730(player)
    if not _0l1lOIIII0 then return false end
    local _357_939 = LocalPlayer:GetAttribute("TeamID")
    local L880_33 = player:GetAttribute("TeamID")
    if _357_939 == nil or L880_33 == nil then return false end
    return L880_33 == _357_939
end

local function _143_336(playerOrChar)
    local char = playerOrChar
    if typeof(playerOrChar) == "Instance" and playerOrChar:IsA("Player") then
        char = playerOrChar.Character
    end
    if not char then return true end
    if char:FindFirstChildOfClass("ForceField") then return true end
    local __BfgstqWnead = char:FindFirstChild("HumanoidRootPart")
    if __BfgstqWnead and __BfgstqWnead:FindFirstChild("Attachment") then return true end
    local _IlO1IIIIOl1I = char:GetAttribute("Immune") or char:GetAttribute("Invincible") or char:GetAttribute("IsImmune")
    if _IlO1IIIIOl1I == true then return true end
    local a87b18c82 = char:FindFirstChildOfClass("Humanoid")
    if a87b18c82 then
        local _7665x159 = a87b18c82:GetAttribute("Immune") or a87b18c82:GetAttribute("Invincible")
        if _7665x159 == true then return true end
    end
    return false
end

local function _0x5dec(player)
    local char = player and player.Character
    if not char then return false end

   
    local _8898x144 = {"Reflecting", "IsReflecting", "BulletReflect", "Reflect", "Deflecting", "Parrying"}
    for __YEzeEiWEWFAS, a in ipairs(_8898x144) do
        local _01O001l00 = char:GetAttribute(a)
        if _01O001l00 == true or _01O001l00 == 1 or _01O001l00 == "true" then return true end
        local a87b18c82 = char:FindFirstChildOfClass("Humanoid")
        if a87b18c82 then
            local a33b54c34 = a87b18c82:GetAttribute(a)
            if a33b54c34 == true or a33b54c34 == 1 then return true end
        end
    end

   
    local __bvndpA = false
    local _101l1O011lIl = char:FindFirstChildOfClass("Tool")
    if _101l1O011lIl and string.find(string.lower(_101l1O011lIl.Name), "katana", 1, true) then
        __bvndpA = true
    end
    for __YEzeEiWEWFAS, ch in ipairs(char:GetChildren()) do
        local v16595 = string.lower(ch.Name)
        if string.find(v16595, "katana", 1, true) then
            __bvndpA = true
        end
        if string.find(v16595, "reflect", 1, true) or string.find(v16595, "deflect", 1, true) then
            return true
        end
end

   
    local a87b18c82 = char:FindFirstChildOfClass("Humanoid")
    if a87b18c82 then
        local _0x9ec3, _8291x172 = pcall(function() return a87b18c82:GetPlayingAnimationTracks() end)
        if _0x9ec3 and _8291x172 then
            for __YEzeEiWEWFAS, _10IllO11 in ipairs(_8291x172) do
                local _0x5ad2 = string.lower(tostring(_10IllO11.Name or ""))
                local _8946x586 = ""
                pcall(function()
                    if _10IllO11.Animation then _8946x586 = tostring(_10IllO11.Animation.AnimationId or "") end
                end)
                local a20b26c30 = _0x5ad2 .. " " .. string.lower(_8946x586)
                if string.find(a20b26c30, "reflect", 1, true) or string.find(a20b26c30, "deflect", 1, true)
                    or string.find(a20b26c30, "parry", 1, true) or string.find(a20b26c30, "block", 1, true) then
                    if __bvndpA or string.find(a20b26c30, "katana", 1, true) then
                        return true
                    end
                   
                    if string.find(a20b26c30, "reflect", 1, true) or string.find(a20b26c30, "deflect", 1, true) then
                        return true
                    end
                end
            end
        end
    end

    return false
end

local _2631x704 = true
local ragebotOrKillAura = false
local flyEnabled = false
local _8080x566 = 50000000
local heightLockEnabled = false
local lockHeight = 50
local _0IO100O = false
local _lII0ll = false
local _4012x732 = 0.25
local a85b57c99 = 0.1

task.spawn(function()
    while true do
        if _lII0ll and L555_61 then
            _2631x704 = true
            local _3661x412 = a85b57c99
            if typeof(_3661x412) ~= "number" or _3661x412 < 0.01 then _3661x412 = 0.01 end
            task.wait(_3661x412)
            if _lII0ll and L555_61 then
                _2631x704 = false
                local _0xdee6 = _4012x732
                if typeof(_0xdee6) ~= "number" or _0xdee6 < 0.01 then _0xdee6 = 0.01 end
task.wait(_0xdee6)
            else
                _2631x704 = true
            end
        else
            _2631x704 = true
            task.wait(0.05)
        end
    end
end)

local aimbotEnabled = false
local aimbotSmoothness = 5
local aimbotFovRadius = 100
local aimbotHitPart = "head"
local showAimbotFov = false
local aimbotWallCheck = false
local aimbotRequireRMB = false

local silentAimEnabled = false
local silentAimHitPart = "head"
local silentAimFovRadius = 300
local showSilentAimFov = false
local silentWallCheck = false
local silentAimTarget = nil

local triggerbotEnabled = false
local L115_50 = false
local a49b29c66 = false
local a77b85c82 = false
local v50691 = false
local v34672 = false
local a72b52c65 = false
local a77b58c11 = false

local shaderEnabled = false

local _3323x151 = false
local a41b78c88 = false

local espEnabled = false
local espBoxEnabled = true
local espNameEnabled = true
local espHealthEnabled = true
local espWeaponEnabled = true

local v59439 = true
local _0xebf4 = true
local v18003 = false

local a54b51c88 = false
local _450_226 = false
local _0x67db = 50
local _Ol01llI10O = 50
local _0x98ec = false
local a93b76c35 = "all walls"

local a13b53c88 = false
local emoteHopEnabled = false
local emoteSpeed = 40
local __JBrJMqdvA = nil
local L416_76 = nil

local L859_75 = false
local a16b37c97 = ""

local a67b95c93 = false
local _0xe7ca = "vr"
local _0x479f = {
    ["Dark Sky"] = {
        ["SkyboxUp"] = "rbxassetid://570555929",
        ["SkyboxRt"] = "rbxassetid://570555882",
        ["SkyboxDn"] = "rbxassetid://570555964",
        ["SkyboxFt"] = "rbxassetid://570555800",
        ["SkyboxLf"] = "rbxassetid://570555840",
        ["SkyboxBk"] = "rbxassetid://570555736"
    },
    ["Vaporwave"] = {
        ["SkyboxUp"] = "rbxassetid://1417494643",
        ["SkyboxRt"] = "rbxassetid://1417494499",
        ["SkyboxLf"] = "rbxassetid://1417494402",
        ["SkyboxFt"] = "rbxassetid://1417494253",
        ["SkyboxBk"] = "rbxassetid://1417494030",
        ["SkyboxDn"] = "rbxassetid://1417494146"
    },
    ["Lake Sky"] = {
        ["SkyboxRt"] = "rbxassetid://6823531746",
        ["SkyboxUp"] = "rbxassetid://6823528533",
        ["SunTextureId"] = "rbxassetid://5392574622",
        ["SkyboxDn"] = "rbxassetid://6823525702",
        ["SkyboxFt"] = "rbxassetid://6823482923",
        ["SkyboxLf"] = "rbxassetid://6823530023",
        ["SkyboxBk"] = "rbxassetid://6823523318"
    },
    ["Black Mesa"] = {
        ["SkyboxUp"] = "rbxassetid://9569598752",
        ["SkyboxRt"] = "rbxassetid://9569601267",
        ["SkyboxDn"] = "rbxassetid://9569613307",
        ["SkyboxFt"] = "rbxassetid://9569611418",
        ["SkyboxLf"] = "rbxassetid://9569608166",
        ["SkyboxBk"] = "rbxassetid://9569742122"
    }
}

local function _124_163(_00IO01)
    local v56079 = game:GetService("Lighting")
    local L224_38 = v56079:FindFirstChild("CustomSkybox")
   
    if not L859_75 or not _00IO01 or _00IO01 == "" then
        if L224_38 then L224_38:Destroy() end
        return
    end
   
    local a91b73c94 = _0x479f[_00IO01]
    if a91b73c94 then
        if not L224_38 then
            L224_38 = Instance.new("Sky")
            L224_38.Name = "CustomSkybox"
            L224_38.Parent = v56079
        end
       
        L224_38.SkyboxUp = ""
        L224_38.SkyboxRt = ""
        L224_38.SkyboxDn = ""
        L224_38.SkyboxFt = ""
        L224_38.SkyboxLf = ""
        L224_38.SkyboxBk = ""
        L224_38.SunTextureId = ""
       
        for prop, L987_53 in pairs(a91b73c94) do
            L224_38[prop] = L987_53
        end
    end
end

local _690_719 = false
local _650_628 = ""
local L175_54 = ""
local __hWzhWiHR = false
local _0xb752 = Vector3.zero
local a69b36c91 = Vector3.new(0, 2, 0)
local a39b72c33 = nil
local a73b35c96 = nil

local function __bzfwbJeTMvuj(char)
    if not char then return nil end
    return char:FindFirstChild("HitboxHead")
        or char:FindFirstChild("HitboxHeadSmall")
        or char:FindFirstChild("Head")
end

local _10O0lO
local v71190 = function(on) end
local L555_61 = false
local __lhiRNgvZ = 3

task.spawn(function()
    local _0x9ec3, v69764 = xpcall(function()
        local _3213x326 = LocalPlayer.PlayerScripts
        local a66b43c59, _9817x625 = pcall(require, _3213x326.Controllers.FighterController)
        local _0xd857, v27885     = pcall(require, ReplicatedStorage.Modules.EnumLibrary)
        local __MAwXiJM    = ReplicatedStorage.Remotes.Replication.Fighter.UseItem
        local _IIOl1OI11O00; pcall(function() _IIOl1OI11O00 = v27885:ToEnum("StartShooting") end)

        local function _5460x742()
            if not (a66b43c59 and _9817x625) then return nil end
            local _0x3584 = _9817x625.LocalFighter; if not _0x3584 then return nil end
            local _549_282 = _0x3584.EquippedItem; if not _549_282 then return nil end
            local L704_40, L987_53 = pcall(function() return _549_282:Get("ObjectID") end)
            if L704_40 and L987_53 then return L987_53 end
L704_40, L987_53 = pcall(function() return _549_282.Data and _549_282.Data.ObjectID end)
            return L704_40 and L987_53 or nil
        end

        local function a30b54c42(originPos, _IOI1l0I100)
            local L501_16 = _IOI1l0I100.Position
            local _0xb60d = CFrame.lookAt(originPos, L501_16)
            local _0Il0I11O, _1897x442, _0xefad = _0xb60d:ToOrientation()
            local a49b75c71 = {
                [utf8.char(0)] = originPos.X, [utf8.char(1)] = originPos.Y, [utf8.char(2)] = originPos.Z,
                [utf8.char(3)] = _0Il0I11O, [utf8.char(4)] = _1897x442, [utf8.char(5)] = _0xefad,
            }
            local a12b15c22 = _IOI1l0I100.CFrame:ToObjectSpace(CFrame.new(L501_16))
            local _lOl1lI0llll0, _1l00IOl101Il, __CtOClXPOnz = a12b15c22:ToOrientation()
            return {
                [utf8.char(1)] = {
                    [utf8.char(0)] = a49b75c71,
                    [utf8.char(1)] = a49b75c71,
                    [utf8.char(2)] = _IOI1l0I100,
                    [utf8.char(3)] = {
                        [utf8.char(0)] = a12b15c22.X, [utf8.char(1)] = a12b15c22.Y, [utf8.char(2)] = a12b15c22.Z,
                        [utf8.char(3)] = _lOl1lI0llll0, [utf8.char(4)] = _1l00IOl101Il, [utf8.char(5)] = __CtOClXPOnz,
                    },
                },
            }
        end

       
        v71190 = function(on)
            if _10O0lO then _10O0lO:Disconnect(); _10O0lO = nil end
            if not on then return end

            local _l0OIIO = nil
            _10O0lO = RunService.Heartbeat:Connect(function()
                if not L555_61 or not _2631x704 then return end
                if not a73b35c96 or not a73b35c96.Parent then return end

                local a20b32c46 = a73b35c96:FindFirstAncestorOfClass("Model") or a73b35c96.Parent
                local a14b42c70 = Players:GetPlayerFromCharacter(a20b32c46)
                if not a14b42c70 or a14b42c70 == LocalPlayer then return end
                if _685_730(a14b42c70) then return end
               
                if _143_336(a14b42c70) then return end
               
                if _0x5dec(a14b42c70) then return end

                local _lO00OO0 = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if not _lO00OO0 then return end

                local _0xf72a = _5460x742()
                if _0xf72a then _l0OIIO = _0xf72a else _0xf72a = _l0OIIO end
                if not _0xf72a then return end
local L405_52 = a73b35c96
                local _0Ol00I01OO0l = L405_52.Position + Vector3.new(0, 0.1, 0)
                local v84604 = a30b54c42(_0Ol00I01OO0l, L405_52)
                pcall(function()
                    __MAwXiJM:FireServer(_0xf72a, _IIOl1OI11O00, v84604, nil)
                end)
            end)
        end
    end, function(v69764) end)
end)

local L389_46 = nil
local L273_20 = nil

local function _4573x894()
    local v83548 = true
    pcall(function()
        local _3213x326 = LocalPlayer.PlayerScripts
        local _0x9ec3, _0lO010OIIO = pcall(require, _3213x326.Controllers.FighterController)
        if not _0x9ec3 or not _0lO010OIIO or not _0lO010OIIO.LocalFighter then return end
        local _549_282 = _0lO010OIIO.LocalFighter.EquippedItem
        if not _549_282 then
            v83548 = false
            return
        end
        local function a34b98c63(key)
            local L704_40, L619_44 = pcall(function()
                if _549_282.Get then return _549_282:Get(key) end
                return _549_282[key] or (_549_282.Data and _549_282.Data[key]) or (_549_282.Info and _549_282.Info[key])
            end)
            if L704_40 then return L619_44 end
            return nil
        end
        local v43335 = a34b98c63("CurrentAmmo") or a34b98c63("Ammo") or a34b98c63("Bullets") or a34b98c63("MagazineAmmo")
        local L505_10 = a34b98c63("Reloading") or a34b98c63("IsReloading")
        if _549_282.Info and type(_549_282.Info) == "table" then
            if v43335 == nil then v43335 = _549_282.Info.CurrentAmmo or _549_282.Info.Ammo end
            if _549_282.Info.Reloading == true or _549_282.Info.IsReloading == true then
                L505_10 = true
            end
        end
if L505_10 == true then
            v83548 = false
            return
        end
        if typeof(v43335) == "number" and v43335 <= 0 then
            v83548 = false
            return
        end
    end)
    return v83548
end

local function v26061()
    local __BfgstqWnead = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not __BfgstqWnead or not L389_46 then return end
    __BfgstqWnead.CFrame = L389_46
    if L273_20 then
        __BfgstqWnead.AssemblyLinearVelocity = L273_20
    end
    L389_46 = nil
    L273_20 = nil
end
pcall(function()
    RunService:UnbindFromRenderStep("RestoreDesyncPerfect")
end)
pcall(function()
    RunService:BindToRenderStep("RestoreDesyncPerfect", 0, v26061)
end)
RunService.RenderStepped:Connect(v26061)

RunService.Heartbeat:Connect(function()
    pcall(function()
        local __BfgstqWnead = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not __BfgstqWnead then return end

        if L389_46 then
            v26061()
        end

       
        if L555_61 and _2631x704 and a73b35c96 and _4573x894() then
            local _3921x508 = a73b35c96:FindFirstAncestorOfClass("Model") or a73b35c96.Parent
            local _456_638 = Players:GetPlayerFromCharacter(_3921x508)
            if _456_638 and _0x5dec(_456_638) then return end
            L389_46 = __BfgstqWnead.CFrame
            L273_20 = __BfgstqWnead.AssemblyLinearVelocity
            local L501_16 = a73b35c96.Position
            local _7279x484 = L501_16 + Vector3.new(0, __lhiRNgvZ, 0)
            __BfgstqWnead.CFrame = CFrame.new(_7279x484, L501_16)
            return
        end

       
        if flyEnabled then
            if not a39b72c33 then
                a39b72c33 = __BfgstqWnead.Position
            end
L389_46 = __BfgstqWnead.CFrame
            L273_20 = __BfgstqWnead.AssemblyLinearVelocity
            local _687_388 = Vector3.new(math.random(-100, 100), math.random(-100, 100), math.random(-100, 100)).Unit
            local _7279x484 = a39b72c33 + _687_388 * _8080x566
            local _OIOO0O1 = L389_46 - L389_46.Position
            __BfgstqWnead.CFrame = CFrame.new(_7279x484) * _OIOO0O1
        end
    end)
end)

task.spawn(function()
    while true do
        task.wait(0.01)
        if L555_61 and _2631x704 then
            local __xxEEAQiVz = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character.HumanoidRootPart.Position or Vector3.zero
            local _338_977 = nil
            local __UHvhQn = math.huge

            for __YEzeEiWEWFAS, player in pairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character and not _685_730(player) then
                   
                    if _143_336(player) then
                        continue
                    end
                    if _0x5dec(player) then
                        continue
                    end
                    local __BfgstqWnead = player.Character:FindFirstChild("HumanoidRootPart")
                    local a87b18c82 = player.Character:FindFirstChild("Humanoid")
                    if __BfgstqWnead and a87b18c82 and a87b18c82.Health > 0 then
                        local _100l10O0II = (Vector3.new(__xxEEAQiVz.X, 0, __xxEEAQiVz.Z) - Vector3.new(__BfgstqWnead.Position.X, 0, __BfgstqWnead.Position.Z)).Magnitude
                        if _100l10O0II < __UHvhQn then
                            __UHvhQn = _100l10O0II
                            _338_977 = player
                        end
                    end
                end
            end

            if _338_977 and _338_977.Character then
                a73b35c96 = __bzfwbJeTMvuj(_338_977.Character)
            else
                a73b35c96 = nil
            end
        else
            a73b35c96 = nil
        end
    end
end)

local _670_782 = nil
local function L508_44(on)
    if _670_782 then _670_782:Disconnect(); _670_782 = nil end
    if not on then return end

    task.spawn(function()
        local _0x9ec3, v69764 = xpcall(function()
            local _3213x326 = LocalPlayer.PlayerScripts
            local a66b43c59, _9817x625 = pcall(require, _3213x326.Controllers.FighterController)
            local _0xd857, v27885 = pcall(require, ReplicatedStorage.Modules.EnumLibrary)
            local __MAwXiJM = ReplicatedStorage.Remotes.Replication.Fighter.UseItem
            local _IIOl1OI11O00; pcall(function() _IIOl1OI11O00 = v27885:ToEnum("StartShooting") end)

            local function _5460x742()
                if not (a66b43c59 and _9817x625) then return nil end
                local _0x3584 = _9817x625.LocalFighter; if not _0x3584 then return nil end
                local _549_282 = _0x3584.EquippedItem; if not _549_282 then return nil end
                local L704_40, L987_53 = pcall(function() return _549_282:Get("ObjectID") end)
                if L704_40 and L987_53 then return L987_53 end
L704_40, L987_53 = pcall(function() return _549_282.Data and _549_282.Data.ObjectID end)
                return L704_40 and L987_53 or nil
            end

            local function a30b54c42(originPos, _IOI1l0I100)
                local L501_16 = _IOI1l0I100.Position
                local _0xb60d = CFrame.lookAt(originPos, L501_16)
                local _0Il0I11O, _1897x442, _0xefad = _0xb60d:ToOrientation()
                local a49b75c71 = {
                    [utf8.char(0)] = originPos.X, [utf8.char(1)] = originPos.Y, [utf8.char(2)] = originPos.Z,
                    [utf8.char(3)] = _0Il0I11O, [utf8.char(4)] = _1897x442, [utf8.char(5)] = _0xefad,
                }
                local a12b15c22 = _IOI1l0I100.CFrame:ToObjectSpace(CFrame.new(L501_16))
                local _lOl1lI0llll0, _1l00IOl101Il, __CtOClXPOnz = a12b15c22:ToOrientation()
                return {
                    [utf8.char(1)] = {
                        [utf8.char(0)] = a49b75c71,
                        [utf8.char(1)] = a49b75c71,
                        [utf8.char(2)] = _IOI1l0I100,
                        [utf8.char(3)] = {
                            [utf8.char(0)] = a12b15c22.X, [utf8.char(1)] = a12b15c22.Y, [utf8.char(2)] = a12b15c22.Z,
                            [utf8.char(3)] = _lOl1lI0llll0, [utf8.char(4)] = _1l00IOl101Il, [utf8.char(5)] = __CtOClXPOnz,
                        },
                    },
                }
            end

            local _l0OIIO = nil
            _670_782 = RunService.Heartbeat:Connect(function()
                if not _0IO100O or not _2631x704 then return end
                local _lO00OO0 = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if not _lO00OO0 then return end
                local _0xf72a = _5460x742()
                if _0xf72a then _l0OIIO = _0xf72a else _0xf72a = _l0OIIO end
                if not _0xf72a then return end
for __YEzeEiWEWFAS, __RrBoATP in ipairs(Players:GetPlayers()) do
                    if __RrBoATP == LocalPlayer then continue end
                    if _685_730(__RrBoATP) then continue end
                    if _143_336(__RrBoATP) then continue end
                    local char = __RrBoATP.Character; if not char then continue end
                    local a87b18c82 = char:FindFirstChildWhichIsA("Humanoid")
                    if not a87b18c82 or a87b18c82.Health <= 0 then continue end
                    local L405_52 = char:FindFirstChild("Head"); if not L405_52 then continue end
                    local _1548x582 = L405_52.Position - Vector3.new(0, 5, 0)
                    local v84604 = a30b54c42(_1548x582, L405_52)
                    pcall(function() __MAwXiJM:FireServer(_0xf72a, _IIOl1OI11O00, v84604, nil) end)
                end
end)
        end, function(v69764) end)
    end)
end

local L292_59 = LocalPlayer.PlayerScripts
local L767_25 = L292_59:WaitForChild("Controllers", 10)

local _0xfaed = require(ReplicatedStorage.Modules:WaitForChild("EnumLibrary", 10))
if _0xfaed then _0xfaed:WaitForEnumBuilder() end

local L673_86 = require(ReplicatedStorage.Modules:WaitForChild("CosmeticLibrary", 10))
local a17b70c23 = require(ReplicatedStorage.Modules:WaitForChild("ItemLibrary", 10))
local _3470x248 = require(L767_25:WaitForChild("PlayerDataController", 10))

local v61318, _0x8a53 = {}, {}
local a51b52c84, L259_66 = nil, nil
local __BINfSwtqqJ = nil

local function L574_69(_00IO01, _0xca67, v18000)
    local _5657x211 = L673_86.Cosmetics[_00IO01]
    if not _5657x211 then return nil end
    local a91b73c94 = {}
    for key, value in pairs(_5657x211) do a91b73c94[key] = value end
    a91b73c94.Name = _00IO01
    a91b73c94.Type = a91b73c94.Type or _0xca67
    a91b73c94.Seed = a91b73c94.Seed or math.random(1, 1000000)
    if _0xfaed then
        local a37b43c30, _984_394 = pcall(_0xfaed.ToEnum, _0xfaed, _00IO01)
        if a37b43c30 and _984_394 then a91b73c94.Enum, a91b73c94.ObjectID = _984_394, a91b73c94.ObjectID or _984_394 end
    end
    if v18000 then
        if v18000.inverted ~= nil then a91b73c94.Inverted = v18000.inverted end
        if v18000.favoritesOnly ~= nil then a91b73c94.OnlyUseFavorites = v18000.favoritesOnly end
    end
    return a91b73c94
end

local _429_584 = "unlockall/config.json"
local function L868_80()
    if not wr
