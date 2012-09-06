package nemostein.games.botmayhem.bots
{
	import nemostein.framework.dragonfly.Core;
	import nemostein.framework.dragonfly.Entity;
	import nemostein.games.botmayhem.bots.hero.Hero;
	import nemostein.games.botmayhem.weaponry.bullet.Bullet;
	
	public class Bot extends Entity
	{
		protected var hull:Number = 1;
		
		protected var maxMoveSpeed:Number = 50;
		protected var maxTurnSpeed:Number = 1.5;
		
		public function collide(angle:Number, against:Core):void
		{
			var knockback:Number = 1;
			
			if (against is Bullet)
			{
				die();
			}
			else if (against is Hero)
			{
				knockback = 3;
			}
			
			x += Math.cos(angle) * knockback;
			y += Math.sin(angle) * knockback;
		}
	}
}