package nemostein.games.botmayhem.weaponry.weapon
{
	import flash.geom.Point;
	import nemostein.games.botmayhem.bots.hero.Hero;
	import nemostein.games.botmayhem.bots.hero.HeroService;
	import nemostein.games.botmayhem.core.SystemService;
	import nemostein.games.botmayhem.weaponry.bullet.bullets.MenuMissile;
	import nemostein.games.botmayhem.weaponry.bullet.bullets.SimpleBullet;
	
	internal class BulletPool
	{
		static private var _hero:Hero;
		
		static protected var created:int;
		static protected var simpleBulletPooled:int;
		static protected var simpleBulletPool:Array;
		
		// static initialization
		{
			simpleBulletPool = [];
			_hero = HeroService.hero;
		}
		
		static protected function getMenuMissile(source:Point, target:Point, angle:Number):MenuMissile
		{
			return new MenuMissile(source, target, angle);
		}
		
		static protected function getSimpleBullet(source:Point, angle:Number, firedFromHero:Boolean):SimpleBullet
		{
			var bullet:SimpleBullet;
			
			if (simpleBulletPooled)
			{
				bullet = simpleBulletPool.pop();
				bullet.revive();
				--simpleBulletPooled;
			}
			else
			{
				bullet = new SimpleBullet();
				bullet.hero = _hero;
				bullet.onDeath = keepSimpleBullet;
			}
			
			bullet.x = source.x;
			bullet.y = source.y;
			bullet.angle = angle;
			bullet.fromHero = firedFromHero;
			bullet.enemies = SystemService.currentEnemies();
			
			return bullet;
		}
		
		static protected function keepSimpleBullet(bullet:SimpleBullet):void
		{
			++simpleBulletPooled;
			simpleBulletPool.push(bullet);
		}
	}
}