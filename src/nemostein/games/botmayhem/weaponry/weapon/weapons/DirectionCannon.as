package nemostein.games.botmayhem.weaponry.weapon.weapons
{
	import nemostein.games.botmayhem.weaponry.DirectionWeaponed;
	import nemostein.games.botmayhem.weaponry.weapon.BaseWeapon;
	import nemostein.games.botmayhem.weaponry.weapon.DirectionWeapon;
	
	public class DirectionCannon extends BaseWeapon implements DirectionWeapon
	{
		private var _holder:DirectionWeaponed;
		
		public function DirectionCannon()
		{
			cooldown = 0.5;
		}
		
		public function shoot():void 
		{
			ready = false;
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