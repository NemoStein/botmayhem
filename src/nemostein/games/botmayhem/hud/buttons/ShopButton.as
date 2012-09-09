package nemostein.games.botmayhem.hud.buttons
{
	import flash.display.Bitmap;
	import flash.geom.Point;
	import nemostein.framework.dragonfly.Core;
	import nemostein.games.botmayhem.assets.hud.AssetButtonShopPressed;
	import nemostein.games.botmayhem.assets.hud.AssetButtonShopReleased;
	import nemostein.games.botmayhem.core.Button;
	
	public class ShopButton extends Button
	{
		private var _buttonShopReleased:Core;
		private var _buttonShopPressed:Core;
		
		override protected function initialize():void
		{
			super.initialize();
			
			_buttonShopReleased = new Core(Bitmap(new AssetButtonShopReleased).bitmapData);
			_buttonShopPressed = new Core(Bitmap(new AssetButtonShopPressed).bitmapData);
			
			_buttonShopPressed.die();
			
			add(_buttonShopReleased);
			add(_buttonShopPressed);
			
			frame.width = _buttonShopPressed.width;
			frame.height = _buttonShopPressed.height;
		}
		
		override public function onPress(point:Point = null):void
		{
			_buttonShopReleased.die();
			_buttonShopPressed.revive();
			
			super.onPress(point);
		}
		
		override public function onRelease(point:Point = null):void
		{
			_buttonShopReleased.revive();
			_buttonShopPressed.die();
			
			super.onRelease(point);
		}
	}
}