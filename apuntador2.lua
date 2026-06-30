local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")

-- Color de tu mira (Rojo)
local COLOR_MIRA = Color3.fromRGB(255, 0, 0)

local function crearMarcador(player)
    if player == LocalPlayer then return end

    local function aplicarESP(character)
        local rootPart = character:WaitForChild("HumanoidRootPart", 5) -- Mejor el RootPart para centrarlo bien
        if not rootPart then return end

        -- Si ya tiene el marcador, no lo duplicamos
        if rootPart:FindFirstChild("MiraRojaESP") then return end

        ---------------------------------------------------------
        -- Recreando visualmente tu imagen image_0.png con código --
        ---------------------------------------------------------

        -- Contenedor principal (El círculo exterior)
        local box = Instance.new("BillboardGui")
        box.Name = "MiraRojaESP"
        box.Adornee = rootPart
        box.Size = UDim2.new(0, 100, 0, 100) -- Tamaño del círculo completo
        box.AlwaysOnTop = true -- Visible a través de paredes
        
        -- El Círculo Rojo Exterior (Usando un Frame con UICorner)
        local circulo = Instance.new("Frame")
        circulo.Name = "Circulo"
        circulo.BackgroundTransparency = 1 -- Fondo transparente
        circulo.BorderSizePixel = 0
        circulo.Size = UDim2.new(1, 0, 1, 0)
        circulo.Parent = box

        local uiStroke = Instance.new("UIStroke") -- Esto hace el borde rojo
        uiStroke.Color = COLOR_MIRA
        uiStroke.Thickness = 4 -- Grosor del borde del círculo
        uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        uiStroke.Parent = circulo

        local uiCorner = Instance.new("UICorner") -- Esto hace que el Frame sea un círculo perfecto
        uiCorner.CornerRadius = UDimCorner.new(1, 0)
        uiCorner.Parent = circulo

        -- La Cruz Interior (Dos líneas finas)
        local lineaVertical = Instance.new("Frame")
        lineaVertical.Name = "LineaV"
        lineaVertical.BackgroundColor3 = COLOR_MIRA
        lineaVertical.BorderSizePixel = 0
        lineaVertical.Size = UDim2.new(0, 2, 0, 60) -- Línea fina vertical
        lineaVertical.Position = UDim2.new(0.5, -1, 0.5, -30) -- Centrada
        lineaVertical.Parent = box

        local lineaHorizontal = Instance.new("Frame")
        lineaHorizontal.Name = "LineaH"
        lineaHorizontal.BackgroundColor3 = COLOR_MIRA
        lineaHorizontal.BorderSizePixel = 0
        lineaHorizontal.Size = UDim2.new(0, 60, 0, 2) -- Línea fina horizontal
        lineaHorizontal.Position = UDim2.new(0.5, -30, 0.5, -1) -- Centrada
        lineaHorizontal.Parent = box

        ---------------------------------------------------------

        box.Parent = CoreGui -- Lo pone en la interfaz del juego
    end

    if player.Character then
        aplicarESP(player.Character)
    end
    player.CharacterAdded:Connect(aplicarESP)
end

-- Lo aplica a los jugadores que ya están en la partida
for _, player in ipairs(Players:GetPlayers()) do
    crearMarcador(player)
end

-- Lo aplica a los que vayan entrando
Players.PlayerAdded:Connect(crearMarcador)
