package nemostein.games.botmayhem.weaponry.weapons
{
	import nemostein.games.botmayhem.weaponry.HugeWeaponed;
	import nemostein.games.botmayhem.weaponry.LargeWeaponed;
	import nemostein.games.botmayhem.weaponry.SmallWeaponed;
	
	public class WeaponsFactory
	{
		public function putSmallWeapon(target:SmallWeaponed):void
		{
			target.smallWeapon = new BulletCannon();
		}
		
		public function putLargeWeapon(target:LargeWeaponed):void
		{
			target.largeWeapon = new BulletCannon();
		}
		
		public function putHugeWeapon(target:HugeWeaponed):void
		{
			target.hugeWeapon = new BulletCannon();
		}
		
		public function putMenuCinematicCannon(target:LargeWeaponed):void
		{
			target.largeWeapon = new MenuCinematicCannon();
		}
		
		public function removeSmallWeapon(target:SmallWeaponed):void
		{
			target.smallWeapon = null;
		}
		
		public function removeLargeWeapon(target:LargeWeaponed):void
		{
			target.largeWeapon = null;
		}
		
		public function removeHugeWeapon(target:HugeWeaponed):void
		{
			target.hugeWeapon = null;
		}
	}
}