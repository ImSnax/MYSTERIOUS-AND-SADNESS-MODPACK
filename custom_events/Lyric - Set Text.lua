local lyrictextsize = 34
local lyrictextyoffset = 50

function onCreate()
	lyricPos = 550
	if downscroll then
		lyricPos = 720-550
	end

	lyricfadetime = crochet/1500

	makeLuaText('lyrictext', '', 1000, (screenWidth/2)-(getTextWidth('lyrictext')/2), lyricPos)
	
	setProperty('lyrictext.antialiasing', true) 
	
	setTextBorder('lyrictext', 2, '000000')
	setTextColor('lyrictext', 'ffffff')
	setTextSize('lyrictext', lyrictextsize)
	setProperty('lyrictext.x', (screenWidth/2)-(getTextWidth('lyrictext')/2))
    setTextFont('lyrictext', 'tempus-sans-itc.ttf')
	setTextAlignment('lyrictext', 'center')
	addLuaText('lyrictext')
end

function onEvent(name, value1, value2)
	if name == 'Lyric - Set Text' then
		if value1 ~= '' then
			setProperty('lyrictext.y', getProperty('lyrictext.y') + lyrictextyoffset)
			setProperty('lyrictext.alpha', 0)
			doTweenY('lyricanim', 'lyrictext', lyricPos, lyricfadetime * 2, 'quadOut')
			doTweenAlpha('lyricanim2', 'lyrictext', 1, lyricfadetime * 2, 'quadOut')
			setTextString('lyrictext', value1)
		else
			doTweenY('lyricanim', 'lyrictext', getProperty('lyrictext.y') + lyrictextyoffset, lyricfadetime, 'quadIn')
			doTweenAlpha('lyricanim2', 'lyrictext', 0, lyricfadetime, 'quadIn')
		end
	end
end
