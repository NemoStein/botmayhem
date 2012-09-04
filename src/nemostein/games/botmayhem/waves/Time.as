package nemostein.games.botmayhem.waves
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	public class Time extends Wave
	{
		override protected function initialize(params:Array):void
		{
			var time:Number = Number(params[0]) * 1000;
			
			if (!isNaN(time))
			{
				var timer:Timer = new Timer(time, 1);
				timer.addEventListener(TimerEvent.TIMER_COMPLETE, onTimerTimerComplete);
				timer.start();
			}
			else
			{
				trace("\"" + params[0] + "\" isn't a valid number.");
			}
			
			super.initialize(params);
		}
		
		private function onTimerTimerComplete(e:TimerEvent):void
		{
			dispatchEnemies();
		}
	}
}