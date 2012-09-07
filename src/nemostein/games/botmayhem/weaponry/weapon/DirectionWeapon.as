package nemostein.games.botmayhem.weaponry.weapon
{
	import nemostein.games.botmayhem.weaponry.DirectionWeaponed;
	
	public interface DirectionWeapon extends Weapon
	{
		function shoot():void
		function get holder():DirectionWeaponed
		function set holder(value:DirectionWeaponed):void
	}
}