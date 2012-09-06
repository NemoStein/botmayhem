package nemostein.games.botmayhem.hud.bars
{
	import flash.display.Bitmap;
	import nemostein.framework.dragonfly.Core;
	import nemostein.framework.dragonfly.Entity;
	import nemostein.games.botmayhem.Assets;
	
	public class Bar extends Entity
	{
		static public const BLUE:String = "blue";
		static public const RED:String = "red";
		
		public var maxValue:Number;
		public var value:Number;
		
		private var _type:String;
		
		private var _height:int;
		private var _start:Core;
		private var _middle:Core;
		private var _end:Core;
		
		public function Bar(type:String)
		{
			_type = type;
			
			super();
		}
		
		override protected function initialize():void
		{
			super.initialize();
			
			maxValue = 1;
			value = 1;
			
			if (_type == BLUE)
			{
				_start = new Core(Bitmap(new Assets.ImageHudBlueBarStart).bitmapData);
				_middle = new Core(Bitmap(new Assets.ImageHudBlueBarMiddle).bitmapData);
				_end = new Core(Bitmap(new Assets.ImageHudBlueBarEnd).bitmapData);
				_height = 381;
			}
			else
			{
				_start = new Core(Bitmap(new Assets.ImageHudRedBarStart).bitmapData);
				_middle = new Core(Bitmap(new Assets.ImageHudRedBarMiddle).bitmapData);
				_end = new Core(Bitmap(new Assets.ImageHudRedBarEnd).bitmapData);
				_height = 390;
			}
			
			_middle.y = 1;
			_end.y = _height + 1;
			
			add(_start);
			add(_middle);
			add(_end);
		}
		
		override protected function update():void 
		{
			if (value < 0)
			{
				value = 0;
			}
			
			var barScale:int = int(value / maxValue * _height);
			var startPosition:int = _height - barScale;
			
			_middle.scaleY = barScale;
			_start.y = startPosition;
			_middle.y = startPosition + 1
			
			super.update();
		}
	}
}