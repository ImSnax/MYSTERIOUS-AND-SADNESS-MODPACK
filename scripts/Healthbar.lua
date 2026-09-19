    local healthImage = 'healthBarMS'
    local barAntialiasing = true
    local offsetX = 50
    local offsetY = 10
function onCreatePost()
    if curStage == 'brokenStage' then
        healthImage = 'healthBarBL'
        barAntialiasing = true
        offsetX = 52
        offsetY = 30
    elseif curStage == 'darkmagicStage' then
        healthImage = 'healthBarDM'
        barAntialiasing = true
        offsetX = 48  
        offsetY = 30      
    end
    if version >= '0.7' then
        runHaxeCode([[
            game.healthBar.bg.loadGraphic(Paths.image(']]..healthImage..[['));
            game.healthBar.bg.antialiasing = ]]..tostring(barAntialiasing)..[[;
            game.healthBar.bg.offset.set(]]..offsetX..[[, ]]..offsetY..[[);
            return;
            ]]
        )
end
   for i = 0, getProperty('unspawnNotes.length') - 1 do
        setPropertyFromGroup('unspawnNotes', i, 'noteSplashData.useRGBShader', false)     
    end
end

function onEvent(name, value1, value2)
    if name == 'Change Character' then
        runTimer('forceIconUpdate', 0.05)
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'forceIconUpdate' then
        local currentHealth = getProperty('health')

        setProperty('health', currentHealth + 0.0001)
        setProperty('health', currentHealth)
    end
end