function onCreatePost()
    setProperty('dad.alpha', 0)
    setProperty('boyfriend.alpha', 0)
    setProperty('iconP2.alpha', 0)
end

function onStepHit()
    if curStep == 112 then
        doTweenAlpha('aparecerEnemigo', 'dad', 1, 1.5, 'linear')
        doTweenAlpha('aparecerIcono', 'iconP2', 1, 1.5, 'linear')
    end
end