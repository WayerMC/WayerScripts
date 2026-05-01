local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- Configuración del Círculo (Tu dibujo)
local FOVCircle = Drawing.new("Circle")
FOVCircle.Thickness = 2
FOVCircle.Color = Color3.fromRGB(255, 0, 0) -- Rojo como tu dibujo
FOVCircle.Radius = 150
FOVCircle.Filled = false
FOVCircle.Visible = true
FOVCircle.Transparency = 1

-- Función para actualizar el círculo en el centro de tu pantalla
RunService.RenderStepped:Connect(function()
    local mousePos = game:GetService("UserInputService"):GetMouseLocation()
    FOVCircle.Position = Vector2.new(mousePos.X, mousePos.Y)
end)

-- Función para detectar quién está en el círculo
local function getClosestPlayerInFOV()
    local closestPlayer = nil
    local shortestDistance = math.huge

    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            -- Convertimos la posición 3D del enemigo a tu pantalla 2D
            local pos, onScreen = Camera:WorldToViewportPoint(player.Character.HumanoidRootPart.Position)
            
            if onScreen then
                local mousePos = game:GetService("UserInputService"):GetMouseLocation()
                local distance = (Vector2.new(pos.X, pos.Y) - mousePos).Magnitude
                
                -- Si está dentro del radio del círculo
                if distance <= FOVCircle.Radius and distance < shortestDistance then
                    closestPlayer = player
                    shortestDistance = distance
                end
            end
        end
    end
    return closestPlayer
end

-- Bucle de detección
task.spawn(function()
    while task.wait() do
        local target = getClosestPlayerInFOV()
        if target then
            -- Aquí el script ya sabe que "target" está en tu círculo rojo
            -- print("Objetivo detectado: " .. target.Name)
        end
    end
end)
