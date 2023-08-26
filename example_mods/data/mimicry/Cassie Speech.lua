local a = SISECHKI
local b = YAYCA

local text = ''     
local textEnabled = false
function onCreatePost()
	
		makeLuaText('a', 'C.A.S.S.I.E : ', 0, 10, 500)
		setTextFont('a', 'RobotoMono-Regular.ttf')
		setTextBorder('a', 0)
		setTextColor('a', '58a4ef')
		setTextSize('a', 24)
		setProperty('a.alpha', 0)
		setProperty('a.antialiasing', true)
		setObjectCamera('a', 'camOther')
		addLuaText('a')
		
		makeLuaText('b', oldText, 600, getProperty('a.x') + getProperty('a.width'), 500)
		setTextFont('b', 'RobotoMono-Regular.ttf')
		setTextAlignment('b', 'left')
		setTextBorder('b', 0)
		setTextSize('b', 24)
		setProperty('b.alpha', 0)
		setProperty('b.antialiasing', true)
		setObjectCamera('b', 'camOther')
		addLuaText('b')
end

function onEvent(n, val1, val2)
	if n == 'Cassie Speech' then
		doTweenAlpha('sexyTween1', 'a', 1, 0.25)
		doTweenAlpha('sexyTween2', 'b', 1, 0.25)
		if val2 == 'true' then
			text = ''
		end
		text = text..' '..val1
		setTextString('b', text)
		runTimer('wait', 4)
	end
end

function onTimerCompleted(tag)
	if tag == 'wait' then
		doTweenAlpha('sexyTween1', 'a', 0, 0.25)
		doTweenAlpha('sexyTween2', 'b', 0, 0.25)
	end
end