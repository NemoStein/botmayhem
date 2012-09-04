package nemostein.games.botmayhem.bots
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import nemostein.framework.dragonfly.AnchorAlign;
	import nemostein.framework.dragonfly.Core;
	import nemostein.games.botmayhem.bots.hero.Hero;
	import nemostein.games.botmayhem.weaponry.bullet.Bullet;
	
	public class Bot extends Core
	{
		protected var hull:Number = 1;
		
		protected var maxMoveSpeed:Number = 50;
		protected var maxTurnSpeed:Number = 2;
		
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