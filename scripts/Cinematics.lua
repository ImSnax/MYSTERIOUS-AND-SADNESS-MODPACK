local configuracionVideos = {
    ['carnival'] = {
        inicio = 'D-week1', 
        final = ''
    },
}

local videoInicioJugado = false
local videoFinalJugado = false

function onStartCountdown()
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
    local song = string.lower(songName)
    
    if configuracionVideos[song] and configuracionVideos[song].final ~= '' and not videoFinalJugado then
        startVideo(configuracionVideos[song].final)
        videoFinalJugado = true
        return Function_Stop 
    end
    return Function_Continue
end

-- Instrucciones para poner una cinematica:         _Poner el nombre de la canción en minúscula.                                        _Dejar en blanco si no hay una cinematica al inicio o al final
