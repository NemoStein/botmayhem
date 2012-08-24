package nemostein.games.botmayhem.levels.menu
{
	import flash.geom.Point;
	import nemostein.games.botmayhem.bots.hero.HeroService;
	
	public class CinematicService
	{
		static private var _menuButton:MenuButton;
		static private var _ready:Boolean = true;
		
		static public function shootMenuMissile(point:Point, menuButton:MenuButton):void
		{
			if(_ready)
			{
				_menuButton = menuButton;
				
				HeroService.hero.shootTargetWeapon(point);
				
				_ready = false;
			}
		}
		
		static public function executeButtonAction():void 
		{
			if(!_ready)
			{
				_menuButton.hit();
				_ready = true;
			}
		}
		
		static public function nextShotReady():Boolean 
		{
			return _ready;
		}
	}
}