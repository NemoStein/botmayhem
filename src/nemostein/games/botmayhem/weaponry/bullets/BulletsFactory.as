package nemostein.games.botmayhem.weaponry.bullets
{
	import flash.geom.Point;
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