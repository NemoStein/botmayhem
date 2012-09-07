package nemostein.games.botmayhem.weaponry.weapon
{
	import flash.geom.Point;
	import nemostein.games.botmayhem.weaponry.bullet.Bullet;
	import nemostein.games.botmayhem.weaponry.bullet.bullets.MenuMissile;
	import nemostein.games.botmayhem.weaponry.bullet.bullets.SimpleBullet;
	
	internal class BulletPool
	{
		static protected var created:int;
		
		static protected var simpleBulletPooled:int;
		static protected var simpleBulletPool:Array;
		{
			simpleBulletPool = [];
		}
		
		static protected function getMenuMissile(source:Point, target:Point, angle:Number):MenuMissile
		{
			return new MenuMissile(source, target, angle);
		}
		
		static protected function getSimpleBullet(source:Point, angle:Number):SimpleBullet
		{
			var bullet:SimpleBullet;
			
			if (simpleBulletPooled)
			{
				bullet = simpleBulletPool.pop();
				--simpleBulletPooled;
			}
			else
			{
				bullet = new SimpleBullet();
				
				bullet.x = source.x;
				bullet.y = source.y;
				bullet.angle = angle;
			}
			
			return bullet;
		}
		
		static protected function keepSimpleBullet(bullet:SimpleBullet):void
		{
			++simpleBulletPooled;
			simpleBulletPool.push(bullet);
		}
	}
}