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
    else
        runHaxeCode(
            [[
                game.healthBarBG.loadGraphic(Paths.image("]]..healthImage..[["));
                game.healthBarBG.offset.set(50,6);
                game.remove(game.healthBarBG);
                game.insert(game.members.indexOf(game.healthBar)+1,game.healthBarBG);
                game.healthBarBG.antialiasing = ]]..tostring(barAntialiasing)..[[;
                return;
            ]]
        )
    end
end