package nemostein.games.botmayhem.hud.buttons
{
	import flash.display.Bitmap;
	import flash.geom.Point;
	import nemostein.framework.dragonfly.Button;
	import nemostein.framework.dragonfly.Core;
	import nemostein.games.botmayhem.assets.hud.AssetButtonOptionsPressed;
	import nemostein.games.botmayhem.assets.hud.AssetButtonOptionsReleased;
	
	public class OptionsButton extends Button
	{
		private var _buttonOptionsReleased:Core;
		private var _buttonOptionsPressed:Core;
		
		override protected function initialize():void
		{
			super.initialize();
			
			_buttonOptionsReleased = new Core(Bitmap(new AssetButtonOptionsReleased).bitmapData);
			_buttonOptionsPressed = new Core(Bitmap(new AssetButtonOptionsPressed).bitmapData);
			
			_buttonOptionsPressed.die();
			
			add(_buttonOptionsReleased);
			add(_buttonOptionsPressed);
			
			var hitAreaWidth:Number = _buttonOptionsPressed.width;
			var hitAreaHeight:Number = _buttonOptionsPressed.height;
			
			drawHitArea(new Point(0, 0), new Point(hitAreaWidth, 0), new Point(hitAreaWidth, hitAreaHeight));
		}
		
		override public function pressed(point:Point = null):void
		{
			_buttonOptionsReleased.die();
			_buttonOptionsPressed.revive();
			
			super.pressed(point);
		}
		
		override public function released(point:Point = null):void
		{
			_buttonOptionsReleased.revive();
			_buttonOptionsPressed.die();
			
			super.released(point);
		}
	}
}