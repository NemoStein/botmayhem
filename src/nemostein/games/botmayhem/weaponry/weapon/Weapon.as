package nemostein.games.botmayhem.weaponry.weapon
{
	import flash.geom.Point;
	
	public interface Weapon
	{
		function get ready():Boolean
		function set ready(value:Boolean):void
		function get cooldown():Number
		function set cooldown(value:Number):void
		function get bulletType():String
		function set bulletType(value:String):void
	}
}