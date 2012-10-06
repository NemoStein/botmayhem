package nemostein.games.botmayhem.hud.bars
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.ColorTransform;
	import nemostein.framework.dragonfly.Core;
	import nemostein.framework.dragonfly.Entity;
	import nemostein.games.botmayhem.assets.hud.AssetBarEnd;
	import nemostein.games.botmayhem.assets.hud.AssetBarMiddle;
	import nemostein.games.botmayhem.assets.hud.AssetBarStart;
	import nemostein.games.botmayhem.bots.hero.Hero;
	import nemostein.games.botmayhem.bots.hero.HeroService;
	
	public class Bar extends Entity
	{
		static public const HULL:String = "hull";
		static public const SHIELD:String = "shield";
		
		private var _type:String;
		private var _hero:Hero;
		
		private var _width:int;
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
			
			var start:BitmapData = new BitmapData(1, 10, true, 0);
			var middle:BitmapData = new BitmapData(1, 10, true, 0);
			var end:BitmapData = new BitmapData(1, 10, true, 0);
			var colorTransform:ColorTransform = new ColorTransform();
			
			if (_type == SHIELD)
			{
				colorTransform.redOffset = -64;
				colorTransform.greenOffset = 0;
				colorTransform.blueOffset = -128;
			}
			else
			{
				colorTransform.redOffset = 0;
				colorTransform.greenOffset = -128;
				colorTransform.blueOffset = -128;
			}
			
			start.draw(Bitmap(new AssetBarStart), null, colorTransform);
			middle.draw(Bitmap(new AssetBarMiddle), null, colorTransform);
			end.draw(Bitmap(new AssetBarEnd), null, colorTransform);
			
			_start = new Core(start);
			_middle = new Core(middle);
			_end = new Core(end);
			_width = 514;
			
			_middle.x = 1;
			_end.x = _width + 1;
			
			add(_start);
			add(_middle);
			add(_end);
		}
		
		override protected function update():void 
		{
			var value:Number;
			var maxValue:Number;
			
			if (_type == SHIELD)
			{
				value = _hero.shield;
				maxValue = _hero.maxShield;
			}
			else
			{
				value = _hero.hull;
				maxValue = _hero.maxHull;
			}
			
			var barScale:int = int(value / maxValue * _width);
			var startPosition:int = _width - barScale;
			
			_middle.scaleX = barScale;
			_end.x = barScale + 1;
			
			super.update();
		}
	}
}