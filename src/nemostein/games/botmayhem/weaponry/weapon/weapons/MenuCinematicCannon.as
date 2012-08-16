package nemostein.games.botmayhem.weaponry.weapon.weapons
{
	import flash.geom.Point;
	import nemostein.games.botmayhem.bots.hero.Hero;
	import nemostein.games.botmayhem.weaponry.TargetWeaponed;
	import nemostein.games.botmayhem.weaponry.weapon.TargetWeapon;
	
	public class MenuCinematicCannon extends BaseWeapon implements TargetWeapon
	{
		private var _hero:Hero;
		
		public function MenuCinematicCannon()
		{
			
		}
		
		public function shoot(location:Point):void 
		{
			// TODO: CinematicsManager need a new home
			//CinematicsService.manager.shootAt(new Point(_hero.x, _hero.y), location);
		}
		
		override public function get ready():Boolean
		{
			// TODO: CinematicsManager need a new home
			return false;// CinematicsService.manager.shotReady;
		}
		
		public function get holder():TargetWeaponed 
		{
			return _hero;
		}
		
		public function set holder(value:TargetWeaponed):void 
		{
			if (value is Hero)
			{
				_hero = Hero(value);
			}
			else
			{
				throw new ArgumentError("MenuCinematicCannon only accepts a Hero as a holder");
			}
		}
	}
}