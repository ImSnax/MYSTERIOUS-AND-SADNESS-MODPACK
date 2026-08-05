function onCreate()
    makeLuaSprite('blackScreen', '', 0, 0)
    makeGraphic('blackScreen', screenWidth, screenHeight, '000000')

    setObjectCamera('blackScreen', 'hud')
    setObjectOrder('blackScreen', getObjectOrder('healthBar') - 1)

    setProperty('blackScreen.alpha', 0)
    addLuaSprite('blackScreen', true)
end

function onEvent(name, value1, value2)
    if name == 'Black flash' then
        local mode = value1
        local speed = tonumber(value2) or 0

        if mode == 'on' then
            if speed > 0 then
                doTweenAlpha('blackFadeIn', 'blackScreen', 1, speed, 'linear')
            else
                setProperty('blackScreen.alpha', 1)
            end
        end

        if mode == 'off' or mode == '' then
            if speed > 0 then
                doTweenAlpha('blackFadeOut', 'blackScreen', 0, speed, 'linear')
            else
                setProperty('blackScreen.alpha', 0)
            end
        end
    end
end