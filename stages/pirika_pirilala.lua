function onCreate()
	makeLuaSprite('bg', 'stages/pirika_pirilalaStage/bg', -1200, -900);
	setLuaSpriteScrollFactor('bg', 0.2, 0.2);
	scaleObject('bg', 4, 4);
	
	makeLuaSprite('rocas2', 'stages/pirika_pirilalaStage/rocas2', 900, -50);
	setLuaSpriteScrollFactor('rocas2', 0.45, 0.45);
	scaleObject('rocas2', 1.7, 1.7);
	
	makeLuaSprite('rocas1', 'stages/pirika_pirilalaStage/rocas1', -450, -250);
	setLuaSpriteScrollFactor('rocas1', 0.75, 0.75);
	scaleObject('rocas1', 2.3, 2.3);
	
	makeLuaSprite('suelo', 'stages/pirika_pirilalaStage/suelo', -900, -800);
	scaleObject('suelo', 3.4, 3.4);
	
	addLuaSprite('bg', false);
	addLuaSprite('rocas2', false)
	addLuaSprite('rocas1', false)
	addLuaSprite('suelo', false)
end
