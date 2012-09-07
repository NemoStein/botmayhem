package nemostein.games.botmayhem.hud.bars
{
	import flash.display.Bitmap;
	import nemostein.framework.dragonfly.Core;
	import nemostein.framework.dragonfly.Entity;
	import nemostein.games.botmayhem.assets.hud.AssetBlueBarEnd;
	import nemostein.games.botmayhem.assets.hud.AssetBlueBarMiddle;
	import nemostein.games.botmayhem.assets.hud.AssetBlueBarStart;
	import nemostein.games.botmayhem.assets.hud.AssetRedBarEnd;
	import nemostein.games.botmayhem.assets.hud.AssetRedBarMiddle;
	import nemostein.games.botmayhem.assets.hud.AssetRedBarStart;
	import nemostein.games.botmayhem.bots.hero.Hero;
	import nemostein.games.botmayhem.bots.hero.HeroService;
	
	public class Bar extends Entity
	{
		static public const BLUE:String = "blue";
		static public const RED:String = "red";
		
		private var _type:String;
		private var _hero:Hero;
		
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
			
			_hero = HeroService.hero;
			
			if (_type == BLUE)
			{
				_start = new Core(Bitmap(new AssetBlueBarStart).bitmapData);
				_middle = new Core(Bitmap(new AssetBlueBarMiddle).bitmapData);
				_end = new Core(Bitmap(new AssetBlueBarEnd).bitmapData);
				_height = 381;
			}
			else
			{
				_start = new Core(Bitmap(new AssetRedBarStart).bitmapData);
				_middle = new Core(Bitmap(new AssetRedBarMiddle).bitmapData);
				_end = new Core(Bitmap(new AssetRedBarEnd).bitmapData);
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
			var value:Number;
			var maxValue:Number;
			
			if (_type == BLUE)
			{
				value = _hero.shield;
				maxValue = _hero.maxShield;
			}
			else
			{
				value = _hero.hull;
				maxValue = _hero.maxHull;
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