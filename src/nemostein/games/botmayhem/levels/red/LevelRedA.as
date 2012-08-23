package nemostein.games.botmayhem.levels.red
{
	import nemostein.framework.dragonfly.Core;
	import nemostein.games.botmayhem.arenas.ArenaService;
	import nemostein.games.botmayhem.arenas.RedTiledArena;
	import nemostein.games.botmayhem.bots.hero.Hero;
	import nemostein.games.botmayhem.bots.hero.HeroService;
	
	public class LevelRedA extends Core
	{
		private var _arena:RedTiledArena;
		private var _hero:Hero;
		
		override protected function initialize():void
		{
			super.initialize();
			
			_arena = ArenaService.redTiledArena;
			_hero = HeroService.hero;
			
			ArenaService.currentArena = _arena;
			
			add(_arena);
			add(_hero);
			
			_hero.stop();
			_hero.moveWithKeys = true;
		}
	}
}