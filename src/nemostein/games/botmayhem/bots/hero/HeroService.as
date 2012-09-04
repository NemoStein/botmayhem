package nemostein.games.botmayhem.bots.hero
{
	import nemostein.games.botmayhem.bots.enemies.Enemy;
	
	public class HeroService
	{
		static public var hero:Hero;
		
		static public function buildHero(positionX:Number, positionY:Number, angle:Number):void
		{
			hero = new Hero();
			
			hero.x = 830;
			hero.y = -25;
			hero.angle = Math.PI / 2;
			
			Enemy.hero = hero;
		}
	}
}