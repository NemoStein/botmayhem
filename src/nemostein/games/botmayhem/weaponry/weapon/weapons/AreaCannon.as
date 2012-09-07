package nemostein.games.botmayhem.weaponry.weapon.weapons
{
	import nemostein.games.botmayhem.weaponry.AreaWeaponed;
	import nemostein.games.botmayhem.weaponry.weapon.AreaWeapon;
	import nemostein.games.botmayhem.weaponry.weapon.BaseWeapon;
	
	public class AreaCannon extends BaseWeapon implements AreaWeapon
	{
		private var _holder:AreaWeaponed;
		
		public function AreaCannon()
		{
			cooldown = 150;
		}
		
		public function shoot():void 
		{
			ready = false;
		}
		
		public function get holder():AreaWeaponed 
		{
			return _holder;
		}
		
		public function set holder(value:AreaWeaponed):void 
		{
			_holder = value;
		}
	}
}