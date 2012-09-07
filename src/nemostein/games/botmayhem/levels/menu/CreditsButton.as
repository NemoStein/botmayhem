package nemostein.games.botmayhem.levels.menu
{
	import flash.display.Bitmap;
	import flash.geom.Point;
	import nemostein.framework.dragonfly.Core;
	import nemostein.games.botmayhem.assets.menu.AssetCreditsButton;
	import nemostein.games.botmayhem.assets.menu.AssetCreditsShadow;
	
	internal class CreditsButton extends MenuButton
	{
		override protected function initialize():void
		{
			super.initialize();
			
			scorchRadius = 2.75;
			
			drawHitArea(new Point(41, 1), new Point(176, 36), new Point(140, 171), new Point(5, 135));
			
			var shadow:Core = new Core(Bitmap(new AssetCreditsShadow()).bitmapData);
			var button:Core = new Core(Bitmap(new AssetCreditsButton()).bitmapData);
			
			shadow.y = 2;
			button.x = 5;
			
			add(shadow);
			add(button);
		}
	}
}