function onCreate()
    makeLuaSprite('bg', 'stages/comedyStage/bg', -500, -200);
    scaleObject('bg', 1.3, 1.3);
    
    makeAnimatedLuaSprite('friends', 'stages/comedyStage/friends', -200, -650)
    scaleObject('friends', 0.85, 0.85)
    addAnimationByPrefix('friends', 'idle', 'friends idle', 15, true)
    playAnim('friends', 'idle', true)
    
    addLuaSprite('bg', false);
    addLuaSprite('friends', false)
end