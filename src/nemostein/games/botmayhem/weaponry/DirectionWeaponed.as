package nemostein.games.botmayhem.weaponry
{
	import nemostein.games.botmayhem.weaponry.weapon.DirectionWeapon;
	
	public interface DirectionWeaponed
	{
		function shootDirectionWeapon():void
		function get directionWeapon():DirectionWeapon;
		function set directionWeapon(value:DirectionWeapon):void
	}
}