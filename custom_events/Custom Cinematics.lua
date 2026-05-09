function onEvent(eventName, value1, value2)
    if eventName == "Custom Cinematics" then
        local val1 = tonumber(value1);
        local val2 = tonumber(value2);
        doTweenY("cinematicup", "cinematicup", -360 + val1, val2 / playbackRate, "cubeOut")
        doTweenY("cinematicdown", "cinematicdown", screenHeight - val1, val2 / playbackRate, "cubeOut")
    end
end