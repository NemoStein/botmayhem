package nemostein.games.botmayhem.weaponry
{
	import flash.geom.Point;
	import nemostein.games.botmayhem.weaponry.weapon.TargetWeapon;
	
	public interface TargetWeaponed
	{
		function shootTargetWeapon(location:Point):void
		function get targetWeapon():TargetWeapon;
		function set targetWeapon(value:TargetWeapon):void
	}
}