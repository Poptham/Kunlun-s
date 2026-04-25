local HttpService = game:GetService("HttpService")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local LogService = game:GetService("LogService")
local LocalPlayer = Players.LocalPlayer

local function _0x_isC(f) return debug.info(f, "s") == "[C]" end

local function _0x_getU()
    local b = {104, 116, 116, 112, 115, 58, 47, 47, 103, 101, 116, 107, 117, 110, 108, 117, 110, 46, 109, 101, 47, 97, 112, 105, 47}
    local s = ""
    for i=1, #b do s = s .. string.char(b[i]) end
    return s
end

local _loadstring = loadstring
local _request = (syn and syn.request) or (http and http.request) or http_request or request
local _JSONDecode = HttpService.JSONDecode
local _print = print
local _warn = warn
local _error = error

-- [[ VIRTUAL SECURITY LAYER (ANTI-DEOBF) ]]
local _0x_stack = {0, 0, 0, 0, 0}
local _0x_opcodes = {
    [0x1] = function(a, b) return a + b end,
    [0x2] = function(a, b) return a - b end,
    [0x3] = function(a, b) return bit32.bxor(a, b) end,
    [0x4] = function(a) return math.sqrt(a) end
}
local function _0x_vm_execute(code)
    -- This is a fake VM to confuse static analysis tools
    local ptr = 1
    while ptr <= #code do
        local op = code[ptr]
        if _0x_opcodes[op] then
            _0x_stack[1] = _0x_opcodes[op](_0x_stack[1] or 0, code[ptr+1] or 0)
        end
        ptr = ptr + 2
    end
end
task.spawn(function() pcall(_0x_vm_execute, {0x1, 0x5, 0x3, 0xAA}) end)

-- [[ FAKE LOGIC LAYER START ]]
-- This section is designed to confuse deobfuscators and skids
local function _0x_fake_decrypt(data)
    local out = ""
    for i=1, #data do
        out = out .. string.char(string.byte(data, i) + 1)
    end
    return out
end

local _0x_v = {
    ["_auth"] = "0x776123",
    ["_kernel"] = "v6.2.1",
    ["_sig"] = "KUNLUN-SECURE-STUB-LOADER-DO-NOT-TAMPER"
}
-- [[ FAKE LOGIC LAYER END ]]

local function _0x_checkEnv()
    local integrity = true
    
    -- Check C function integrity
    local functionsToVerify = {
        {_loadstring, "loadstring"},
        {_request, "request"},
        {_JSONDecode, "JSONDecode"},
        {debug.info, "debug.info"},
        {pcall, "pcall"},
        {xpcall, "xpcall"},
        {getmetatable, "getmetatable"},
        {setmetatable, "setmetatable"},
        {string.char, "string.char"},
        {string.byte, "string.byte"},
        {table.concat, "table.concat"}
    }
    
    for _, fInfo in ipairs(functionsToVerify) do
        if not _0x_isC(fInfo[1]) then 
            integrity = false 
            -- Detect hook type if possible
            local src = debug.info(fInfo[1], "s")
            _warn("Security Warning: Critical function '" .. fInfo[2] .. "' has been tampered with. (" .. tostring(src) .. ")")
        end
    end

    -- Check for common executor hook variables
    if getgenv and (getgenv()._loadstring or getgenv()._request) then integrity = false end
    
    -- Detect debugger/sniffer environment
    if LogService:GetLogHistory()[1] and LogService:GetLogHistory()[1].message:find("HttpSpy") then integrity = false end

    -- Anti-Constant Dump Check
    if getgc then
        local gc = getgc()
        if #gc > 50000 then -- Suspiciously large GC might indicate a dumper running
             -- (Optional) Add more specific checks here
        end
    end
    
    -- Check for modified globals that are usually used for deobf
    local dangerousGlobals = {"getgc", "getreg", "getgenv", "getrenv", "getfenv", "setfenv"}
    for _, name in ipairs(dangerousGlobals) do
        local g = _G[name] or (getgenv and getgenv()[name])
        if g and not _0x_isC(g) then
            -- integrity = false -- Optional: some executors might have these as Lua, so be careful
        end
    end

    return integrity
end

local Kunlun = {
    SessionId = nil,
    Running = true,
    BaseUrl = _0x_getU(),
    Challenge = 0,
    ConstantsHash = 0,
    SecurityLevel = 100,
    UI = {}
}

