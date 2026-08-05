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
end