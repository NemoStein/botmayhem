package nemostein.games.botmayhem.levels.red
{
	import nemostein.framework.dragonfly.Core;
	import nemostein.games.botmayhem.arenas.ArenaService;
	import nemostein.games.botmayhem.arenas.RedTiledArena;
	import nemostein.games.botmayhem.bots.hero.Hero;
	import nemostein.games.botmayhem.bots.hero.HeroService;
	import nemostein.games.botmayhem.levels.Level;
	
	public class LevelRedA extends Level
	{
		private var _arena:RedTiledArena;
		private var _hero:Hero;
		
		override protected function initialize():void
		{
			super.initialize();
			
			_arena = ArenaService.redTiledArena;
			_hero = HeroService.hero;
			
			ArenaService.currentArena = _arena;
			
			_hero.stop();
			_hero.moveWithKeys = true;
			
			add(_arena);
		}
	}
}