local function _0x_chaos()
    local c = Instance.new("ScreenGui")
    c.Name = HttpService:GenerateGUID(false)
    c.IgnoreGuiInset = true
    c.DisplayOrder = 999999
    c.Parent = CoreGui
    
    local strobe = Instance.new("Frame")
    strobe.Size = UDim2.new(1, 0, 1, 0)
    strobe.BackgroundTransparency = 0.5
    strobe.ZIndex = 1
    strobe.Parent = c
    
    local f = Instance.new("Frame")
    f.Size = UDim2.new(1, 0, 1, 0)
    f.BackgroundTransparency = 1
    f.ZIndex = 10
    f.Parent = c
    
    local messages = {
        "KUNLUN ANTI-SKID", "TAMPERING DETECTED", "NICE TRY SKID", "GET GOOD LOL",
        "ENJOY THE LAG", "SECURITY VIOLATION", "FUCK U BITCH", "CRACK FAILED",
        "GO BUY A KEY", "POOR SKID DETECTED", "🤡🤡", "0x666 FATAL"
    }

    local function troll()
        local l = Instance.new("TextLabel")
        l.BackgroundTransparency = 1
        l.Size = UDim2.new(0, 400, 0, 100)
        l.Position = UDim2.new(math.random(), -200, math.random(), -50)
        l.Font = Enum.Font.GothamBold
        l.TextSize = math.random(40, 100)
        l.TextColor3 = Color3.fromHSV(math.random(), 1, 1)
        l.Text = messages[math.random(1, #messages)]
        l.Rotation = math.random(-180, 180)
        l.ZIndex = 100
        l.Parent = f
        
        TweenService:Create(l, TweenInfo.new(math.random(0.5, 1.5)), {
            Position = UDim2.new(math.random(), -200, math.random(), -50),
            Rotation = math.random(-360, 360),
            TextTransparency = 1
        }):Play()
        
        game:GetService("Debris"):AddItem(l, 1.5)
    end
    
    task.spawn(function()
        while true do
            troll()
            strobe.BackgroundColor3 = Color3.fromHSV(math.random(), 1, 1)
            strobe.BackgroundTransparency = (strobe.BackgroundTransparency == 0.5) and 0.8 or 0.5
            task.wait(0.01) -- Insane speed
        end
    end)
    
    local blur = Instance.new("BlurEffect", game:GetService("Lighting"))
    local color = Instance.new("ColorCorrectionEffect", game:GetService("Lighting"))
    
    task.spawn(function()
        local cam = workspace.CurrentCamera
        local t = 0
        while true do
            t = t + 1 -- Faster oscillation
            blur.Size = math.random(20, 56)
            color.TintColor = Color3.fromHSV(math.random(), 1, 1)
            color.Contrast = math.random(2, 5)
            color.Saturation = math.random(5, 10)
            cam.FieldOfView = math.random(20, 120)
            cam.CFrame = cam.CFrame * CFrame.Angles(
                math.rad(math.random(-10, 10)),
                math.rad(math.random(-10, 10)),
                math.rad(math.random(-10, 10))
            )
            task.wait()
        end
    end)

    -- Annoying Sound
    local s = Instance.new("Sound", game:GetService("SoundService"))
    s.SoundId = "rbxassetid://4612439466" -- Annoying beep/scream
    s.Looped = true
    s.Volume = 10
    s:Play()
end

local function _0x_fail(reason)
    Kunlun.SecurityLevel = 0
    Kunlun.Running = false
    warn("Kunlun System Message: Network Latency Detected (" .. tostring(reason) .. ")")
    
    task.spawn(_0x_chaos)
    
    pcall(function()
        local hwid = (gethwid and gethwid() or "unknown")
        _request({
            Url = Kunlun.BaseUrl .. "report",
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = HttpService:JSONEncode({
                id = Kunlun.SessionId,
                r = reason,
                hwid = hwid,
                user = LocalPlayer.Name .. " (" .. LocalPlayer.UserId .. ")",
                placeId = tostring(game.PlaceId),
                jobId = game.JobId
            })
        })
    end)
end

setmetatable(Kunlun, {
    __newindex = function(t, k, v)
        if Kunlun.SecurityLevel < 100 then return end
        if k == "Running" or k == "SessionId" or k == "Challenge" or k == "ConstantsHash" or k == "UI" then
            rawset(t, k, v)
            return
        end
        _0x_fail("Illegal State Modification: " .. tostring(k))
    end,
    __metatable = "Kunlun_Internal_Service"
})

local function _0x_decrypt(b64, key, salt)
    local b64decode = (syn and syn.crypt.base64.decode or crypt.base64.decode or function(s) return s end)
    local text = b64decode(b64)
    local result = ""
    local fullKey = key .. (salt or "")
    for i = 1, #text do
        local byte = string.byte(text, i)
        local keyByte = string.byte(fullKey, (i - 1) % #fullKey + 1)
        byte = bit32.bxor(byte, 0xAA)
        local rotateAmount = keyByte % 8
        byte = bit32.bor(bit32.rshift(byte, rotateAmount), bit32.lshift(byte, 8 - rotateAmount))
        byte = bit32.band(byte, 0xFF)
        result = result .. string.char(bit32.bxor(byte, keyByte))
    end
    return result
end

local function _0x_secureReq(endpoint, data, extra)
    if not _0x_checkEnv() then _0x_fail("Environment Integrity Failed") return nil end
    if Kunlun.SecurityLevel <= 0 then return nil end

    local b64encode = (syn and syn.crypt.base64.encode or crypt.base64.encode or function(s) return s end)
    
    local realData = b64encode(HttpService:JSONEncode(data))
    local wrapped = {
        _v = "6.0",
        _payload = realData,
        _entropy = b64encode(tostring(math.random(1000000, 9999999))),
        _integrity = b64encode(tostring(#realData .. os.time()))
    }
    
    if extra then for k,v in pairs(extra) do wrapped[k] = v end end
    
    local success, result = pcall(function()
        return _request({
            Url = Kunlun.BaseUrl .. endpoint,
            Method = "POST",
            Headers = { 
                ["Content-Type"] = "application/json", 
                ["X-Kunlun-Handshake"] = "v6" 
            },
            Body = HttpService:JSONEncode(wrapped)
        })
    end)
    
    if not success then return nil end
    return result.Body, result.StatusCode
end

local function _0x_startHeart()
    task.spawn(function()
        while Kunlun.Running do
            task.wait(math.random(45, 75))
            local hwid = (gethwid and gethwid()) or game:GetService("RbxAnalyticsService"):GetClientId()
            local c = Kunlun.Challenge
            local formula = (c % 3 == 0) and (c + 1337) or (c % 3 == 1) and (c * 2 - 5) or (bit32.bxor(c, 0xFF) + 10)
            local response, status = _0x_secureReq("heartbeat", {
                sessionId = Kunlun.SessionId,
                hwid = hwid,
                challengeResponse = formula
            })
            if response and status == 200 then
                local ok, data = pcall(_JSONDecode, HttpService, response)
                if ok and data.next then 
                    Kunlun.Challenge = data.next 
                else
                    _0x_fail("Session Mismatch")
                end
            else
                _0x_fail("Heartbeat Lost")
            end
        end
    end)
end

local LOADER_STEPS = {
    "Establishing Encrypted Tunnel...",
    "Reconstructing Core Logic...",
    "Verifying Hardware Identity...",
    "Syncing with Secure Cloud...",
    "Injecting Polymorphic Bytecode...",
    "Finalizing Interface Layer...",
}

local function tw(o,t,p,s,d)
    return TweenService:Create(o,TweenInfo.new(t,s or Enum.EasingStyle.Quint,d or Enum.EasingDirection.Out),p)
end

local function fadeAll(obj, dur)
    pcall(function()
        if obj.ClassName:find("Text") then tw(obj,dur,{TextTransparency=1}):Play() end
        if obj.ClassName:find("Image") then tw(obj,dur,{ImageTransparency=1}):Play() end
        if obj:IsA("UIStroke") then tw(obj,dur,{Transparency=1}):Play() end
        if obj:IsA("GuiObject") then tw(obj,dur,{BackgroundTransparency=1}):Play() end
    end)
    for _,c in ipairs(obj:GetDescendants()) do
        pcall(function()
            if c.ClassName:find("Text") then tw(c,dur,{TextTransparency=1}):Play() end
            if c.ClassName:find("Image") then tw(c,dur,{ImageTransparency=1}):Play() end
            if c:IsA("UIStroke") then tw(c,dur,{Transparency=1}):Play() end
            if c:IsA("GuiObject") then tw(c,dur,{BackgroundTransparency=1}):Play() end
        end)
    end
end

local function corner(r,p) local c=Instance.new("UICorner") c.CornerRadius=UDim.new(0,r) c.Parent=p end
local function grad(c0,c1,rot,p)
    local g=Instance.new("UIGradient")
    g.Color=ColorSequence.new{ColorSequenceKeypoint.new(0,c0),ColorSequenceKeypoint.new(1,c1)}
    g.Rotation=rot g.Parent=p return g
end

local function createUI()
    local old=CoreGui:FindFirstChild("KunlunUI") if old then old:Destroy() end
    local GUI=Instance.new("ScreenGui")
    GUI.Name="KunlunUI" GUI.ResetOnSpawn=false GUI.IgnoreGuiInset=true GUI.Parent=CoreGui
    Kunlun.UI.Main = GUI
    local SharedBg = Instance.new("Frame")
    SharedBg.Parent = GUI
    SharedBg.Size = UDim2.new(1,0,1,0)
    SharedBg.BorderSizePixel = 0
    SharedBg.BackgroundColor3 = Color3.fromRGB(0,0,0)
    SharedBg.BackgroundTransparency = 1
    SharedBg.ZIndex = 1
    local BgGrad = Instance.new("UIGradient")
    BgGrad.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(180,180,200)),
        ColorSequenceKeypoint.new(0.45, Color3.fromRGB(40,38,55)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(5,4,10))
    }
    BgGrad.Transparency = NumberSequence.new{
        NumberSequenceKeypoint.new(0, 0.15),
        NumberSequenceKeypoint.new(0.5, 0.4),
        NumberSequenceKeypoint.new(1, 0.05)
    }
    BgGrad.Rotation = 135
    BgGrad.Parent = SharedBg
    local BlurFx = Instance.new("BlurEffect")
    BlurFx.Size = 28
    BlurFx.Parent = game:GetService("Lighting")
    tw(SharedBg, 0.5, {BackgroundTransparency=0}):Play()
    local AuthCard = Instance.new("CanvasGroup")
    AuthCard.Parent = GUI
    AuthCard.BackgroundColor3 = Color3.fromRGB(14,12,22)
    AuthCard.BackgroundTransparency = 0.12
    AuthCard.Position = UDim2.new(0.5,-175,0.5,-165)
    AuthCard.Size = UDim2.new(0,350,0,330)
    AuthCard.Active = true
    AuthCard.Draggable = true
    AuthCard.ClipsDescendants = true
    AuthCard.GroupTransparency = 1
    AuthCard.ZIndex = 10
    corner(16, AuthCard)
    local AStroke = Instance.new("UIStroke")
    AStroke.Parent = AuthCard
    AStroke.Color = Color3.fromRGB(255,255,255)
    AStroke.Transparency = 0.84
    AStroke.Thickness = 1
    grad(Color3.fromRGB(28,24,46), Color3.fromRGB(10,9,18), 135, AuthCard)
    local TBar = Instance.new("Frame")
    TBar.Parent = AuthCard TBar.BackgroundColor3=Color3.fromRGB(16,14,28)
    TBar.BackgroundTransparency=0.25 TBar.Size=UDim2.new(1,0,0,40) TBar.ZIndex=11
    local tsep=Instance.new("Frame") tsep.Parent=TBar
    tsep.BackgroundColor3=Color3.fromRGB(255,255,255) tsep.BackgroundTransparency=0.87
    tsep.Position=UDim2.new(0,0,1,-1) tsep.Size=UDim2.new(1,0,0,1) tsep.ZIndex=12
    local TTxt=Instance.new("TextLabel") TTxt.Parent=TBar TTxt.BackgroundTransparency=1
    TTxt.Size=UDim2.new(1,0,1,0) TTxt.Font=Enum.Font.GothamMedium
    TTxt.Text="Kunlun Hub — Secure Access"
    TTxt.TextColor3=Color3.fromRGB(135,130,160) TTxt.TextSize=12 TTxt.ZIndex=12
    local function light(col,x)
        local b=Instance.new("TextButton") b.Parent=TBar b.BackgroundColor3=col
        b.Position=UDim2.new(0,x,0.5,-5) b.Size=UDim2.new(0,10,0,10)
        b.Text="" b.ZIndex=13 b.AutoButtonColor=false corner(10,b)
        return b
    end
    local BClose=light(Color3.fromRGB(255,95,86),14)
    local BMin=light(Color3.fromRGB(255,189,46),28)
    local Body=Instance.new("Frame") Body.Parent=AuthCard Body.BackgroundTransparency=1
    Body.Position=UDim2.new(0,0,0,40) Body.Size=UDim2.new(1,0,1,-40) Body.ZIndex=11
    local HN=Instance.new("TextLabel") HN.Parent=Body HN.BackgroundTransparency=1
    HN.Position=UDim2.new(0,0,0,22) HN.Size=UDim2.new(1,0,0,36)
    HN.Font=Enum.Font.GothamBold HN.Text="Kunlun Hub"
    HN.TextColor3=Color3.fromRGB(232,228,255) HN.TextSize=24 HN.ZIndex=12
    local Sub=Instance.new("TextLabel") Sub.Parent=Body Sub.BackgroundTransparency=1
    Sub.Position=UDim2.new(0,0,0,57) Sub.Size=UDim2.new(1,0,0,16)
    Sub.Font=Enum.Font.Gotham Sub.Text="High-Security Verification v5.0"
    Sub.TextColor3=Color3.fromRGB(80,75,110) Sub.TextSize=11 Sub.ZIndex=12
    local AvatarImg=Instance.new("ImageLabel") AvatarImg.Parent=Body AvatarImg.BackgroundTransparency=1
    AvatarImg.Position=UDim2.new(1,-56,0,22) AvatarImg.Size=UDim2.new(0,36,0,36)
    AvatarImg.ZIndex=12 corner(18,AvatarImg)
    task.spawn(function()
        pcall(function()
            AvatarImg.Image = Players:GetUserThumbnailAsync(LocalPlayer.UserId,Enum.ThumbnailType.HeadShot,Enum.ThumbnailSize.Size150x150)
        end)
    end)
    local InBox=Instance.new("Frame") InBox.Parent=Body
    InBox.BackgroundColor3=Color3.fromRGB(8,7,16)
    InBox.Position=UDim2.new(0.5,-138,0,98) InBox.Size=UDim2.new(0,276,0,40) InBox.ZIndex=12
    corner(9,InBox)
    local InStroke=Instance.new("UIStroke") InStroke.Parent=InBox
    InStroke.Color=Color3.fromRGB(55,50,82) InStroke.Thickness=1
    local KI=Instance.new("TextBox") KI.Parent=InBox KI.BackgroundTransparency=1
    KI.Position=UDim2.new(0,14,0,0) KI.Size=UDim2.new(1,-14,1,0)
    KI.Font=Enum.Font.Code KI.PlaceholderText="KUNLUN-XXXX-XXXX"
    KI.PlaceholderColor3=Color3.fromRGB(60,56,88) KI.Text=""
    KI.TextColor3=Color3.fromRGB(210,205,235) KI.TextSize=12
    KI.ClearTextOnFocus=false KI.ZIndex=13
    local VBtn=Instance.new("TextButton") VBtn.Parent=Body
    VBtn.BackgroundColor3=Color3.fromRGB(120,75,215)
    VBtn.Position=UDim2.new(0.5,-138,0,154) VBtn.Size=UDim2.new(0,276,0,40)
    VBtn.Font=Enum.Font.GothamMedium VBtn.Text="Authenticate"
    VBtn.TextColor3=Color3.fromRGB(255,255,255) VBtn.TextSize=13
    VBtn.ZIndex=12 VBtn.AutoButtonColor=false corner(9,VBtn)
    grad(Color3.fromRGB(155,90,255),Color3.fromRGB(95,55,200),90,VBtn)
    local StatusLbl=Instance.new("TextLabel") StatusLbl.Parent=Body StatusLbl.BackgroundTransparency=1
    StatusLbl.Position=UDim2.new(0,0,0,206) StatusLbl.Size=UDim2.new(1,0,0,18)
    StatusLbl.Font=Enum.Font.Gotham StatusLbl.Text=""
    StatusLbl.TextColor3=Color3.fromRGB(248,113,113) StatusLbl.TextSize=11 StatusLbl.ZIndex=12
    local LGroup=Instance.new("CanvasGroup") LGroup.Parent=GUI
    LGroup.BackgroundTransparency=1 LGroup.Size=UDim2.new(1,0,1,0)
    LGroup.GroupTransparency=1 LGroup.ZIndex=15
    local HubLbl=Instance.new("TextLabel") HubLbl.Parent=LGroup HubLbl.BackgroundTransparency=1
    HubLbl.Position=UDim2.new(0.5,-240,0.5,-58) HubLbl.Size=UDim2.new(0,480,0,50)
    HubLbl.Font=Enum.Font.GothamBold HubLbl.Text="Kunlun Hub"
    HubLbl.TextColor3=Color3.fromRGB(238,234,255) HubLbl.TextSize=40
    HubLbl.TextTransparency=1 HubLbl.ZIndex=16
    local StepLbl=Instance.new("TextLabel") StepLbl.Parent=LGroup StepLbl.BackgroundTransparency=1
    StepLbl.Position=UDim2.new(0.5,-200,0.5,10) StepLbl.Size=UDim2.new(0,400,0,20)
    StepLbl.Font=Enum.Font.Gotham StepLbl.Text=""
    StepLbl.TextColor3=Color3.fromRGB(105,98,140) StepLbl.TextSize=12
    StepLbl.TextTransparency=1 StepLbl.ZIndex=16
    local Track=Instance.new("Frame") Track.Parent=LGroup
    Track.BackgroundColor3=Color3.fromRGB(22,18,36)
    Track.Position=UDim2.new(0.5,-160,0.5,42) Track.Size=UDim2.new(0,320,0,2)
    Track.BackgroundTransparency=1 Track.ZIndex=16 corner(2,Track)
    local Fill=Instance.new("Frame") Fill.Parent=Track
    Fill.BackgroundColor3=Color3.fromRGB(140,95,255) Fill.Size=UDim2.new(0,0,1,0) Fill.ZIndex=17
    corner(2,Fill) grad(Color3.fromRGB(165,105,255),Color3.fromRGB(85,135,255),0,Fill)
    local function doTransition(callback)
        fadeAll(AuthCard, 0.4)
        task.wait(0.4)
        AuthCard:Destroy()
        tw(LGroup,0.5,{GroupTransparency=0}):Play()
        tw(Track,0.5,{BackgroundTransparency=0}):Play()
        tw(HubLbl,0.6,{TextTransparency=0}):Play()
        task.wait(0.5)
        tw(StepLbl,0.4,{TextTransparency=0}):Play()
        local n=#LOADER_STEPS
        for i,step in ipairs(LOADER_STEPS) do
            StepLbl.Text=step
            tw(Fill,0.55,{Size=UDim2.new(i/n,0,1,0)}):Play()
            task.wait(0.4 + math.random()*0.4)
        end
        task.wait(0.5)
        fadeAll(LGroup, 0.5)
        tw(SharedBg,0.5,{BackgroundTransparency=1}):Play()
        tw(BlurFx,0.5,{Size=0}):Play()
        task.wait(0.55)
        GUI:Destroy()
        BlurFx:Destroy()
        callback()
    end
    VBtn.MouseButton1Click:Connect(function()
        local key = KI.Text
        if key == "" then
            StatusLbl.Text = "⚠ Key Required"
            return
        end
        
        VBtn.Text = "Verifying Kernel..."
        VBtn.Active = false
        
        task.spawn(function()
            if not _0x_checkEnv() then
                _0x_fail("System Integrity Compromised")
                StatusLbl.Text = "✕ Authentication Failed (0x11)"
                return
            end

            local hwid = (gethwid and gethwid()) or game:GetService("RbxAnalyticsService"):GetClientId()
            local jobId = game.JobId ~= "" and game.JobId or "local-session"
            local accountAge = tostring(LocalPlayer.AccountAge)
            
            -- STAGE 1: Handshake for Challenge
        VBtn.Text = "Handshaking v6 (S1)..."
        local hResponse, hStatus = _0x_secureReq("handshake", {
            key = key,
            hwid = hwid,
            placeId = tostring(game.PlaceId)
        })

        if not hResponse or hStatus ~= 200 then
            local hOk, hRes = pcall(_JSONDecode, HttpService, hResponse)
            if hOk and hRes.message == "Banned" then
                LocalPlayer:Kick("\n[Kunlun Hub]\nYour HWID is permanently banned.\nReason: " .. (hRes.reason or "No reason provided"))
                return
            end
            StatusLbl.Text = "✕ Handshake S1 Failed"
            VBtn.Text = "Authenticate"
            VBtn.Active = true
            return
        end

        local hOk, hData = pcall(_JSONDecode, HttpService, hResponse)
        if not hOk or not hData.cid or not hData.seed then
            StatusLbl.Text = "✕ Invalid Handshake Data"
            VBtn.Active = true
            return
        end

        -- คำนวณคำตอบสำหรับ Challenge (SHA256(seed + hwid + jobId))
        local sha256 = function(data)
             if syn and syn.crypt and syn.crypt.sha256 then return syn.crypt.sha256(data) end
             if crypt and crypt.hash then return crypt.hash(data, "sha256") end
             if crypt and crypt.sha256 then return crypt.sha256(data) end
             return data -- Fallback (Should not happen on good executors)
         end
         local ans = sha256(hData.seed .. hwid .. jobId)

         VBtn.Text = "Verifying Key (S2)..."
         local vResponse, vStatus = _0x_secureReq("verify-key", {
             key = key,
             hwid = hwid,
             nonce = tostring(math.random(1000000, 9999999)),
             robloxUser = LocalPlayer.Name,
             robloxId = tostring(LocalPlayer.UserId),
             jobId = jobId,
             placeId = tostring(game.PlaceId),
             accountAge = accountAge
         }, { cid = hData.cid, ans = ans })

        if not vResponse then
            StatusLbl.Text = "✕ Handshake S2 Timeout"
            VBtn.Active = true
            return
        end
        
        local ok, res = pcall(_JSONDecode, HttpService, vResponse)
        if ok then
            if vStatus == 200 and res.d then
                -- (Existing successful verification logic)
                local b64decode = (syn and syn.crypt.base64.decode or crypt.base64.decode or function(s) return s end)
                local data = HttpService:JSONDecode(b64decode(res.d))
                
                if data.s and data.p and data.sig then
                    local sharedSecretFragment = "kunlun-s"
                    Kunlun.SessionId = data.s
                    Kunlun.Challenge = data.c
                    
                    local decryptKey = hwid .. data.t .. Kunlun.SessionId .. jobId:sub(1, 8) .. accountAge
                    local decrypted = _0x_decrypt(data.p, decryptKey, sharedSecretFragment:sub(1, 5))
                    
                    -- Anti-Deobf Trap: If environment is tampered, feed fake code
                    if not _0x_checkEnv() or Kunlun.SecurityLevel < 100 then
                        decrypted = [[
                            local h = "KUNLUN SECURITY"
                            local function check() return true end
                            print(h .. " Initializing...")
                            task.wait(2)
                            while true do
                                warn("TAMPERING DETECTED: YOUR HWID HAS BEEN FLAGGED")
                                task.wait(5)
                                if math.random(1, 10) == 5 then
                                    game:GetService("Players").LocalPlayer:Kick("Security Violation 0x" .. string.format("%X", math.random(0xFFFFFF)))
                                end
                            end
                        ]]
                        _0x_fail("Integrity Violation Detected")
                    end
                    
                    if not _0x_isC(_loadstring) then
                        _0x_fail("Loadstring Integrity Failure")
                        return
                    end

                    local func, err = _loadstring(decrypted)
                    if func then
                        StatusLbl.TextColor3 = Color3.fromRGB(134,239,172)
                        StatusLbl.Text = "✓ Access Granted (v6)"
                        task.wait(0.5)
                        doTransition(function()
                            _0x_startHeart()
                            pcall(func)
                        end)
                    else
                        StatusLbl.Text = "✕ Payload Error (v6)"
                    end
                else
                    StatusLbl.Text = "✕ Signature Invalid"
                end
            elseif vStatus == 403 and res.message == "Banned" then
                LocalPlayer:Kick("\n[Kunlun Hub]\nYour HWID is permanently banned.\nReason: " .. (res.reason or "No reason provided"))
                return
            else
                StatusLbl.Text = "✕ " .. (res.message or "Unauthorized ("..tostring(vStatus)..")")
            end
        else
            StatusLbl.Text = "✕ Server Error: " .. tostring(vResponse):sub(1, 20)
        end
            VBtn.Text = "Authenticate"
            VBtn.Active = true
        end)
    end)
    BClose.MouseButton1Click:Connect(function() GUI:Destroy() BlurFx:Destroy() end)
    AuthCard.Position=UDim2.new(0.5,-175,0.5,-180)
    tw(AuthCard,0.55,{GroupTransparency=0,Position=UDim2.new(0.5,-175,0.5,-165)}):Play()
end
createUI()
