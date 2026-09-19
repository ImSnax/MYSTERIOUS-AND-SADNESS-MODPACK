local cameraPositions = {
    default = {x = nil,y = nil},
    all = {x = nil, y = nil}, -- if not nil, the camFollow will always by this value.
    dad = {x = nil,y = nil},
    boyfriend = {x = nil,y = nil},
    gf = {x = nil, y = nil}

}
function onCreatePost()
    if version <= '0.6' then
        cam = 'camFollowPos'
        setProperty(cam..'.x',detectMiddleX('dad','boyfriend') - 600)
        setProperty(cam..'.y',detectMiddleY('dad','boyfriend') - 300)
    else
        setProperty('camGame.scroll.x',detectMiddleX('dad','boyfriend') - 300)
        setProperty('camGame.scroll.y',detectMiddleY('dad','boyfriend') - 300)
    end
end

function getCharX(character,isPlayer)
    if cameraPositions[character] == nil or cameraPositions[character] ~= nil and cameraPositions[character].x == nil then
        local offset = 0
        if isPlayer == nil then
            isPlayer = (character == 'boyfriend')
        end
        if character == 'dad' then
            offset = getProperty('opponentCameraOffset[0]')
        elseif character == 'gf' then
            offset = offset - 150 + getProperty('girlfriendCameraOffset[0]')
        elseif character == 'boyfriend' then
            offset = offset + getProperty('boyfriendCameraOffset[0]')
        end
        if isPlayer then
            offset = offset - 100 - getProperty(character..'.cameraPosition[0]')
        else
            offset = offset + 150  + getProperty(character..'.cameraPosition[0]')
        end
        local x = getMidpointX(character) + offset
        return x
    else
        return cameraPositions[character].x
    end
end

function getCharY(character)
    if cameraPositions[character] == nil or cameraPositions[character] ~= nil and cameraPositions[character].y == nil then
        local offset = 0
    
        if character == 'gf' then
            offset = getProperty('girlfriendCameraOffset[1]')
        else
            offset = -100
            if character == 'dad' then
                offset = offset + getProperty('opponentCameraOffset[1]')
            elseif character == 'boyfriend' then
                offset = offset + getProperty('boyfriendCameraOffset[1]')
            end
        end

        return getMidpointY(character) + getProperty(character..'.cameraPosition[1]') + offset
    else
        return cameraPositions[character].y
    end
end

function detectMiddleX(character1,character2)
    return getCharX(character1) + ((getCharX(character2) - getCharX(character1))/2)
end
function detectMiddleY(character1,character2)
    return getCharY(character1) + ((getCharY(character2) - getCharY(character1))/2)
end