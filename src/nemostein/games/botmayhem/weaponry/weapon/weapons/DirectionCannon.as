package nemostein.games.botmayhem.weaponry.weapon.weapons
{
	import nemostein.games.botmayhem.weaponry.DirectionWeaponed;
	import nemostein.games.botmayhem.weaponry.weapon.DirectionWeapon;
	
	public class DirectionCannon extends BaseWeapon implements DirectionWeapon
	{
		private var _holder:DirectionWeaponed;
		
		public function DirectionCannon()
		{
			_cooldown = 150;
		}
		
		public function shoot(angle:Number):void 
		{
			
		}
		
		public function get holder():DirectionWeaponed 
		{
			return _holder;
		}
		
		public function set holder(value:DirectionWeaponed):void 
		{
			_holder = value;
		}
	}
}