package nemostein.games.botmayhem.weaponry.weapon.weapons
{
	import flash.geom.Point;
	import nemostein.games.botmayhem.weaponry.TargetWeaponed;
	import nemostein.games.botmayhem.weaponry.weapon.BaseWeapon;
	import nemostein.games.botmayhem.weaponry.weapon.TargetWeapon;
	
	public class TargetCannon extends BaseWeapon implements TargetWeapon
	{
		private var _holder:TargetWeaponed;
		
		public function TargetCannon()
		{
			cooldown = 150;
		}
		
		public function shoot(location:Point):void 
		{
			ready = false;
		}
		
		public function get holder():TargetWeaponed 
		{
			return _holder;
		}
		
		public function set holder(value:TargetWeaponed):void 
		{
			_holder = value;
		}
	}
}