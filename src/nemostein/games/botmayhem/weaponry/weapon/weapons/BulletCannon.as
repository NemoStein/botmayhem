package nemostein.games.botmayhem.weaponry.weapon.weapons 
{
	import flash.geom.Point;
	import nemostein.framework.dragonfly.Core;
	import nemostein.games.botmayhem.bots.hero.Hero;
	import nemostein.games.botmayhem.weaponry.weapon.DirectionWeapon;
	
	public class BulletCannon extends DirectionWeapon
	{
		public function BulletCannon() 
		{
			super();
			
			cooldown = 0.02;
		}
		
		override public function shoot():void 
		{
			if(ready)
			{
				var core:Core = Core(holder);
				core.add(getSimpleBullet(new Point(core.x, core.y), core.angle + (Math.random() * 0.1 - 0.05), holder is Hero));
			}
			
			super.shoot();
		}
	}
}