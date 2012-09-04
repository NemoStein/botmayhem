package nemostein.games.botmayhem.waves
{
	import flash.geom.Point;
	import nemostein.games.botmayhem.bots.enemies.Enemy;
	import nemostein.games.botmayhem.levels.Level;
	
	public class Wave
	{
		private var _enemyDestructionCallbacks:Vector.<Function>;
		private var _enemyDispatchCallbacks:Vector.<Function>;
		
		protected var id:String;
		protected var params:Array;
		protected var EnemyClass:Class;
		protected var count:int;
		
		protected var level:Level;
		protected var dispatched:Boolean;
		
		public var alive:int;
		
		public final function construct(id:String, params:Array, EnemyClass:Class, count:int):void
		{
			this.id = id;
			this.params = params;
			this.EnemyClass = EnemyClass;
			this.count = count;
			
			_enemyDestructionCallbacks = new Vector.<Function>();
			_enemyDispatchCallbacks = new Vector.<Function>();
			
			initialize(params);
		}
		
		protected function initialize(params:Array):void
		{
		
		}
		
		public function start(level:Level):void
		{
			this.level = level;
		}
		
		public function onEnemyDestruction(callback:Function):void
		{
			_enemyDestructionCallbacks.push(callback);
		}
		
		public function onEnemyDispatch(callback:Function):void
		{
			_enemyDispatchCallbacks.push(callback);
		}
		
		public function destroyEnemy(enemy:Enemy):void
		{
			--alive;
			
			// DELETE: wave sequence test
			trace("Killing a bot from wave " + id + " (" + alive + " alive now)");
			
			for (var i:int = 0; i < _enemyDestructionCallbacks.length; i++)
			{
				var callback:Function = _enemyDestructionCallbacks[i];
				
				callback(enemy, alive);
			}
		}
		
		public function dispatchEnemies():void
		{
			if (!dispatched)
			{
				alive = count;
				
				for (var i:int = 0; i < count; ++i)
				{
					var enemy:Enemy = new EnemyClass();
					
					if (Math.random() < 0.666)
					{
						enemy.x = Math.random() * 900;
						enemy.y = Math.random() < 0.5 ? -25 - Math.random() * 75 : 625 + Math.random() * 75;
					}
					else
					{
						enemy.x = Math.random() < 0.5 ? -25 - Math.random() * 75 : 925 + Math.random() * 75;
						enemy.y = Math.random() * 600;
					}
					
					level.add(enemy);
				}
				
				// DELETE: wave sequence test
				trace("Dispatching " + count + " bots from wave " + id);
				for (var j:int = 0; j < _enemyDispatchCallbacks.length; ++j)
				{
					var callback:Function = _enemyDispatchCallbacks[j];
					
					callback();
				}
				
				dispatched = true;
			}
		}
		
		public function update(time:Number):Boolean
		{
			if (dispatched)
			{
				// DELETE: wave sequence test
				destroyEnemy(null);
				
				if (alive == 0)
				{
					// DELETE: wave sequence test
					trace("All bots are dead in wave " + id);
					return true;
				}
			}
			
			return false;
		}
	}
}