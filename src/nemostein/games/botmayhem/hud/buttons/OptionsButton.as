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
		private var _releasedAsset:Core;
		private var _pressedAsset:Core;
		
		override protected function initialize():void
		{
			super.initialize();
			
			_releasedAsset = new Core(Bitmap(new AssetButtonOptionsReleased).bitmapData);
			_pressedAsset = new Core(Bitmap(new AssetButtonOptionsPressed).bitmapData);
			
			_pressedAsset.die();
			
			add(_releasedAsset);
			add(_pressedAsset);
			
			var hitAreaWidth:Number = _pressedAsset.width;
			var hitAreaHeight:Number = _pressedAsset.height;
			
			drawHitArea(new Point(0, 0), new Point(hitAreaWidth, 0), new Point(hitAreaWidth, hitAreaHeight));
		}
		
		override public function pressed(point:Point = null):void
		{
			_releasedAsset.die();
			_pressedAsset.revive();
			
			super.pressed(point);
		}
		
		override public function released(point:Point = null):void
		{
			_releasedAsset.revive();
			_pressedAsset.die();
			
			super.released(point);
		}
	}
}