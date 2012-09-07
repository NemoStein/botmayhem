package nemostein.games.botmayhem.bots.enemies.behaviors
{
	import nemostein.games.botmayhem.bots.enemies.Enemy;
	import nemostein.games.botmayhem.bots.hero.Hero;
	import nemostein.games.botmayhem.bots.hero.HeroService;
	
	public class ExecuteOnHeroCollision implements Behavior
	{
		private var _callback:Function;
		private var _hero:Hero;
		
		public function ExecuteOnHeroCollision(callback:Function)
		{
			_callback = callback;
			_hero = HeroService.hero;
		}
		
		public function apply(enemy:Enemy):void
		{
			var eX:Number = enemy.x;
			var eY:Number = enemy.y;
			var hX:Number = _hero.x;
			var hY:Number = _hero.y;
			
			if (eX + enemy.width < hX || eX > hX + _hero.width || eY + enemy.height < hY || eY > hY + _hero.height)
			{
				return;
			}
			
			_callback();
		}
	}
}