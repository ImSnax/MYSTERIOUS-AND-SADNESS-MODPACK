function onEvent(n,v1,v2)


	if n == 'Black flash' then

	   makeLuaSprite('flashblack', '', 0, 0);
        makeGraphic('flashblack',1920,1080,'000000')
	      addLuaSprite('flashblack', true);
	      setLuaSpriteScrollFactor('flashblack',0,0)
              setObjectCamera('flashblack', 'other')
	      setProperty('flashblack.scale.x',2)
	      setProperty('flashblack.scale.y',2)
	      setProperty('flashblack.alpha',0)
		setProperty('flashblack.alpha',1)
		doTweenAlpha('flTw','flashblack',0,v1,'linear')
	end



end