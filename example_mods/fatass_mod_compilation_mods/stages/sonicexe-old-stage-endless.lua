function onCreate()

   makeLuaSprite('endless-bg', 'stages/sonicexe-old-stage-endless-background', -500, -500);
   addLuaSprite('endless-bg', false);
   setLuaSpriteScrollFactor('endless-bg', 0.6, 0.9);

   makeLuaSprite('endless-bg-pillars', 'stages/sonicexe-old-stage-endless-background-pillars', -450, 0);
   addLuaSprite('endless-bg-pillars', false);
   setLuaSpriteScrollFactor('endless-bg-pillars', 0.6, 0.9);

   makeLuaSprite('endless-pillars', 'stages/sonicexe-old-stage-endless-pillars', -750, -100);
   addLuaSprite('endless-pillars', false);
   setLuaSpriteScrollFactor('endless-pillars', 0.8, 0.9);

   makeLuaSprite('endless-floor', 'stages/sonicexe-old-stage-endless-floor', -500, -750);
   addLuaSprite('endless-floor', false);
   scaleObject('endless-floor', 1.5, 1.5);

	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
      makeAnimatedLuaSprite('sonicboppers', 'stages/sonicexe-old-stage-endless-boppers', -500, -250);
      addAnimationByPrefix('sonicboppers', 'first', 'sonicboppers', 24, true);
      objectPlayAnimation('sonicboppers', 'first');
      addLuaSprite('sonicboppers', false);
	end
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end