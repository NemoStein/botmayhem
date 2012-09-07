package nemostein.games.botmayhem.bots.enemies.behaviors
{
	import nemostein.games.botmayhem.bots.enemies.Enemy;
	
	public interface Behavior
	{
		function apply(enemy:Enemy):void;
	}
}