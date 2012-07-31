package nemostein.games.botmayhem.intros
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import nemostein.intro.Intro;
	
	public class GameIntro extends Intro
	{
		public function GameIntro()
		{
			
		}
		
		public override function start():void
		{
			graphics.beginFill(0, 0.5);
			graphics.drawRect(50, 50, 800, 500);
			graphics.endFill();
			
			var timer:Timer = new Timer(500, 1);
			timer.addEventListener(TimerEvent.TIMER_COMPLETE, onTimerTimerComplete);
			timer.start();
		}
		
		private function onTimerTimerComplete(e:TimerEvent):void
		{
			end();
		}
	}
}