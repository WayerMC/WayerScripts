-- Buscamos un RemoteEvent que ya exista en el juego (este es un ejemplo ficticio)
-- Los explotadores suelen buscar Remotes en ReplicatedStorage o Workspace
local remote = game:GetService("ReplicatedStorage"):FindFirstChild("CambiarCieloEvent") or game:GetService("ReplicatedStorage"):FindFirstChild("UpdateWeather")

if remote then
    -- Si el script del servidor del juego acepta un color, se lo mandamos:
    local colorRojo = Color3.fromRGB(255, 0, 0)
    
    -- ¡Disparamos al servidor del juego público!
    remote:FireServer(colorRojo)
    print("¡Remote disparado con éxito!")
else
    print("gracias por ver la consola, intentare hacer mas cosas!")
end
