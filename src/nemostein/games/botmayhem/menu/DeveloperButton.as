package nemostein.games.botmayhem.menu
{
	import flash.display.Bitmap;
	import flash.geom.Point;
	import nemostein.framework.dragonfly.Core;
	import nemostein.games.botmayhem.Assets;
	
	internal class DeveloperButton extends MenuButton
	{
		override protected function initialize():void
		{
			super.initialize();
			
			scorchRadius = 2.25;
			
			drawHitArea(new Point(25, 9), new Point(143, 2), new Point(149, 120), new Point(31, 127));
			
			var shadow:Core = new Core(Bitmap(new Assets.ImageMenuDeveloperShadow()).bitmapData);
			var button:Core = new Core(Bitmap(new Assets.ImageMenuDeveloperButton()).bitmapData);
			
			button.x = 25;
			button.y = 1;
			
			add(shadow);
			add(button);
		}
	}
}