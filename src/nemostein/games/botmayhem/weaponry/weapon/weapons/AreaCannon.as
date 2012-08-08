package nemostein.games.botmayhem.weaponry.weapon.weapons
{
	import nemostein.games.botmayhem.weaponry.AreaWeaponed;
	import nemostein.games.botmayhem.weaponry.weapon.AreaWeapon;
	
	public class AreaCannon extends BaseWeapon implements AreaWeapon
	{
		private var _holder:AreaWeaponed;
		
		public function AreaCannon()
		{
			$cooldown = 150;
		}
		
		public function shoot():void 
		{
			
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