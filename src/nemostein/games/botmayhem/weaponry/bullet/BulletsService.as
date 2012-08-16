package nemostein.games.botmayhem.weaponry.bullet
{
	import flash.geom.Point;
	import nemostein.games.botmayhem.weaponry.bullet.bullets.Missile;
	import nemostein.games.botmayhem.weaponry.bullet.bullets.SimpleBullet;
	
	public class BulletsService
	{
		static public function getSimpleBullet(source:Point, angle:Number):SimpleBullet
		{
			var simpleBullet:SimpleBullet = new SimpleBullet();
			
			simpleBullet.x = source.x;
			simpleBullet.y = source.y;
			simpleBullet.angle = angle;
			
			return simpleBullet;
		}
		
		static public function getMissile(source:Point, target:Point, angle:Number):Missile 
		{
			var missile:Missile = new Missile(source, target);
			
			missile.x = source.x;
			missile.y = source.y;
			missile.angle = angle;
			
			return missile;
		}
	}
}