package nemostein.games.botmayhem.levels.menu
{
	import flash.display.Bitmap;
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import flash.utils.Timer;
	import nemostein.framework.dragonfly.Core;
	import nemostein.games.botmayhem.Assets;
	import nemostein.games.botmayhem.core.SystemService;
	import nemostein.games.botmayhem.levels.Level;
	
	internal class StartButton extends MenuButton
	{
		override protected function initialize():void
		{
			super.initialize();
			
			scorchRadius = 3.5;
			
			drawHitArea(new Point(30, 66), new Point(208, 18), new Point(256, 196), new Point(78, 245));
			
			var shadow:Core = new Core(Bitmap(new Assets.ImageMenuStartShadow()).bitmapData);
			var button:Core = new Core(Bitmap(new Assets.ImageMenuStartButton()).bitmapData);
			
			button.x = 30;
			button.y = 18;
			
			add(shadow);
			add(button);
		}
		
		override protected function action():void
		{
			var timer:Timer = new Timer(500, 1);
			timer.addEventListener(TimerEvent.TIMER_COMPLETE, function():void
			{
				SystemService.changeLevel(Level.RED_A);
			});
			timer.start();
		}
	}
}