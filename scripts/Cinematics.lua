local configuracionVideos = {
    ['carnival'] = {
        inicio = 'D-week1', 
        final = ''
    },
}

local videoInicioJugado = false
local videoFinalJugado = false

function onStartCountdown()
    if not isStoryMode then
        return Function_Continue
    end

    local song = string.lower(songName)
    
    if configuracionVideos[song] and configuracionVideos[song].inicio ~= '' and not videoInicioJugado then
        if not seenCutscene then
            startVideo(configuracionVideos[song].inicio)
            videoInicioJugado = true
            return Function_Stop
        end
    end
    return Function_Continue
end

function onEndSong()
    if not isStoryMode then
        return Function_Continue
    end

    local song = string.lower(songName)
    
    if configuracionVideos[song] and configuracionVideos[song].final ~= '' and not videoFinalJugado then
        makeLuaSprite('pantallaNegraFinal', '', 0, 0)
        makeGraphic('pantallaNegraFinal', screenWidth, screenHeight, '000000')
        setObjectCamera('pantallaNegraFinal', 'other')
        addLuaSprite('pantallaNegraFinal', true)
        
        startVideo(configuracionVideos[song].final)
        videoFinalJugado = true
        return Function_Stop 
    end
    return Function_Continue
end