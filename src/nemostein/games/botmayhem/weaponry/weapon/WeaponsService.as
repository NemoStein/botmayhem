package nemostein.games.botmayhem.weaponry.weapon
{
	import nemostein.games.botmayhem.weaponry.AreaWeaponed;
	import nemostein.games.botmayhem.weaponry.DirectionWeaponed;
	import nemostein.games.botmayhem.weaponry.TargetWeaponed;
	import nemostein.games.botmayhem.weaponry.weapon.weapons.AreaCannon;
	import nemostein.games.botmayhem.weaponry.weapon.weapons.DirectionCannon;
	import nemostein.games.botmayhem.weaponry.weapon.weapons.MenuCinematicCannon;
	import nemostein.games.botmayhem.weaponry.weapon.weapons.TargetCannon;
	
	public class WeaponsService
	{
		static public function putAreaWeapon(target:AreaWeaponed):void
		{
			var areaCannon:AreaCannon = new AreaCannon();
			target.areaWeapon = areaCannon;
			areaCannon.holder = target;
		}
		
		static public function putDirectionWeapon(target:DirectionWeaponed):void
		{
			var directionCannon:DirectionCannon = new DirectionCannon();
			target.directionWeapon = directionCannon;
			directionCannon.holder = target;
		}
		
		static public function putTargetWeapon(target:TargetWeaponed):void
		{
			var targetCannon:TargetCannon = new TargetCannon();
			target.targetWeapon = targetCannon;
			targetCannon.holder = target;
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