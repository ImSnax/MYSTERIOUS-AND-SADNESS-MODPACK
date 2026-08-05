function onCreate()
    makeLuaSprite('tienda', '5kidsStage/tienda', -450, -325);
    scaleObject('tienda', 3, 3);
    
    makeLuaSprite('ns', '5kidsStage/ns', 0, 0);
    setObjectCamera('ns', 'hud')
    
    addLuaSprite('tienda', false);
    addLuaSprite('ns', true);
end

local nsOrderFixed = false

function onUpdatePost(elapsed)
    if not nsOrderFixed and luaSpriteExists('Health') then
        setObjectOrder('Health', getObjectOrder('ns') + 1)
        nsOrderFixed = true
    end
end
