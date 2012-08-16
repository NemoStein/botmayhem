package nemostein.games.botmayhem 
{
	import flash.display.DisplayObjectContainer;
	import flash.display.Stage;
	import nemostein.framework.dragonfly.Game;
	import nemostein.games.botmayhem.bots.hero.Hero;
	import nemostein.games.botmayhem.bots.hero.HeroService;
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
			hero.y = -25;
			hero.angle = Math.PI / 2;
			
			HeroService.hero = hero;
			
			var menu:Menu = new Menu();
			add(menu);
		}
	}
}