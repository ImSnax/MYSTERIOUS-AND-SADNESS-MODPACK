function onCreatePost()
if not hideHud then
	makeLuaSprite('Health', 'healthBarMS')
	setObjectCamera('Health', 'hud')
	scaleObject('Health', 1.017, 1.8)
	addLuaSprite('Health', true)
	setObjectOrder('Health', getObjectOrder('healthBar') + 1)
	setProperty('healthBar.visible', true)
end
end

function onUpdatePost(elapsed)
	setProperty('Health.x', getProperty('healthBar.x') - 56)
	setProperty('Health.y', getProperty('healthBar.y') - 26)
end