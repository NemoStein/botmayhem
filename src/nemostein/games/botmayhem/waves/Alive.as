package nemostein.games.botmayhem.waves 
{
	import nemostein.games.botmayhem.bots.enemies.Enemy;
	import nemostein.games.botmayhem.levels.Level;
	public class Alive extends Wave
	{
		private var _waveReference:Wave;
		private var _enemiesAlive:int;
		
		override protected function initialize(params:Array):void 
		{
			try
			{
				_waveReference = params[0];
				_enemiesAlive = int(params[1]);
			}
			catch (error:Error)
			{
				trace("\"" + params[0] + "\" isn't a valid wave reference.");
			}
			
			super.initialize(params);
		}
		
		
		override public function start(level:Level):void 
		{
			if(_waveReference)
			{
				_waveReference.onEnemyDestruction(waveReferenceEnemyDestruction);
			}
			
			super.start(level);
		}
		
		
		private function waveReferenceEnemyDestruction(destroyed:Enemy, stillAlive:int):void 
		{
			if (!dispatched && stillAlive <= _enemiesAlive)
			{
				dispatchEnemies();
			}
		}
	}
}