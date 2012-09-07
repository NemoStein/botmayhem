package nemostein.games.botmayhem.weaponry.bullet
{
	import nemostein.framework.dragonfly.Core;
	import nemostein.framework.dragonfly.Entity;
	
	public class Bullet extends Entity
	{
		protected var bulletSpeed:Number;
		
		override protected function initialize():void
		{
			super.initialize();
			
			bulletSpeed = 200;
		}
		
		override protected function update():void
		{
			if (x < 0 || y < 0 || x > 900 || y > 600)
			{
				die();
			}
			
			var moveSpeed:Number = bulletSpeed * time;
			
			x += Math.cos(angle) * moveSpeed;
			y += Math.sin(angle) * moveSpeed;
			
			super.update();
		}
		
		public function collide(angle:Number, against:Core):void
		{
			die();
		}
	}
}