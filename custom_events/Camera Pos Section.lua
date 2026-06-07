local endStep = -1

function onEvent(name, value1, value2)
    if name == 'Camera Pos Section' then
        
        if value1 ~= '' and value2 ~= '' then
            local camX = tonumber(value1)
            local camY = tonumber(value2)
            
            setProperty('isCameraOnForcedPos', true)
            
            setProperty('camFollow.x', camX)
            setProperty('camFollow.y', camY)
            
            endStep = curStep + 16
        end
    end
end

function onStepHit()
    if curStep == endStep then
        setProperty('isCameraOnForcedPos', false)
        
        endStep = -1
    end
end