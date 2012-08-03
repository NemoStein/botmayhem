package nemostein.games.botmayhem.weaponry
{
	import nemostein.controllers.Controllable;
	import nemostein.games.botmayhem.weaponry.weapon.AreaWeapon;
	
	public interface AreaWeaponed extends Controllable
	{
		function shootAreaWeapon():void;
		function get areaWeapon():AreaWeapon;
		function set areaWeapon(value:AreaWeapon):void;
	}
}