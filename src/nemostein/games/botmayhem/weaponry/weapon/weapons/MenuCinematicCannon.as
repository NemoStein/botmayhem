package nemostein.games.botmayhem.weaponry.weapon.weapons
{
	import flash.geom.Point;
	import nemostein.framework.dragonfly.Core;
	import nemostein.games.botmayhem.states.menu.CinematicService;
	import nemostein.games.botmayhem.weaponry.bullet.bullets.MenuMissile;
	import nemostein.games.botmayhem.weaponry.weapon.TargetWeapon;
	
	public class MenuCinematicCannon extends TargetWeapon
	{
		override public function shoot():void
		{
			if (CinematicService.nextShotReady())
			{
				var core:Core = Core(holder);
				
				var missile:MenuMissile = getMenuMissile(new Point(core.x, core.y), target, core.angle);
				
				core.add(missile);
			}
		}
	}
}