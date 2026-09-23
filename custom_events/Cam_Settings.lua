function onEvent(name, value1, value2)
    if name == "Cam_Settings" then
        
        if value1 ~= '' then
            local newZoom = tonumber(value1)
            if newZoom ~= nil then
                setProperty('defaultCamZoom', newZoom)
            end
        end

        if value2 ~= '' then
            local newSpeed = tonumber(value2)
            if newSpeed ~= nil then
                setProperty('cameraSpeed', newSpeed)
            end
        end
        
    end
end