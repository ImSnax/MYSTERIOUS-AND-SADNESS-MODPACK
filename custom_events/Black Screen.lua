function onCreate()
    makeLuaSprite('blackOverlay', '', -1000, -1000)
    makeGraphic('blackOverlay', 4000, 4000, '000000')
    
    setObjectCamera('blackOverlay', 'game')
    setScrollFactor('blackOverlay', 0, 0)
    
    setProperty('blackOverlay.alpha', 0)
    
    addLuaSprite('blackOverlay', true)
end

function onEvent(name, value1, value2)
    if name == 'Black Screen' then
        
        local estado = string.lower(value1)
        local duracion = tonumber(value2)
        if duracion == nil then
            duracion = 0 
        end
        
        local targetAlpha = 0
        if estado == 'on' then
            targetAlpha = 1
        elseif estado == 'off' then
            targetAlpha = 0
        end
        
        if duracion > 0 then
            doTweenAlpha('fadeNegroTween', 'blackOverlay', targetAlpha, duracion, 'linear')
        else
            setProperty('blackOverlay.alpha', targetAlpha)
        end
    end
end