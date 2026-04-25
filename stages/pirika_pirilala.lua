function onCreate()
	makeLuaSprite('BG_pirika_pirilala', 'pirika_pirilalaStage/BG_pirika_pirilala', -700, -440);
	setLuaSpriteScrollFactor('BG_pirika_pirilala', 1.2, 1.2);
	scaleObject('BG_pirika_pirilala', 3, 3);
	
	makeLuaSprite('escobas', 'pirika_pirilalaStage/escobas', -540, -240);
	scaleObject('escobas', 2.7, 2.7);
	
	addLuaSprite('BG_pirika_pirilala', false);
	addLuaSprite('escobas', false)
end