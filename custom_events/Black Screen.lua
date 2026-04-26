local hideStep = -1

function onCreate()
    makeLuaSprite('pantallaOscura', '', -500, -500)
    makeGraphic('pantallaOscura', 3000, 2000, '000000')
    
    setObjectCamera('pantallaOscura', 'other')
    
    setProperty('pantallaOscura.alpha', 0)
    addLuaSprite('pantallaOscura', true)
end

function onEvent(name, value1, value2)
    if value1 == 'Black Screen' then
        setProperty('pantallaOscura.alpha', 1)
        
        local stepsDuracion = tonumber(value2)
        if stepsDuracion ~= nil and stepsDuracion > 0 then
            hideStep = curStep + stepsDuracion
        end
    end
end

function onStepHit()
    if curStep == hideStep then
        setProperty('pantallaOscura.alpha', 0)
        hideStep = -1
    end
end
