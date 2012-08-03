package nemostein.games.botmayhem.weaponry.weapon
{
	import nemostein.games.botmayhem.weaponry.AreaWeaponed;
	import nemostein.games.botmayhem.weaponry.DirectionWeaponed;
	import nemostein.games.botmayhem.weaponry.TargetWeaponed;
	import nemostein.games.botmayhem.weaponry.weapon.weapons.AreaCannon;
	import nemostein.games.botmayhem.weaponry.weapon.weapons.DirectionCannon;
	import nemostein.games.botmayhem.weaponry.weapon.weapons.MenuCinematicCannon;
	import nemostein.games.botmayhem.weaponry.weapon.weapons.TargetCannon;
	
	public class WeaponsFactory
	{
		public function putAreaWeapon(target:AreaWeaponed):void
		{
			target.areaWeapon = new AreaCannon();
		}
		
		public function putDirectionWeapon(target:DirectionWeaponed):void
		{
			target.directionWeapon = new DirectionCannon();
		}
		
		public function putTargetWeapon(target:TargetWeaponed):void
		{
			target.targetWeapon = new TargetCannon();
		}
		
		public function putMenuCinematicCannon(target:TargetWeaponed):void
		{
			target.targetWeapon = new MenuCinematicCannon();
		}
		
		public function removeAreaWeapon(target:AreaWeaponed):void
		{
			target.areaWeapon = null;
		}
		
		public function removeDirectionWeapon(target:DirectionWeaponed):void
		{
			target.directionWeapon = null;
		}
		
		public function removeTargetWeaponed(target:TargetWeaponed):void
		{
			target.targetWeapon = null;
		}
	}
}