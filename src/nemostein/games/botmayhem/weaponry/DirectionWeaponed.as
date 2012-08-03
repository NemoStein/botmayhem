package nemostein.games.botmayhem.weaponry
{
	import nemostein.controllers.Controllable;
	import nemostein.games.botmayhem.weaponry.weapon.DirectionWeapon;
	
	public interface DirectionWeaponed extends Controllable
	{
		function shootDirectionWeapon():void
		function get directionWeapon():DirectionWeapon;
		function set directionWeapon(value:DirectionWeapon):void
	}
}