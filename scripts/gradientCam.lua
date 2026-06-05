function onCreate()
    makeLuaSprite('gt','gradient')
    setObjectCamera('gt','camHUD')
    addLuaSprite('gt', true)
    setProperty('gt.alpha', 0)
end

function efecto()
    setProperty('gt.alpha', 1)
    doTweenAlpha('bye','gt',0,0.3,'linear')
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
    efecto()
end

function opponentNoteHit(id, noteData, noteType, isSustainNote)
    efecto()
end
