local lossHealth = 0.009
local flwIconP3 = false
function onBeatHit()
	if curBeat == 320 then
		setProperty('cameraSpeed', 0.1)
		triggerEvent('Camera Follow Pos', 500, 200)
		doTweenZoom('camerazoomtweenfunny', 'camGame', 0.8, 21)
	end
	if curBeat == 416 then
		cancelTween('camerazoomtweenfunny')
		doTweenX('cassierTweenX', 'cassier', 680, 1, 'quadOut')
		setProperty('cameraSpeed', 1)
		setProperty('defaultCamZoom', 0.66)
		triggerEvent('Camera Follow Pos', 780, 220)
		
		--icon приколы
		setProperty('iconP3.x', getProperty('iconP1.x') + 72)
		setProperty('iconP3.y', getProperty('iconP1.y') - 60)
		doTweenAlpha('icnP3AlTw', 'iconP3', healthBarAlpha, 0.6)
		doTweenX('icnP3XTw', 'iconP3', getProperty('iconP1.x') + 20, 0.3, 'quadOut')
		doTweenY('icnP3YTw', 'iconP3', getProperty('iconP1.y') - 60, 0.3, 'quadOut')
		doTweenX('icnP3XScaleTw', 'iconP3.scale', getProperty('iconP1.scale.x') - 0.5, 0.3, 'quadOut')
		doTweenY('icnP3YScaleTw', 'iconP3.scale', getProperty('iconP1.scale.y') - 0.5, 0.3, 'quadOut')
		setHealthBarColors(getIconColor('dad'), '394A4B')
	end
	if curBeat > 428 and not flwIconP3 and curBeat < 576 then
		setProperty('iconP3.alpha', 1)
		flwIconP3 = true
	end
	if curBeat == 448 then
		lossHealth = 0.48
	end
	if curBeat == 568 then
		lossHealth = 0.07
	end
	if curBeat == 576 then
		setProperty('cameraSpeed', 1)
		triggerEvent('Camera Follow Pos')
		doTweenX('cassierTweenX', 'cassier', 1980, 1, 'quadIn')
		
		flwIconP3 = false
		doTweenAngle('icnP3AngleTWN', 'iconP3', 200, 2.8, 'quadIn')
		setProperty('iconP3.velocity.y', -220)
		setProperty('iconP3.acceleration.y', 467)
		setHealthBarColors(getIconColor('dad'), getIconColor('boyfriend'))
	end
	if curBeat == 736 then
		local LOCALBOYX = getProperty('boyfriend.x')
		local LOCALBOYY = getProperty('boyfriend.y') + 140
		if not onlinePlay then
			setProperty('cutscene.visible', true)
			playAnim('cutscene', 'cutscene', true)
			setObjectOrder('cutscene', 4)
			setProperty('boyfriend.visible', false)
		end
		doTweenX('cameraEventX', 'camFollowPos', LOCALBOYX, 0.5, 'quadIn');
		doTweenY('cameraEventY', 'camFollowPos', LOCALBOYY, 0.5, 'quadIn');
		triggerEvent('Camera Follow Pos', LOCALBOYX, LOCALBOYY)
		doTweenZoom('cameraZoomZoom', 'camGame', 0.82, 0.6, 'quadIn')
		setProperty('defaultCamZoom', 0.8)
		doTweenAlpha('hudDisapearos', 'camHUD', 0, 2, 'quadIn')
	end
	if curBeat == 744 then
		setProperty('camGame.alpha', 0)
	end
end

function getIconColor(chr)
    local chr = chr or "boyfriend"
    return rgbToHex(getProperty(chr .. ".healthColorArray"))
end

function rgbToHex(array)
    return string.format('%.2x%.2x%.2x', array[1], array[2], array[3])
end

function opponentNoteHit(i, d, nt, s)
	if curBeat >= 320 and curBeat <= 576 then
		if not s then
			setHealth(getHealth() - lossHealth)
		end
	end
end

local anims = {'left', 'down', 'up', 'right'}
function goodNoteHit(i, d, nt, s)
	for i = 0,3 do
		if d == i then
			playAnim('cassier', anims[i+1], true)
		end
	end
end

