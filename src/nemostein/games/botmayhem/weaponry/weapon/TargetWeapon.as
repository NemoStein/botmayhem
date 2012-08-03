package nemostein.games.botmayhem.weaponry.weapon
{
	import flash.geom.Point;
	import nemostein.games.botmayhem.weaponry.TargetWeaponed;
	
	public interface TargetWeapon extends Weapon
	{
		function shoot(location:Point):void
		function get holder():TargetWeaponed
		function set holder(value:TargetWeaponed):void
	}
}