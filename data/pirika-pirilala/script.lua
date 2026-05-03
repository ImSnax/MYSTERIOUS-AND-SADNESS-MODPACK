local allowCountdown = false
function onStartCountdown()
	if not allowCountdown and isStoryMode and not seenCutscene then --Block the first countdown
		startVideo('D-week2');
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end

local allowCountdown = false
function onEndSong()
	if not allowCountdown and isStoryMode and not seenCutscene then --Block the first countdown
		startVideo('D-week3');
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end
