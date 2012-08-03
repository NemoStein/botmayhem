package nemostein.games.botmayhem.cinematics 
{
	import flash.geom.Point;
	import nemostein.games.botmayhem.bots.hero.HeroService;
	
	public class CinematicsService 
	{
		private static var _ready:Boolean = true;
		
		public static function shotReady():Boolean 
		{
			return _ready;
		}
		
		public static function shotTarget(location:Point):void 
		{
			if(_ready)
			{
				HeroService.manager.hero.shootTargetWeapon(location);
				_ready = false;
			}
		}
	}
}