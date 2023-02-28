local library = loadstring(game:HttpGet('https://raw.githubusercontent.com/cueshut/saves/main/criminality%20paste%20ui%20library'))()

-- // Window \\ --
local window = library.new('Boulevard Destroyer v1 (made by domo#1588)', 'leadmarker')

-- // Tabs \\ --
local tab = window.new_tab('rbxassetid://12631819979') -- autofarm
local tab2 = window.new_tab('rbxassetid://304749478') -- character
local tab1 = window.new_tab('rbxassetid://12631762015') -- misc

-- // Sections \\ --
local section = tab.new_section('Autofarm')
local section1 = tab1.new_section('Misc')
local section2 = tab2.new_section('Character')

-- // Sector \\ --
local sector = section.new_sector('Go-Mart', 'Left')
local sector1 = section.new_sector('Mailer', 'Right')
local sector3 = section2.new_sector('Settings', 'Left')

-- // Misc Sectors \\ -- 
local sector2 = section1.new_sector('Safety', 'Left')

-- // Elements \\ -- (Type, Name, State, Callback)

local slider = sector3.element('Slider', 'Walkspeed', {default = {min = 16, max = 1000, default = 16}}, function(v)
   print(v.Slider)
   game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = v.Slider
end)

local slider = sector3.element('Slider', 'Jump Power', {default = {min = 50, max = 1000, default = 50}}, function(v)
   print(v.Slider)
   game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = v.Slider
end)


local Noclip = false
local Clip = false
local InfJump = false

clip = false 

game:GetService("UserInputService").JumpRequest:connect(function()
	if InfJump == true then
		game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
	end
end)

function noclip()
	Clip = false
	local function Nocl()
		if Clip == false and game.Players.LocalPlayer.Character ~= nil then
			for _,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
				if v:IsA('BasePart') and v.CanCollide and v.Name ~= floatName then
					v.CanCollide = false
				end
			end
		end
		wait(0.21) 
	end
	Noclip = game:GetService('RunService').Stepped:Connect(Nocl)
end

function clip()
	if Noclip then Noclip:Disconnect() end
	Clip = true
end

local button = sector1.element('Button', 'Turn on Mailer Autofarm', nil, function()
spawn(function()
    while wait(0.001) do
    local player = game.Players.LocalPlayer
    local args = {
        [1] = "WorkJob",
        [2] = "Mailer"
    }

    game:GetService("ReplicatedStorage").Events.Job:InvokeServer(unpack(args))
    if player.Backpack:FindFirstChild("LETTER") then
        local shelfpoints = game:GetService("Workspace").Jobs["Job_Mailer"].Mailboxes
        local tool = player.Backpack:FindFirstChild("LETTER")
        player.Character.Humanoid:EquipTool(tool)
        local inv = tool:FindFirstChild("MailboxNumber").Value
        --player.Character.HumanoidRootPart.CFrame = shelfpoints:FindFirstChild("Shelf"..inv).CFrame
        shelfpoints:FindFirstChild("Mailbox"..inv).CanCollide = false
        shelfpoints:FindFirstChild("Mailbox"..inv).CFrame = player.Character.HumanoidRootPart.CFrame
        wait(0.05)
        player.Character.Humanoid:UnequipTools()
        end
    end
    end)
end)

local button = sector.element('Button', 'Turn on Go-Mart Autofarm', nil, function()
    spawn(function()
            while wait(0.001) do
    local player = game.Players.LocalPlayer
    local args = {
        [1] = "WorkJob",
        [2] = "Cargo Lifter"
    }

    game:GetService("ReplicatedStorage").Events.Job:InvokeServer(unpack(args))
    if player.Backpack:FindFirstChild("SUPPLY BOX") then
        local shelfpoints = game:GetService("Workspace").Jobs["Job_CargoLifter"].ShelfPoints
        local tool = player.Backpack:FindFirstChild("SUPPLY BOX")
        player.Character.Humanoid:EquipTool(tool)
        local inv = tool:FindFirstChild("ShelfNumber").Value
        --player.Character.HumanoidRootPart.CFrame = shelfpoints:FindFirstChild("Shelf"..inv).CFrame
        shelfpoints:FindFirstChild("Shelf"..inv).CFrame = player.Character.HumanoidRootPart.CFrame
        wait(0.05)
        player.Character.Humanoid:UnequipTools()
        end
    end
    end)
end)

--[[local toggle = sector1.element('Toggle', 'Toggle Mailer Auto-Farm', false, function(v)

end)--]]

local toggle2 = sector2.element('Toggle', 'Kick on Mod Join', false, function(v)
     print("The Kick on Mod Join Toggle is now: ".. v)
    game:GetService("Players").PlayerAdded:Connect(function(plrJoined)
        if plrJoined.Name == "Starfishht" or "Xxone26" or "lightvoidzzzz" and v.Toggle == true then
            game:GetService("Players").LocalPlayer:Kick("An moderator joined!")
            end
        end)
end)

local toggle4 = sector3.element('Toggle', 'Toggle Noclip', false, function(v)
    if v.Toggle == true then
        noclip()
    elseif v.Toggle == false then
        clip()
    end
end)


local toggle4 = sector3.element('Toggle', 'Toggle Infinite Jump', false, function(v)
    if v.Toggle == true then
        InfJump = true
    elseif v.Toggle == false then
        InfJump = false
    end
end)

toggle:add_color({Color = Color3.fromRGB(84, 101, 255)}, nil, function(v)
   print(v.Color)    
end)

toggle2:add_color({Color = Color3.fromRGB(84, 101, 255)}, nil, function(v)
   print(v.Color)    
end)

--[[local dropdown = sector.element('Dropdown', 'Dropdown', {options = {'one', 'two', 'three'}}, function(v)
   print(v.Dropdown)
end)--]]



--[[local combo = sector.element('Combo', 'Combo', {options = {'bruh', 'otherbruh'}}, function(v)
   table.foreach(v.Combo, print)
end)--]]
