package nemostein.games.botmayhem.weaponry.weapon
{
	import flash.geom.Point;
	
	public interface Weapon
	{
		function get ready():Boolean
		function get cooldown():Number
	}
}