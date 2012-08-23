package nemostein.games.botmayhem
{
	import nemostein.framework.dragonfly.Game;
	import nemostein.games.botmayhem.bots.hero.Hero;
	import nemostein.games.botmayhem.bots.hero.HeroService;
	import nemostein.games.botmayhem.core.Levels;
	import nemostein.games.botmayhem.core.SystemService;
	import nemostein.games.botmayhem.menu.Menu;
	
	public class BotMayhem extends Game
	{
		public function BotMayhem()
		{
			super(900, 600);
		}
		
		override protected function initialize():void
		{
			super.initialize();
			
			var hero:Hero = new Hero();
			
			hero.x = 830;
			hero.y = 225;
			hero.angle = Math.PI / 2;
			
			HeroService.hero = hero;
			
			SystemService.registerGame(this);
			SystemService.changeLevel(Levels.MENU);
		}
	}
}