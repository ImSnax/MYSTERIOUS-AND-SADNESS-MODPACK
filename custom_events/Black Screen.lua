local function trim(s)
    return s and s:match("^%s*(.-)%s*$") or ""
end

function onCreate()
    makeLuaSprite('blackScreenEv', '', -600, -600)
    makeGraphic('blackScreenEv', 2500, 2500, '000000')
    setScrollFactor('blackScreenEv', 0, 0)
    setProperty('blackScreenEv.alpha', 0)
    addLuaSprite('blackScreenEv', true)
end

function onEvent(name, value1, value2)
    if name == 'Black Screen' then
        local params = stringSplit(value1, ',')
        local mode = string.lower(trim(params[1] or 'off'))
        local duration = tonumber(trim(params[2] or '0')) or 0

        local camTarget = string.lower(trim(value2 or 'game'))
        if camTarget ~= 'hud' and camTarget ~= 'game' then
            camTarget = 'game'
        end

        setObjectCamera('blackScreenEv', camTarget)

        local targetAlpha = (mode == 'on' or mode == '1' or mode == 'true') and 1 or 0

        cancelTween('blackScreenTween')

        if duration > 0 then
            doTweenAlpha('blackScreenTween', 'blackScreenEv', targetAlpha, duration, 'linear')
        else
            setProperty('blackScreenEv.alpha', targetAlpha)
        end
    end
end
