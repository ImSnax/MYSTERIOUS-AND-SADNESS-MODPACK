local stepParaQuitar = -1

function onCreate()
    makeLuaSprite('eventoPantallaNegra', '', -1000, -1000)
    makeGraphic('eventoPantallaNegra', 4000, 4000, '000000')
    
    setScrollFactor('eventoPantallaNegra', 0, 0)
    
    setObjectCamera('eventoPantallaNegra', 'game')
    
    setProperty('eventoPantallaNegra.alpha', 0)
    
    addLuaSprite('eventoPantallaNegra', true)
end

function onEvent(name, value1, value2)
    if value1 == 'Black Screen' then
        setProperty('eventoPantallaNegra.alpha', 1)
        
        local duracionSteps = tonumber(value2)
        
        if duracionSteps == nil or duracionSteps <= 0 then
            duracionSteps = 16
        end
        
        stepParaQuitar = curStep + duracionSteps
    end
end

function onStepHit()
    if stepParaQuitar ~= -1 and curStep >= stepParaQuitar then
        setProperty('eventoPantallaNegra.alpha', 0) 
        stepParaQuitar = -1 
    end
end
