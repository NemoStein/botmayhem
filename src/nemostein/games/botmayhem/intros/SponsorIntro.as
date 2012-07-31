package nemostein.games.botmayhem.intros
{
	import flash.display.AVM1Movie;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import nemostein.games.botmayhem.Assets;
	import nemostein.intro.Intro;
	
	public class SponsorIntro extends Intro
	{
		private var timer:Timer;
		
		public function SponsorIntro()
		{
			
		}
		
		public override function start():void
		{
			var swfIntroSponsor:MovieClip = new Assets.SwfIntroSponsor();
			
			addChild(swfIntroSponsor);
			
			timer = new Timer(3000, 1);
			timer.addEventListener(TimerEvent.TIMER_COMPLETE, onTimerTimerComplete);
			timer.start();
		}
		
		private function onTimerTimerComplete(event:TimerEvent):void
		{
			timer.removeEventListener(TimerEvent.TIMER_COMPLETE, onTimerTimerComplete);
			end();
		}
	}
}