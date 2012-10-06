package nemostein.games.botmayhem.bots.enemies
{
	import flash.utils.Dictionary;
	import nemostein.games.botmayhem.bots.Bot;
	import nemostein.games.botmayhem.bots.enemies.behaviors.Behavior;
	import nemostein.games.botmayhem.bots.hero.Hero;
	import nemostein.games.botmayhem.waves.Wave;
	
	public class Enemy extends Bot
	{
		static public const ATACKING:String = "atacking";
		static public const ROAMING:String = "roaming";
		
		static public var hero:Hero;
		
		public var state:String;
		public var wave:Wave;
		
		private var _behaviors:Dictionary;
		
		override protected function initialize():void
		{
			super.initialize();
			
			_behaviors = new Dictionary();
		}
		
		protected function addBehavior(state:String, behavior:Behavior):void
		{
			var behaviors:Vector.<Behavior> = _behaviors[state];
			if (!behaviors)
			{
				_behaviors[state] = behaviors = new Vector.<Behavior>();
			}
			
			behaviors.push(behavior);
		}
		
		override protected function update():void
		{
			var behaviors:Vector.<Behavior> = _behaviors[state];
			if (behaviors)
			{
				for each (var behavior:Behavior in behaviors)
				{
					behavior.apply(this);
				}
			}
			
			if (x > bounds.x + bounds.width + width)
			{
				x = bounds.x - width;
			}
			else if (x < bounds.x - width)
			{
				x = bounds.x + bounds.width + width;
			}
			
			if (y > bounds.y + bounds.height + height)
			{
				y = -height;
			}
			else if (y < bounds.y - bounds.height)
			{
				y = bounds.y + bounds.height + height;
			}
			
			super.update();
		}
		
		override public function die():void 
		{
			wave.destroyEnemy(this);
			
			super.die();
		}
	}
}