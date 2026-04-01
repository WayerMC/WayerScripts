-- WayerSU Script Oficial
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("WayerSU Script", "DarkScene")

-- Variables
local flying = false
local noclip = false
local speedValue = 16
local lp = game.Players.LocalPlayer

-- Tab Principal
local Main = Window:NewTab("Principal")
local Section = Main:NewSection("Controles de Wayer")

-- Lógica de Noclip (Bucle)
game:GetService("RunService").Stepped:Connect(function()
    if noclip then
        for _, v in pairs(lp.Character:GetDescendants()) do
            if v:IsA("BasePart") then
                v.CanCollide = false
            end
        end
    end
end)

-- Botones según tu dibujo
Section:NewButton("Volar", "Activa/Desactiva el vuelo", function()
    flying = not flying
    if flying then
        -- Aquí podrías añadir una función de Fly simple
        print("Volar: ON")
    else
        print("Volar: OFF")
    end
end)

Section:NewButton("Noclip", "Traspasa paredes", function()
    noclip = not noclip
    print("Noclip: " .. tostring(noclip))
end)

Section:NewTextBox("PutSpeed", "Máximo 16000", function(text)
    local n = tonumber(text)
    if n then speedValue = n end
end)

Section:NewButton("Speed", "Aplicar velocidad", function()
    if lp.Character and lp.Character:FindFirstChild("Humanoid") then
        lp.Character.Humanoid.WalkSpeed = speedValue
    end
end)

-- Tab Consola
local ConsoleTab = Window:NewTab("Console")
local cSection = ConsoleTab:NewSection("Log")
cSection:NewButton("Ver Consola (F9)", "Abre logs del sistema", function()
    game:GetService("LogService"):GetLogHistory() -- Esto imprime en la consola interna
    print("Consola de WayerSU activa")
end)
