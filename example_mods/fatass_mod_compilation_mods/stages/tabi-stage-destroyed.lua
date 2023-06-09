function onCreate()

   makeLuaSprite('vignette', 'vignette-black', -500, -300);
   addLuaSprite('vignette', true);
   scaleObject('vignette', 1.0, 1.0);

   makeLuaSprite('stage', 'stages/tabi-stage-destroyed', -500, -300);
   addLuaSprite('stage', false);

   if not lowQuality then -- sprites that only load if Low Quality is turned off
      makeAnimatedLuaSprite('fire', 'stages/tabi-stage-destroyed-fire', 800, -200);
      addAnimationByPrefix('fire', 'first', 'Fire', 30, true);
      objectPlayAnimation('fire', 'first');
      addLuaSprite('fire', false);
      scaleObject('fire', 0.5, 2);

      makeAnimatedLuaSprite('fire1', 'stages/tabi-stage-destroyed-fire', 350, -230);
      addAnimationByPrefix('fire1', 'first', 'Fire', 30, true);
      objectPlayAnimation('fire1', 'first');
      addLuaSprite('fire1', false);
      scaleObject('fire1', 0.5, 2);

      makeLuaSprite('destroyed-boards', 'stages/tabi-stage-destroyed-boards', -500, -310);
      addLuaSprite('destroyed-boards', false);

      makeAnimatedLuaSprite('fire2', 'stages/tabi-stage-destroyed-fire', 1100, -300);
      addAnimationByPrefix('fire2', 'first', 'Fire', 30, true);
      objectPlayAnimation('fire2', 'first');
      addLuaSprite('fire2', false);
      scaleObject('fire2', 2, 2);

      makeAnimatedLuaSprite('fire3', 'stages/tabi-stage-destroyed-fire', -600, -300);
      addAnimationByPrefix('fire3', 'first', 'Fire', 30, true);
      objectPlayAnimation('fire3','first');
      addLuaSprite('fire3', false);
      scaleObject('fire3', 2, 2);

      makeAnimatedLuaSprite('fire4', 'stages/tabi-stage-destroyed-fire', 600, 200);
      addAnimationByPrefix('fire4', 'first', 'Fire', 30, true);
      objectPlayAnimation('fire4', 'first');
      addLuaSprite('fire4', false);
      scaleObject('fire4', 1, 1);
   end

   makeLuaSprite('destroyed-furniture', 'stages/tabi-stage-destroyed-furniture', -500, -310);
   addLuaSprite('destroyed-furniture', false);

   makeLuaSprite('destroyed-boombox', 'stages/tabi-stage-destroyed-boombox', 250, 385);
   scaleObject('destroyed-boombox', 1.2, 1.2);
   addLuaSprite('destroyed-boombox', false);

   close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end