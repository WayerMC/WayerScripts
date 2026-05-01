local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Player = game.Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- Limpiar si ya existe uno puesto
if PlayerGui:FindFirstChild("CursorWayer") then
    PlayerGui.CursorWayer:Destroy()
end

-- Crear Interfaz
local sg = Instance.new("ScreenGui")
sg.Name = "CursorWayer"
sg.IgnoreGuiInset = true
sg.DisplayOrder = 999
sg.Parent = PlayerGui

-- Crear el Círculo Blanco (Generado por código para que siempre cargue)
local circulo = Instance.new("Frame")
circulo.Size = UDim2.new(0, 20, 0, 20) -- Tamaño del círculo
circulo.AnchorPoint = Vector2.new(0.5, 0.5)
circulo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
circulo.BorderSizePixel = 0
circulo.Parent = sg

-- Hacer que el cuadrado sea un círculo perfecto
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(1, 0) 
corner.Parent = circulo

-- Movimiento en tiempo real para Celular
RunService.RenderStepped:Connect(function()
    local mousePos = UserInputService:GetMouseLocation()
    circulo.Position = UDim2.new(0, mousePos.X, 0, mousePos.Y)
end)

print("Script de Cursor Wayer cargado con éxito")
