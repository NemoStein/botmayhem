package nemostein.games.botmayhem.bots.enemies
{
	import nemostein.games.botmayhem.bots.Bot;
	import nemostein.games.botmayhem.bots.enemies.behaviors.Behavior;
	import nemostein.games.botmayhem.bots.hero.Hero;
	
	public class Enemy extends Bot
	{
		static public var hero:Hero;
		
		private var _behaviors:Vector.<Behavior>;
		
		override protected function initialize():void
		{
			super.initialize();
			
			_behaviors = new Vector.<Behavior>();
		}
		
		protected function addBehavior(behavior:Behavior):void
		{
			_behaviors.push(behavior);
		}
		
		override protected function update():void
		{
			for each (var behavior:Behavior in _behaviors) 
			{
				behavior.apply(this);
			}
			
			super.update();
		}
	}
}