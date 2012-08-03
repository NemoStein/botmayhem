package nemostein.games.botmayhem.weaponry.bullet
{
	import flash.geom.Point;
	import nemostein.games.botmayhem.weaponry.bullet.bullets.SimpleBullet;
	
	public class BulletsFactory
	{
		public function getSimpleBullet(x:Number, y:Number, angle:Number):SimpleBullet
		{
			var simpleBullet:SimpleBullet = new SimpleBullet();
			
			simpleBullet.x = x;
			simpleBullet.y = y;
			simpleBullet.angle = angle;
			
			return simpleBullet;
		}
	}
}