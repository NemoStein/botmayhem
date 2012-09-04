package nemostein.games.botmayhem
{
	import nemostein.framework.dragonfly.Game;
	import nemostein.games.botmayhem.bots.enemies.Enemy;
	import nemostein.games.botmayhem.bots.hero.Hero;
	import nemostein.games.botmayhem.bots.hero.HeroService;
	import nemostein.games.botmayhem.core.SystemService;
	import nemostein.games.botmayhem.levels.Level;
	import nemostein.io.Keys;
	
	public class BotMayhem extends Game
	{
		public function BotMayhem()
		{
			super(900, 600);
		}
		
		override protected function initialize():void
		{
			super.initialize();
			
			HeroService.buildHero(830, -25, -Math.PI / 2);
			
			SystemService.registerGame(this);
			SystemService.changeLevel(Level.MENU);
		}
		
		// DELETE: Particle test
		override protected function update():void
		{
			if (input.justPressed(Keys.LEFT_MOUSE))
			{
				var particleTest:Particles = new Particles(this);
			}
			
			super.update();
		}
	}
}