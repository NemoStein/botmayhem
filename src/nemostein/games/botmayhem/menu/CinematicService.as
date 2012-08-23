package nemostein.games.botmayhem.menu
{
	import flash.geom.Point;
	import nemostein.games.botmayhem.bots.hero.HeroService;
	
	public class CinematicService
	{
		static public function shootMenuMissile(point:Point):void
		{
			HeroService.hero.shootTargetWeapon(point);
		}
	}
}