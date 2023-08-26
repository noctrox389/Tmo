local sounds = {'hit', 'scream', 'test'}
function goodNoteHit(a,b,c,d)
	if not buildTarget == 'browser' then
		if not d then
			playSound(sounds[getRandomInt(1,3)])
		end
	end
end

function onUpdatePost(el)
	if not buildTarget == 'browser' then
		setProperty('vocals.volume', 0)
	end
end