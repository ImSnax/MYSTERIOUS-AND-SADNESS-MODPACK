function onCreate()
    makeLuaSprite('blackScreen', '', 0, 0)
    makeGraphic('blackScreen', screenWidth, screenHeight, '000000')

    setObjectCamera('blackScreen', 'hud')
    setObjectOrder('blackScreen', getObjectOrder('healthBar') - 1)

    setProperty('blackScreen.alpha', 0)
    addLuaSprite('blackScreen', true)
end

function onEvent(name, value1, value2)
    if name == 'Black Screen' then
        local mode = value1
        local speed = 0
        local commaIndex = string.find(value1, ",")
        if commaIndex ~= nil then
            mode = string.sub(value1, 1, commaIndex - 1)
            speed = tonumber(string.sub(value1, commaIndex + 1)) or 0
        end
        
        mode = string.gsub(mode, "^%s*(.-)%s*$", "%1")

        if value2 == 'other' then
            setObjectCamera('blackScreen', 'other')
            setObjectOrder('blackScreen', 0)
        else
            setObjectCamera('blackScreen', 'hud')
            setObjectOrder('blackScreen', getObjectOrder('healthBar') - 1)
        end

        if mode == 'on' then
            if speed > 0 then
                doTweenAlpha('blackFadeIn', 'blackScreen', 1, speed, 'linear')
            else
                setProperty('blackScreen.alpha', 1)
            end
        elseif mode == 'off' or mode == '' then
            if speed > 0 then
                doTweenAlpha('blackFadeOut', 'blackScreen', 0, speed, 'linear')
            else
                setProperty('blackScreen.alpha', 0)
            end
        end
    end
end