local doremiSwinging = false
local swingTime = 0

function onCreate()

    makeLuaSprite('night', 'stages/misoraStage/night', -920, -520);
    scaleObject('night', 1.2, 1.2);
    
    makeLuaSprite('day', 'stages/misoraStage/day', -920, -520);
    scaleObject('day', 1.2, 1.2);
    
    makeLuaSprite('doremiDead', 'stages/misoraStage/doremiDead', 400, -790);
    scaleObject('doremiDead', 0.65, 0.65);
    setObjectCamera('doremiDead', 'other')
    
    makeLuaSprite('fb_1', 'stages/misoraStage/fb_1', -80, -50);
    scaleObject('fb_1', 2.38, 2.38)
    setProperty('fb_1.alpha', 0)
    
    makeLuaSprite('fb_2', 'stages/misoraStage/fb_2', -5, -70);
    scaleObject('fb_2', 3.4, 3.4)
    setProperty('fb_2.alpha', 0)
    
    makeLuaSprite('fb_3', 'stages/misoraStage/fb_3', -170, 0);
    scaleObject('fb_3', 4, 4)
    setProperty('fb_3.alpha', 0)
    
    makeLuaSprite('fb_4', 'stages/misoraStage/fb_4', -5, -200);
    scaleObject('fb_4', 3.2, 3.2)
    setProperty('fb_4.alpha', 0)
    
    addLuaSprite('night', false);
    addLuaSprite('day', false);
    addLuaSprite('doremiDead', true);
    addLuaSprite('fb_1', false);
    addLuaSprite('fb_2', false);
    addLuaSprite('fb_3', false);
    addLuaSprite('fb_4', false);

end

function onStepHit()
    if curStep == 442 then
        doTweenY('doremiFallTween', 'doremiDead', -230, 1.5, 'backIn')
  end
  
    if curStep == 480 then
        setProperty('doremiDead.visible', false)
    end    

    if curStep == 1016 then
        setProperty('healthBar.visible', false)
        setProperty('healthBarBG.visible', false)
        setProperty('iconP1.visible', false)
        setProperty('iconP2.visible', false)
        setProperty('Health.visible', false)
        setProperty('scoreTxt.visible', false)
        setProperty('camZoomingMult', 0);
    end
    
    if curStep == 1024 then
        setProperty('boyfriend.color', getColorFromHex('000000'))
        setProperty('gf.color', getColorFromHex('000000'))
        setProperty('dad.color', getColorFromHex('000000'))
        setProperty('day.colorTransform.redOffset', 255)
        setProperty('day.colorTransform.greenOffset', 255)
        setProperty('day.colorTransform.blueOffset', 255)
    end
    
    if curStep == 1040 then
        doTweenAlpha('fb_1', 'fb_1', 0.4, 1.5, 'linear')
        doTweenX('desl1', 'fb_1', -5, 6.7, 'linear')
    end
    
    if curStep == 1096 then
        doTweenAlpha('fb_1', 'fb_1', 0, 0.5, 'linear')
        doTweenAlpha('fb_2', 'fb_2', 0.4, 1.5, 'linear')
        doTweenX('desl2', 'fb_2', -135, 8, 'linear')
    end
    
    if curStep == 1160 then
        doTweenAlpha('fb_2', 'fb_2', 0, 0.5, 'linear')
        doTweenAlpha('fb_3', 'fb_3', 0.4, 1.5, 'linear')
        doTweenX('desl3', 'fb_3', -5, 8, 'linear')
    end
    
    if curStep == 1224 then
        doTweenAlpha('fb_3', 'fb_3', 0, 0.5, 'linear')
        doTweenAlpha('fb_4', 'fb_4', 0.4, 1.5, 'linear')
        doTweenX('desl4', 'fb_4', -105, 8, 'linear')
    end

    if curStep == 1314 then
        setProperty('healthBar.visible', true)
        setProperty('healthBarBG.visible', true)
        setProperty('iconP1.visible', true)
        setProperty('iconP2.visible', true)
        setProperty('Health.visible', true)
        setProperty('scoreTxt.visible', true)
        setProperty('day.visible', false)
        setProperty('fb_4.alpha', 0)
        setProperty('camZoomingMult', 1);
    end
    
        if curStep == 1328 then
        setProperty('boyfriend.color', getColorFromHex('FFFFFF'))
        setProperty('gf.color', getColorFromHex('FFFFFF'))
        setProperty('dad.color', getColorFromHex('FFFFFF'))
        setProperty('day.colorTransform.redOffset', 0)
        setProperty('day.colorTransform.greenOffset', 0)
        setProperty('day.colorTransform.blueOffset', 0)
    end

  function onTweenCompleted(tag)
    if tag == 'doremiFallTween' then
        doremiSwinging = true
    end
end

function onUpdate(elapsed)
    if doremiSwinging then
        swingTime = swingTime + elapsed
        setProperty('doremiDead.angle', math.sin(swingTime * 1.5) * 0.5)
    end
  end
end