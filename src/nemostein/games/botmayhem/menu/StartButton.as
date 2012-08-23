package nemostein.games.botmayhem.menu
{
	import flash.display.Bitmap;
	import flash.geom.Point;
	import nemostein.framework.dragonfly.Core;
	import nemostein.games.botmayhem.Assets;
	
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
	}
}