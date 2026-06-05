function onEvent(eventName, value1, value2)
    if eventName == "Apple Filter" then
        if string.lower(value1) == 'on' then
            if luaSpriteExists("touhouBG") then
                print("DO NOT BAD APPLE TWICE!!");
                return;
            end
            if shadersEnabled and not lowQuality then runHaxeCode([[game.camGame.setFilters([new ShaderFilter(getVar("glowfnf")), new ShaderFilter(getVar("pibbyFNF")), new ShaderFilter(getVar("chromFNF"))]);]]) end --xd
            --if shadersEnabled and not lowQuality then runHaxeCode([[game.camGame.pushFilter("glow",new ShaderFilter(gane.getLuaObject("glowfnf", false).shader));]]) end --xd
            if string.lower(value2) == 'black' then
                makeLuaSprite("touhouBG", "", -screenWidth * getProperty("camGame.zoom"), -screenHeight * getProperty("camGame.zoom"))
                makeGraphic("touhouBG", screenWidth * 3, screenHeight * 3, "000000")
                setProperty("boyfriend.colorTransform.blueOffset", 255)
                setProperty("boyfriend.colorTransform.redOffset", 255)
                setProperty("boyfriend.colorTransform.greenOffset", 255)
                setProperty("dad.colorTransform.blueOffset", 255)
                setProperty("dad.colorTransform.redOffset", 255)
                setProperty("dad.colorTransform.greenOffset", 255)
                if getProperty("gf") ~= nil then
                    setProperty("gf.colorTransform.blueOffset", 255)
                    setProperty("gf.colorTransform.redOffset", 255)
                    setProperty("gf.colorTransform.greenOffset", 255)
                end
                setScrollFactor("touhouBG")
                addLuaSprite("touhouBG")
                setObjectOrder("touhouBG", getObjectOrder("gfGroup") -1)
            else
                makeLuaSprite("touhouBG", "", -screenWidth * getProperty("camGame.zoom"), -screenHeight * getProperty("camGame.zoom"))
                makeGraphic("touhouBG", screenWidth * 3, screenHeight * 3, "FFFFFF")
                setProperty("boyfriend.color", getColorFromHex("000000"))
                setProperty("dad.color", getColorFromHex("000000"))
                if getProperty("gf") ~= nil then setProperty("gf.color", getColorFromHex("000000")) end
                setScrollFactor("touhouBG")
                addLuaSprite("touhouBG")
                setObjectOrder("touhouBG", getObjectOrder("gfGroup") -1)
            end
        else
            if not luaSpriteExists("touhouBG") then return; end -- ficks
            --isAppleLOL = false;
            if shadersEnabled and not lowQuality then runHaxeCode([[game.camGame.setFilters([new ShaderFilter(getVar("pibbyFNF")), new ShaderFilter(getVar("chromFNF"))]);]]) end --xd
            --if shadersEnabled and not lowQuality then runHaxeCode([[game.camGame.removeFilter("glow");]]) end --xd
            setProperty("touhouBG.alpha", 0)
            removeLuaSprite("touhouBG", true)
            runHaxeCode([[game.reloadHealthBarColors();]])
            setProperty("boyfriend.colorTransform.blueOffset", 0)
            setProperty("boyfriend.colorTransform.redOffset", 0)
            setProperty("boyfriend.colorTransform.greenOffset", 0)
            setProperty("dad.colorTransform.blueOffset", 0)
            setProperty("dad.colorTransform.redOffset", 0)
            setProperty("dad.colorTransform.greenOffset", 0)
            if getProperty("gf") ~= nil then
                setProperty("gf.colorTransform.blueOffset", 0)
                setProperty("gf.colorTransform.redOffset", 0)
                setProperty("gf.colorTransform.greenOffset", 0)
            end
            setProperty("boyfriend.color", getColorFromHex("FFFFFF"))
            setProperty("dad.color", getColorFromHex("FFFFFF"))
            if getProperty("gf") ~= nil then
                setProperty("gf.color", getColorFromHex("FFFFFF"))
            end
        end
    end
end