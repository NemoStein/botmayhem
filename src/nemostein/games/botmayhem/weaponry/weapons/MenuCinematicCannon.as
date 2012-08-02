package nemostein.games.botmayhem.weaponry.weapons
{
	import nemostein.games.botmayhem.cinematics.CinematicsService;
	
	public class MenuCinematicCannon extends BaseWeapon implements LargeWeapon
	{
		
		public function MenuCinematicCannon()
		{
			
		}
		
		override public function ready():Boolean
		{
			return CinematicsService.shotReady();
		}
	}
}