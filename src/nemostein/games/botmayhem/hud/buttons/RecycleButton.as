package nemostein.games.botmayhem.hud.buttons
{
	import flash.display.Bitmap;
	import flash.geom.Point;
	import nemostein.framework.dragonfly.Button;
	import nemostein.framework.dragonfly.Core;
	import nemostein.games.botmayhem.assets.hud.AssetRecicleButtonDown;
	import nemostein.games.botmayhem.assets.hud.AssetRecicleButtonUp;
	
	public class RecycleButton extends Button
	{
		private var _releasedAsset:Core;
		private var _pressedAsset:Core;
		
		override protected function initialize():void
		{
			super.initialize();
			
			_releasedAsset = new Core(Bitmap(new AssetRecicleButtonUp).bitmapData);
			_pressedAsset = new Core(Bitmap(new AssetRecicleButtonDown).bitmapData);
			
			_pressedAsset.die();
			
			add(_releasedAsset);
			add(_pressedAsset);
			
			frame.width = _pressedAsset.width;
			frame.height = _pressedAsset.height;
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