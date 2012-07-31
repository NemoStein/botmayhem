package nemostein.games.botmayhem.weaponry.weapons
{
	public class BulletCannon extends BaseWeapon implements SmallWeapon, LargeWeapon, HugeWeapon
	{
		
		public function BulletCannon()
		{
			cooldown = 150;
		}
	}
}