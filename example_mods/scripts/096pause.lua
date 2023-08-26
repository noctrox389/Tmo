local yes = false
function onPause()
	if getRandomInt(1,5) == getRandomInt(1,5) then
		makeLuaSprite('069', 'mountains', 0, 0)
		setObjectCamera('069', 'other')
		scaleObject('069', 3, 3)
		screenCenter('069', xy)
		addLuaSprite('069', true)
		musicFadeOut(0.2, 0.1)
		playSound('spotsound', 1)
		yes = true
		doTweenAlpha('069Aloha', '069', 0, 1, 'backIn')
	end
	if yes then
		return Function_Stop
	end
end

function onTweenCompleted(tag)
	if tag == '069Aloha' then
		musicFadeOut(1, 1)
		yes = false
	end
end