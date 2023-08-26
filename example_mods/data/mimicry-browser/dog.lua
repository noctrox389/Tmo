local doSing = false
function onCreatePost()
	setProperty('dad.visible', false)
    makeAnimatedLuaSprite('DOG', nil, 0, 0)
	loadGraphic('DOG', 'characters/es c pe 939', 435)
	addAnimation('DOG', 'idle', {0, 1, 2, 3, 4}, 24, false)
	addAnimation('DOG', 'right', {5, 6}, 24, false)
	addAnimation('DOG', 'down', {7, 8, 9}, 24, false)
	addAnimation('DOG', 'up', {10, 11}, 24, false)
	addAnimation('DOG', 'left', {12, 13, 14}, 24, false)
	scaleObject('DOG', 1.7, 1.7)
	addLuaSprite('DOG', false)
end

function onBeatHit()
	if curBeat % 2 == 0 and not doSing then
		playAnim('DOG', 'idle', true)
	end
end

function onCountdownTick(tick)
	if tick % 2 == 0 then
		playAnim('DOG', 'idle', true)
	end
end

local anims = {'left', 'down', 'up', 'right'}
function opponentNoteHit(i, d, nt, sus)
	for i = 0,3 do
		if d == i then
			playAnim('DOG', anims[i+1])
			doSing = true
			runTimer('NOSING!!!', 0.4, 1)
		end
	end
end

function onTimerCompleted(tag)
	if tag == 'NOSING!!!' then
		doSing = false
	end
end