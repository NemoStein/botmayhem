package nemostein.games.botmayhem.weaponry.weapon
{
	import nemostein.games.botmayhem.weaponry.AreaWeaponed;
	import nemostein.games.botmayhem.weaponry.DirectionWeaponed;
	import nemostein.games.botmayhem.weaponry.TargetWeaponed;
	import nemostein.games.botmayhem.weaponry.weapon.weapons.MenuCinematicCannon;
	
	public class WeaponsService
	{
		static public function putAreaWeapon(target:AreaWeaponed, weaponClass:Class):void
		{
			var weapon:AreaWeapon = new weaponClass();
			weapon.holder = target;
			target.areaWeapon = weapon;
		}
		
		static public function putDirectionWeapon(target:DirectionWeaponed, weaponClass:Class):void
		{
			var weapon:DirectionWeapon = new weaponClass();
			weapon.holder = target;
			target.directionWeapon = weapon;
		}
		
		static public function putTargetWeapon(target:TargetWeaponed, weaponClass:Class):void
		{
			var weapon:TargetWeapon = new weaponClass();
			weapon.holder = target;
			target.targetWeapon = weapon;
		}
		
		static public function putMenuCinematicCannon(target:TargetWeaponed):void
		{
			var menuCinematicCannon:MenuCinematicCannon = new MenuCinematicCannon();
			target.targetWeapon = menuCinematicCannon;
			menuCinematicCannon.holder = target;
		}
		
		static public function removeAreaWeapon(target:AreaWeaponed):void
		{
			var areaWeapon:AreaWeapon = target.areaWeapon;
			if (areaWeapon)
			{
				areaWeapon.holder = null;
				target.areaWeapon = null;
			}
		}
		
		static public function removeDirectionWeapon(target:DirectionWeaponed):void
		{
			var directionWeapon:DirectionWeapon = target.directionWeapon;
			if (directionWeapon)
			{
				directionWeapon.holder = null;
				target.directionWeapon = null;
			}
		}
		
		static public function removeTargetWeaponed(target:TargetWeaponed):void
		{
			var targetWeapon:TargetWeapon = target.targetWeapon;
			if (targetWeapon)
			{
				targetWeapon.holder = null;
				target.targetWeapon = null;
			}
		}
	}
}