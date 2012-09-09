package nemostein.games.botmayhem.hud.buttons 
{
	import flash.display.Bitmap;
	import nemostein.framework.dragonfly.Core;
	import nemostein.games.botmayhem.assets.hud.AssetButtonOptionsPressed;
	import nemostein.games.botmayhem.assets.hud.AssetButtonOptionsReleased;
	import nemostein.games.botmayhem.core.Button;
	
	public class OptionsButton extends Button
	{
		private var _buttonOptionsReleased:Core;
		private var _buttonOptionsPressed:Core;
		
		override protected function initialize():void 
		{
			super.initialize();
			
			_buttonOptionsReleased = new Core(Bitmap(new AssetButtonOptionsReleased).bitmapData);
			_buttonOptionsPressed = new Core(Bitmap(new AssetButtonOptionsPressed).bitmapData);
		}
	}
}