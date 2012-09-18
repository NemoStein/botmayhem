package nemostein.games.botmayhem.waves
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	public class Time extends Wave
	{
		private var _dispatchTime:Number;
		private var _dispatchDelay:Number;
		
		override protected function initialize(params:Array):void
		{
			_dispatchTime = Number(params[0]);
			_dispatchDelay = 0;
			
			if (isNaN(_dispatchTime))
			{
				trace("\"" + params[0] + "\" isn't a valid number.");
			}
			
			super.initialize(params);
		}
		
		override public function update(time:Number):Boolean
		{
			if (!dispatched)
			{
				_dispatchDelay += time;
				
				if (_dispatchDelay >= _dispatchTime)
				{
					dispatchEnemies();
				}
			}
			
			return super.update(time);
		}
	}
}