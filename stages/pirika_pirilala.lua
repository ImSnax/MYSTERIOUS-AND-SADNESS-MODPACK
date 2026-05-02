function onCreate()
	makeLuaSprite('bg', 'pirika_pirilalaStage/bg', -1200, -900);
	setLuaSpriteScrollFactor('bg', 1.3, 1.3);
	scaleObject('bg', 4, 4);
	
	makeLuaSprite('rocas2', 'pirika_pirilalaStage/rocas2', 900, -50);
	setLuaSpriteScrollFactor('rocas2', 1.2, 1.2);
	scaleObject('rocas2', 1.7, 1.7);
	
	makeLuaSprite('rocas1', 'pirika_pirilalaStage/rocas1', -450, -250);
	setLuaSpriteScrollFactor('rocas1', 1.1, 1.1);
	scaleObject('rocas1', 2.3, 2.3);
	
	makeLuaSprite('suelo', 'pirika_pirilalaStage/suelo', -900, -850);
	scaleObject('suelo', 3.4, 3.4);
	
	addLuaSprite('bg', false);
	addLuaSprite('rocas2', false)
	addLuaSprite('rocas1', false)
	addLuaSprite('suelo', false)
end