package nemostein.games.botmayhem.weaponry.weapon.weapons 
{
	import flash.geom.Point;
	import nemostein.framework.dragonfly.Core;
	
	public class BulletCannon extends DirectionCannon 
	{
		override public function shoot():void 
		{
			if(ready)
			{
				var core:Core = Core(holder);
				core.add(getSimpleBullet(new Point(core.x, core.y), core.angle));
			}
			
			super.shoot();
		}
	}
}