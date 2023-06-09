function onCreate()
	precacheImage('pibby-corrupted-swordnote')
	precacheSound('slice')
	
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Sword' then --Check if the note on the chart is a Bullet Note
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'pibby-corrupted-swordnote'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashHue', 0); --custom notesplash color, why not
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashSat', -20);
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashBrt', 1);
			scoreWas = getProperty('songScore'); -- score getting
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); --Miss has penalties
			end
		end
	end
end

function noteMissPress()
	scoreWas = getProperty('songScore'); -- and more score getting
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'Sword' then
		playSound('slice', 0.4);
		characterPlayAnim('dad', 'attack', true);
		characterPlayAnim('boyfriend', 'dodge', true);
		setProperty('boyfriend.specialAnim', true);
		setProperty('dad.specialAnim', true);
		if camShake then 
			cameraShake('camGame', 0.01, 0.2)
		end
		scoreWas = getProperty('songScore'); -- even more score getting
	else scoreWas = getProperty('songScore'); -- score getting
    end
end

function noteMiss(id, direction, noteType, isSustainNote)
	if noteType == 'Sword' then
		setProperty('health', getProperty('health')-0.3);
		playSound('slice', 0.4);
		characterPlayAnim('dad', 'attack', true);
		characterPlayAnim('boyfriend', 'hurt', true);
		setProperty('boyfriend.specialAnim', true);
		setProperty('dad.specialAnim', true);
		if camShake then 
			cameraShake('camGame', 0.01, 0.2)
		end
		setScore(scoreWas-190); -- score steal. 10 score less because 'ignoreNote' false.
		scoreWas = getProperty('songScore'); -- get ya score
		else scoreWas = getProperty('songScore'); -- even more score getting
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	-- A loop from a timer you called has been completed, value "tag" is it's tag
	-- loops = how many loops it will have done when it ends completely
	-- loopsLeft = how many are remaining
	if loopsLeft >= 1 then
		setProperty('health', getProperty('health')-0.001);
	end
end