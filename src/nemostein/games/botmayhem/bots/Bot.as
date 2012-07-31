package nemostein.games.botmayhem.bots
{
	import nemostein.controllers.Collidable;
	import nemostein.controllers.Controllable;
	import nemostein.games.botmayhem.bots.hero.Hero;
	import nemostein.games.botmayhem.core.Entity;
	import nemostein.games.botmayhem.weaponry.bullets.Bullet;
	import nemostein.utils.MathUtils;
	
	public class Bot extends Entity implements Controllable, Collidable
	{
		protected var _hull:Number = 1;
		
		public function get angle():Number
		{
			return MathUtils.rad(rotation);
		}
		
		public function set angle(value:Number):void
		{
			rotation = MathUtils.deg(value);
		}
		
		public function collide(angle:Number, against:Collidable):void
		{
			var knockback:Number = 1;
			
			if (against is Bullet)
			{
				BotsService.manager.kill(this);
			}
			else if (against is Hero)
			{
				knockback = 3;
			}
			
			x += Math.cos(angle) * knockback;
			y += Math.sin(angle) * knockback;
		}
		
		public function die():void
		{
			
		}
	}
}