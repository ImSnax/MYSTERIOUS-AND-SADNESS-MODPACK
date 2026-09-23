function onCreate()
    makeLuaSprite('tienda', 'stages/5kidsStage/tienda', -450, -325);
    scaleObject('tienda', 3, 3);
    
    makeLuaSprite('ns', 'stages/5kidsStage/ns', 0, 0);
    setObjectCamera('ns', 'hud')
    
    addLuaSprite('tienda', false);
    addLuaSprite('ns', true);
end
