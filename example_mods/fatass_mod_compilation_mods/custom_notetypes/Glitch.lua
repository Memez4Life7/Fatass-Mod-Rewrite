function onCreate()

	precacheImage('pibby-corrupted-glitchnote')
	precacheImage('pibby-corrupted-glitchattack')
	precacheSound('glitchhit')

	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Glitch' then --Check if the note on the chart is a Bullet Note
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'pibby-corrupted-glitchnote'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'pibby-corrupted-glitchattack'); -- change splash
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has penalties
			end
		end
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'Glitch' then
		setProperty('health', getProperty('health')-0.3);
		playSound('glitchhit', 1);
		characterPlayAnim('boyfriend', 'hurt', true);
    end
end

function noteMiss(id, direction, noteType, isSustainNote)
	if noteType == 'Glitch' then
	    setProperty('health', getProperty('health') +0.0400);
		addMisses(-1);
		if camShake then 
			cameraShake('camGame', 0.01, 0.2)
		end
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	-- A loop from a timer you called has been completed, value "tag" is it's tag
	-- loops = how many loops it will have done when it ends completely
	-- loopsLeft = how many are remaining
	if loopsLeft >= 1 then
		setProperty('health', getProperty('health')-0.05);
	end
end