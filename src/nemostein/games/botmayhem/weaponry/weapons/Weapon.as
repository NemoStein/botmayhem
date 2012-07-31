package nemostein.games.botmayhem.weaponry.weapons
{
	import flash.geom.Point;
	public interface Weapon
	{
		function ready():Boolean
		function shoot(x:Number, y:Number, angle:Number):void
		function set cooldown(value:Number):void
		function get cooldown():Number
	}
}