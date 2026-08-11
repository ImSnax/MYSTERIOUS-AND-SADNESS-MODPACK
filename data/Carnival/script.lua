local allowCountdown = false
function onStartCountdown()
	if not allowCountdown and isStoryMode and not seenCutscene then --Block the first countdown
		startVideo('D-week1');
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end

function onSpawnNote(id, data, type, isSustainNote, strumTime)
    if strumTime < stepCrochet then
        setPropertyFromGroup('notes', id, 'visible', false)
        setPropertyFromGroup('notes', id, 'noteSplashDisabled', true)
    end
end
function goodNoteHit(id, noteData, noteType, isSustainNote)
    local strumTime = getPropertyFromGroup('notes', id, 'strumTime')
    if strumTime < stepCrochet then
        callMethod('playerStrums.members[' .. noteData .. '].animation.play', {'static', true})
    end
end

function opponentNoteHit(id, noteData, noteType, isSustainNote)
    local strumTime = getPropertyFromGroup('notes', id, 'strumTime')
    if strumTime < stepCrochet then
        callMethod('opponentStrums.members[' .. noteData .. '].animation.play', {'static', true})
    end
end