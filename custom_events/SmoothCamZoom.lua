local isZooming = false
local duration = 0
local targetZ = 1
local startZ = 1
local elapsedTimer = 0

function onEvent(name, value1, value2)
    if name == "SmoothCamZoom" then
        local val1 = tonumber(value1)
        local val2 = tonumber(value2)

        if val1 ~= nil then
            targetZ = val1
        else
            targetZ = getProperty('defaultCamZoom')
        end

        if val2 ~= nil and val2 > 0 then
            duration = val2
            startZ = getProperty('defaultCamZoom')
            elapsedTimer = 0
            isZooming = true
        else
            setProperty('defaultCamZoom', targetZ)
            isZooming = false
        end
    end
end

function onUpdate(elapsed)
    if isZooming then
        elapsedTimer = elapsedTimer + elapsed
        local progress = elapsedTimer / duration

        if progress >= 1 then
            progress = 1
            isZooming = false
        end

        local currentZoom = startZ + (targetZ - startZ) * progress
        setProperty('defaultCamZoom', currentZoom)
    end
end