package nemostein.games.botmayhem.weaponry.weapon.weapons
{
	import flash.geom.Point;
	import nemostein.games.botmayhem.bots.hero.Hero;
	import nemostein.games.botmayhem.weaponry.bullet.bullets.Missile;
	import nemostein.games.botmayhem.weaponry.bullet.BulletsService;
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
			var missile:Missile = BulletsService.getMissile(new Point(_hero.x, _hero.y), location, _hero.angle);
			
			_hero.add(missile);
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