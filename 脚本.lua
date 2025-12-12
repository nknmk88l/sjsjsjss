local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/nknmk88l/sjsjsjss/refs/heads/main/Library-%E9%BB%91%E6%9B%9C%E7%9F%B3%E5%BD%A9%E8%99%B9%E5%8F%98%E8%89%B2.lua"))()

local Window = Library:CreateWindow({
    Title = "shenmiHuB",
    Footer = "Powered by Obsidian",
    Position = UDim2.fromOffset(50, 50),
    Size = UDim2.fromOffset(700, 500),
    ToggleKeybind = Enum.KeyCode.RightControl,
    Center = true
})

-- 基本功能
local MainTab = Window:AddTab("主功能")

local LeftGroup = MainTab:AddLeftGroupbox("基本控制")

LeftGroup:AddToggle("功能开关", {
    Text = "启用主要功能",
    Default = true,
    Callback = function(Value)
        Library:Notify("功能 " .. (Value and "开启" or "关闭"))
    end
})

LeftGroup:AddSlider("强度设置", {
    Text = "效果强度",
    Default = 75,
    Min = 0,
    Max = 100,
    Rounding = 1,
    Suffix = "%",
    Callback = function(Value)
        print("强度设置为:", Value)
    end
})

-- 设置
local SettingsTab = Window:AddTab("设置")

local SettingsGroup = SettingsTab:AddLeftGroupbox("UI 设置")

SettingsGroup:AddDropdown("主题选择", {
    Values = {"暗色", "亮色", "自定义"},
    Default = "暗色",
    Callback = function(Value)
        Library:Notify("主题切换为: " .. Value)
    end
})

SettingsGroup:AddButton("重置设置", function()
    Library:Notify("设置已重置")
end)

-- 信息
local InfoTab = Window:AddTab("信息")

local InfoGroup = InfoTab:AddLeftGroupbox("系统信息")

InfoGroup:AddLabel("游戏: " .. game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name)
InfoGroup:AddLabel("玩家: " .. game.Players.LocalPlayer.Name)
InfoGroup:AddLabel("FPS: 待更新")

game:GetService("RunService").RenderStepped:Connect(function()
    -- 这里可以添加 FPS 更新逻辑
end)

Library:Notify("UI 加载完成!", 5)
