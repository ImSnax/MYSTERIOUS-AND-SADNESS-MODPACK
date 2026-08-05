local isSwinging = false
local swingTime = 0
local swingIntensity = 2.5
local swingSpeed = 2

function onCreate()

    makeLuaSprite('night', 'misoraStage/night', -910, -500);
    scaleObject('night', 2.2, 2.2);
    
    makeLuaSprite('day', 'misoraStage/day', -910, -500);
    scaleObject('day', 2.2, 2.2);
    
    makeLuaSprite('doremiDead', 'misoraStage/doremiDead', 400, -790);
    scaleObject('doremiDead', 0.65, 0.65);
    setObjectCamera('doremiDead', 'other')
    
    makeLuaSprite('fb_1', 'misoraStage/fb_1', -165, 0);
    scaleObject('fb_1', 2.5, 1.95)
    setProperty('fb_1.alpha', 0)
    
    makeLuaSprite('fb_2', 'misoraStage/fb_2', -5, -70);
    scaleObject('fb_2', 3.4, 3.2)
    setProperty('fb_2.alpha', 0)
    
    makeLuaSprite('fb_3', 'misoraStage/fb_3', -170, 0);
    scaleObject('fb_3', 4, 4)
    setProperty('fb_3.alpha', 0)
    
    makeLuaSprite('fb_4', 'misoraStage/fb_4', -5, -200);
    scaleObject('fb_4', 3.2, 3.1)
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
        setProperty('doremiDead.x', 400)
        setProperty('doremiDead.y', -790)
        local anchoReal = getProperty('doremiDead.frameWidth')
        setProperty('doremiDead.origin.x', anchoReal / 2)
        setProperty('doremiDead.origin.y', 0)
        doTweenY('caidaDoremi', 'doremiDead', -30, 0.5, 'backOut')
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
        doTweenAlpha('fadeIn', 'fb_1', 0.4, 1.5, 'linear')
        doTweenX('deslizX', 'fb_1', -5, 8, 'linear')
    end
    
    if curStep == 1096 then
        doTweenAlpha('fadeIn', 'fb_1', 0, 1, 'linear')
        doTweenAlpha('fadeIn2', 'fb_2', 0.4, 1.5, 'linear')
        doTweenX('deslizX', 'fb_2', -135, 8, 'linear')
    end
    
    if curStep == 1160 then
        doTweenAlpha('fadeIn2', 'fb_2', 0, 1, 'linear')
        doTweenAlpha('fadeIn3', 'fb_3', 0.4, 1.5, 'linear')
        doTweenX('deslizX', 'fb_3', -5, 8, 'linear')
    end
    
    if curStep == 1224 then
        doTweenAlpha('fadeIn3', 'fb_3', 0, 1, 'linear')
        doTweenAlpha('fadeIn4', 'fb_4', 0.4, 1.5, 'linear')
        doTweenX('deslizX', 'fb_4', -105, 8, 'linear')
    end

    if curStep == 1314 then
        setProperty('healthBar.visible', true)
        setProperty('healthBarBG.visible', true)
        setProperty('iconP1.visible', true)
        setProperty('iconP2.visible', true)
        setProperty('Health.visible', true)
        setProperty('scoreTxt.visible', true)
        setProperty('day.visible', false)
        initLuaShader('night')
        setSpriteShader('dad', 'night')
        setSpriteShader('boyfriend', 'night')
        setSpriteShader('gf', 'night')
        setProperty('fb_4.alpha', 0)
        initLuaShader('night')
        setSpriteShader('dad', 'night')
        setSpriteShader('boyfriend', 'night')
        setSpriteShader('gf', 'night')
    end
    
        if curStep == 1328 then
        setProperty('boyfriend.color', getColorFromHex('FFFFFF'))
        setProperty('gf.color', getColorFromHex('FFFFFF'))
        setProperty('dad.color', getColorFromHex('FFFFFF'))
        setProperty('day.colorTransform.redOffset', 0)
        setProperty('day.colorTransform.greenOffset', 0)
        setProperty('day.colorTransform.blueOffset', 0)
    end
end

function onTweenCompleted(tag)
    if tag == 'caidaDoremi' then
        setProperty('doremiDead.x', 400)
        setProperty('doremiDead.y', -30)
        
        isSwinging = true
    end
end

function onUpdate(elapsed)
    if isSwinging then
        swingTime = swingTime + elapsed
        
        setProperty('doremiDead.x', 400)
        setProperty('doremiDead.y', -30)
        
        local anguloActual = math.sin(swingTime * swingSpeed) * swingIntensity
        setProperty('doremiDead.angle', anguloActual)
        
        if swingIntensity > 0.5 then
            swingIntensity = swingIntensity - (elapsed * 1.5)
        end
    end
end
