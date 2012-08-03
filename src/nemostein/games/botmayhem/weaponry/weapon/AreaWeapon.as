package nemostein.games.botmayhem.weaponry.weapon
{
	import nemostein.games.botmayhem.weaponry.AreaWeaponed;
	public interface AreaWeapon extends Weapon
	{
		function shoot():void;
		function get holder():AreaWeaponed
		function set holder(value:AreaWeaponed):void
	}
}