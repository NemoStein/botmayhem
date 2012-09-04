package nemostein.games.botmayhem.levels.red
{
	import flash.geom.Point;
	import nemostein.framework.dragonfly.Core;
	import nemostein.games.botmayhem.arenas.ArenaService;
	import nemostein.games.botmayhem.arenas.RedTiledArena;
	import nemostein.games.botmayhem.Assets;
	import nemostein.games.botmayhem.bots.Bot;
	import nemostein.games.botmayhem.bots.hero.Hero;
	import nemostein.games.botmayhem.bots.hero.HeroService;
	import nemostein.games.botmayhem.levels.Level;
	import nemostein.games.botmayhem.waves.Wave;
	import nemostein.games.botmayhem.waves.Waves;
	
	public class LevelRedA extends Level
	{
		private var _arena:RedTiledArena;
		private var _hero:Hero;
		private var _waves:Waves;
		
		override protected function initialize():void
		{
			super.initialize();
			
			_arena = ArenaService.redTiledArena;
			_hero = HeroService.hero;
			
			ArenaService.currentArena = _arena;
			
			_hero.stop();
			_hero.moveWithKeys = true;
			
			add(_arena);
			
			_waves = Waves.parse(new Assets.TextWavesTestLevel());
			_waves.startWaves(this);
		}
		
		override protected function update():void 
		{
			_waves.updateWaves(time);
			
			super.update();
		}
	}
}