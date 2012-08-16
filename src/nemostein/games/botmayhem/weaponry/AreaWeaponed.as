package nemostein.games.botmayhem.weaponry
{
	import nemostein.games.botmayhem.weaponry.weapon.AreaWeapon;
	
	public interface AreaWeaponed
	{
		function shootAreaWeapon():void;
		function get areaWeapon():AreaWeapon;
		function set areaWeapon(value:AreaWeapon):void;
	}
}