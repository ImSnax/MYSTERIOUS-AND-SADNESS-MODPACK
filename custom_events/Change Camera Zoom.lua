function onEvent(name, value1, value2)
    if name == 'Change Camera Zoom' then
        local targetZoom = tonumber(value1)
        local duration = tonumber(value2) or 0

        if targetZoom ~= nil then
            if duration > 0 then
                doTweenZoom('camGameZoomTween', 'camGame', targetZoom, duration, 'quadOut')
                setProperty('defaultCamZoom', targetZoom)
            else
                setProperty('defaultCamZoom', targetZoom)
                setProperty('camGame.zoom', targetZoom)
            end
        end
    end
end