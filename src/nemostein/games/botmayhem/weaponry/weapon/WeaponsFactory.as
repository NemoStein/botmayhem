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
			var areaCannon:AreaCannon = new AreaCannon();
			target.areaWeapon = areaCannon;
			areaCannon.holder = target;
		}
		
		public function putDirectionWeapon(target:DirectionWeaponed):void
		{
			var directionCannon:DirectionCannon = new DirectionCannon();
			target.directionWeapon = directionCannon;
			directionCannon.holder = target;
		}
		
		public function putTargetWeapon(target:TargetWeaponed):void
		{
			var targetCannon:TargetCannon = new TargetCannon();
			target.targetWeapon = targetCannon;
			targetCannon.holder = target;
		}
		
		public function putMenuCinematicCannon(target:TargetWeaponed):void
		{
			var menuCinematicCannon:MenuCinematicCannon = new MenuCinematicCannon();
			target.targetWeapon = menuCinematicCannon;
			menuCinematicCannon.holder = target;
		}
		
		public function removeAreaWeapon(target:AreaWeaponed):void
		{
			var areaWeapon:AreaWeapon = target.areaWeapon;
			if (areaWeapon)
			{
				areaWeapon.holder = null;
				target.areaWeapon = null;
			}
		}
		
		public function removeDirectionWeapon(target:DirectionWeaponed):void
		{
			var directionWeapon:DirectionWeapon = target.directionWeapon;
			if (directionWeapon)
			{
				directionWeapon.holder = null;
				target.directionWeapon = null;
			}
		}
		
		public function removeTargetWeaponed(target:TargetWeaponed):void
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