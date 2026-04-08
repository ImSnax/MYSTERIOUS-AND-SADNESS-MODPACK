function onEvent(name, value1, value2)
	if name == "Flashing Camera" then
		cameraFlash('camGame',value1,value2,true)
	end
end

function onTimerCompleted(tag)
if tag == 'FlashCamStart' then
setProperty('FlashCam.alpha',0.7)
doTweenAlpha('endFlashCam','FlashCam',0,time - 0.1,'linear')
end
end
