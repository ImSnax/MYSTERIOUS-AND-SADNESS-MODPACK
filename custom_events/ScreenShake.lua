function onEvent(n,v1,v2)
    if n == 'ScreenShake' then
if v1 == 'on' then
cameraShake('camHUD',v2,90000)
cameraShake('camGame',v2,90000)
end
if v1 == 'off' then
cameraShake('camHUD',0.01,0.0001)
cameraShake('camGame',0.01,0.00001)
end
end
end