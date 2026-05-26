local allowCountdown = false

function onStartCountdown()
    if not allowCountdown and not seenCutscene then
        startVideo('week2_1')
        allowCountdown = true
        return Function_Stop
    end
    return Function_Continue
end

function onCreate()

    setProperty('skipCountdown', true)
    
    makeLuaSprite('logo', '5kidsStage/4kids', 0, 0) 
    setObjectCamera('logo', 'other')
    addLuaSprite('logo', true)
    scaleObject('logo', 0.2, 0.2)

    if downscroll then
        setProperty('logo.y', 40) 
    else
        setProperty('logo.y', 610)
    end

    setProperty('logo.x', screenWidth / 1.035 - getProperty('logo.width') / 1.035)
end