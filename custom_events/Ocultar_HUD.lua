function onEvent(name, value1, value2)
    if name == 'Ocultar_HUD' then 
        
        if value1 ~= '' then
            local hideSpeed = tonumber(value1)
            if hideSpeed ~= nil then
                if hideSpeed > 0 then
                    doTweenAlpha('esconderHUD', 'camHUD', 0, hideSpeed, 'linear')
                else
                    setProperty('camHUD.alpha', 0) 
                end
            end
        end

        if value2 ~= '' then
            local showSpeed = tonumber(value2)
            if showSpeed ~= nil then
                if showSpeed > 0 then
                    doTweenAlpha('mostrarHUD', 'camHUD', 1, showSpeed, 'linear')
                else
                    setProperty('camHUD.alpha', 1) 
                end
            end
        end
        
    end
end