function onCreate()
	makeAnimatedLuaSprite('cassier', 'characters/CASSIE', 0, 0)
	addAnimationByPrefix('cassier', 'idle', 'IDLE', 24, true)
	addAnimationByPrefix('cassier', 'left', 'LEFT', 24, true)
	addAnimationByPrefix('cassier', 'down', 'DOWN', 24, true)
	addAnimationByPrefix('cassier', 'up', 'IDLE', 24, true)
	addAnimationByPrefix('cassier', 'right', 'RIGHT', 24, true)
	scaleObject('cassier', 0.77, 0.77)
	setScrollFactor('cassier', 0.2, 0.2)
	addLuaSprite('cassier', true)
	
	makeAnimatedLuaSprite('cas', 'characters/cassie_extra', 0, 0)
	addAnimationByPrefix('cas', 'idle', 'cassie line', 24, true)
	scaleObject('cas', 0.77, 0.77)
	setScrollFactor('cas', 0.2, 0.2)
	addLuaSprite('cas', true)
end

function onCreatePost()
	setProperty('gfSpeed', 2)
	if buildTarget == 'browser' then
		loadSong('mimicry-browser')
	end
	precacheImage('characters/CASSIE')
	precacheImage('characters/cassie_extra')
	precacheImage('icon-cassie')
	precacheImage('atlases/particle_distruptor/spritemap')
	precacheImage('bf glowing')
	
	makeAnimatedLuaSprite('cutscene','atlases/particle_distruptor', getProperty('boyfriend.x') - 1550, getProperty('boyfriend.y') - 540,'tex')
	addAnimationByPrefix('cutscene','cutscene','cutscene',25,false)
	setProperty('cutscene.visible', false)

	setProperty('countdownReady.visible', false)
	setProperty('countdownSet.visible', false)
	setProperty('countdownGo.visible', false)
	
	if not hideHud then
		makeLuaSprite('iconP3', 'icon-cassie', getProperty('iconP1.x') + 20, getProperty('iconP1.y') - 60)
		setObjectCamera('iconP3', 'camHud')
		scaleObject('iconP3', 0.7, 0.7)
		setProperty('iconP3.alpha', 0)
		addLuaSprite('iconP3', true)
	end
	
    for i = 0, 3 do 
        setPropertyFromGroup("strumLineNotes", i, "x", -1000)
    end

    for i = 4, 7 do 
        if not middlescroll then
            setPropertyFromGroup("strumLineNotes", i, "x", screenWidth/2 + ((i % 4) * 112) - 230)
        end
    end
end

function onUpdatePost(el)
	if flwIconP3 then
		setProperty('iconP3.x', getProperty('iconP1.x') + 20)
		setProperty('iconP3.y', getProperty('iconP1.y') - 60)
		setProperty('iconP3.angle', getProperty('iconP1.angle'))
		setProperty('iconP3.scale.x', getProperty('iconP1.scale.x') - 0.5)
		setProperty('iconP3.scale.y', getProperty('iconP1.scale.y') - 0.5)
	end
end

local ctscnAnimName = 'cutscene.animation.curAnim.name'
local ctscnCurFrame = 'cutscene.animation.curAnim.curFrame'
function onUpdate(el)
	setProperty('cas.x', getProperty('cassier.x') - 94)
	setProperty('cas.y', getProperty('cassier.y'))
	if getProperty('stN.alpha') == 1 and not getProperty('startingSong') then
		removeLuaSprite('stN', true)
	end
end

function onCountdownStarted()
	makeAnimatedLuaSprite('stN', 'static', 0, 0)
	scaleObject('stN', 2, 2)
	addAnimationByPrefix('stN', 'static', 'static', 24, true)
	setObjectCamera('stN', 'camHud')
	addLuaSprite('stN', false)
end

function onCountdownTick(tick)
	if tick == 1 then
		setProperty('cassier.x', 1840)
		setProperty('cassier.y', -360)
		scaleObject('cassier', 1.5, 1.5)
		doTweenAlpha('cdalphatween', 'stN', 0, crochet/1000/getProperty('playbackRate'))
	end
end

function onMoveCamera(trg)
	if trg == 'dad' then
		setProperty('defaultCamZoom', 0.66)
	end
	if trg == 'boyfriend' then
		setProperty('defaultCamZoom', 0.8)
	end
end

function onTweenCompleted(tag)
	if tag == 'icnP3XScaleTw' then
		flwIconP3 = true
	end
	if tag == 'icnP3AngleTWN' then
		removeLuaSprite('iconP3', true)
		removeLuaSprite('cassier', true)
		removeLuaSprite('cas', true)
	end
	if tag == 'cdalphatween' then
		removeLuaSprite('stN', true)
	end
end