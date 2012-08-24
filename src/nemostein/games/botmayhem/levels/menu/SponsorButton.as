package nemostein.games.botmayhem.levels.menu
{
	import flash.display.Bitmap;
	import flash.geom.Point;
	import nemostein.framework.dragonfly.Core;
	import nemostein.games.botmayhem.Assets;
	
	internal class SponsorButton extends MenuButton
	{
		override protected function initialize():void
		{
			super.initialize();
			
			scorchRadius = 2.25;
			
			drawHitArea(new Point(20, 23), new Point(137, 0), new Point(160, 118), new Point(43, 141));
			
			var shadow:Core = new Core(Bitmap(new Assets.ImageMenuSponsorShadow()).bitmapData);
			var button:Core = new Core(Bitmap(new Assets.ImageMenuSponsorButton()).bitmapData);
			
			shadow.y = 3;
			button.x = 21;
			
			add(shadow);
			add(button);
		}
	}
}