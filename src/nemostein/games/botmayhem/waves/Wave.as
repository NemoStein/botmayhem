package nemostein.games.botmayhem.waves
{
	import flash.geom.Point;
	import nemostein.games.botmayhem.bots.enemies.Enemy;
	import nemostein.games.botmayhem.states.Level;
	import nemostein.games.botmayhem.states.State;
	import nemostein.games.botmayhem.waves.locations.SpawnLocation;
	import nemostein.utils.MathUtils;
	
	public class Wave
	{
		private var _enemyDestructionCallbacks:Vector.<Function>;
		private var _enemyDispatchCallbacks:Vector.<Function>;
		
		protected var id:String;
		protected var params:Array;
		protected var EnemyClass:Class;
		protected var count:int;
		protected var LocationClass:Class;
		
		protected var level:Level;
		protected var dispatched:Boolean;
		
		public var alive:int;
		
		public final function construct(id:String, params:Array, EnemyClass:Class, count:int, LocationClass:Class):void
		{
			this.id = id;
			this.params = params;
			this.EnemyClass = EnemyClass;
			this.count = count;
			this.LocationClass = LocationClass;
			
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
				
				var spawnLocation:SpawnLocation = new LocationClass();
				
				for (var i:int = 0; i < count; ++i)
				{
					var enemy:Enemy = new EnemyClass();
					
					var point:Point = spawnLocation.getLocation();
					
					enemy.wave = this;
					enemy.x = point.x;
					enemy.y = point.y;
					enemy.angle = Math.random() * MathUtils.PI2;
					
					level.addEnemy(enemy);
				}
				
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
				if (alive == 0)
				{
					return true;
				}
			}
			
			return false;
		}
	}
}