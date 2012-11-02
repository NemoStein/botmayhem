package nemostein.games.botmayhem.iris
{
	import nemostein.framework.dragonfly.Entity;
	import nemostein.games.botmayhem.assets.iris.AssetIris01;
	import nemostein.games.botmayhem.assets.iris.AssetIris02;
	import nemostein.games.botmayhem.assets.iris.AssetIris03;
	import nemostein.games.botmayhem.assets.iris.AssetIris04;
	import nemostein.games.botmayhem.assets.iris.AssetIris05;
	import nemostein.games.botmayhem.assets.iris.AssetIris06;
	import nemostein.games.botmayhem.assets.iris.AssetIris07;
	import nemostein.games.botmayhem.assets.iris.AssetIris08;
	import nemostein.games.botmayhem.assets.iris.AssetIris09;
	import nemostein.games.botmayhem.assets.iris.AssetIris10;
	import nemostein.games.botmayhem.assets.iris.AssetIris11;
	import nemostein.games.botmayhem.assets.iris.AssetIris12;
	import nemostein.games.botmayhem.assets.iris.AssetIris13;
	import nemostein.games.botmayhem.assets.iris.AssetIris14;
	import nemostein.games.botmayhem.assets.iris.AssetIris15;
	
	public class Iris extends Entity
	{
		private var _frameCount:int;
		private var _frames:Vector.<Entity>;
		private var _frameDelay:Number;
		private var _frameTime:Number;
		private var _currentFrame:int;
		private var _frame:Entity;
		private var _closing:Boolean;
		private var _closed:Boolean;
		private var _callback:Function;
		
		override protected function initialize():void
		{
			setParallax(0, 0);
			
			_frameCount = 15;
			_frames = new Vector.<Entity>(_frameCount, true);
			_frameDelay = 1 / 25;
			_frameTime = 0;
			_currentFrame = 0;
			
			/**/
			_frames[0] = new Entity(new AssetIris01().bitmapData);
			_frames[1] = new Entity(new AssetIris02().bitmapData);
			_frames[2] = new Entity(new AssetIris03().bitmapData);
			_frames[3] = new Entity(new AssetIris04().bitmapData);
			_frames[4] = new Entity(new AssetIris05().bitmapData);
			_frames[5] = new Entity(new AssetIris06().bitmapData);
			_frames[6] = new Entity(new AssetIris07().bitmapData);
			_frames[7] = new Entity(new AssetIris08().bitmapData);
			_frames[8] = new Entity(new AssetIris09().bitmapData);
			_frames[9] = new Entity(new AssetIris10().bitmapData);
			_frames[10] = new Entity(new AssetIris11().bitmapData);
			_frames[11] = new Entity(new AssetIris12().bitmapData);
			_frames[12] = new Entity(new AssetIris13().bitmapData);
			_frames[13] = new Entity(new AssetIris14().bitmapData);
			_frames[14] = new Entity(new AssetIris15().bitmapData);
			
			for (var i:int = 0; i < _frameCount; ++i)
			{
				var frame:Entity = _frames[i];
				frame.die();
				
				add(frame);
			}
			
			_frame = _frames[0];
			_frame.show();
			/**/
			
			die();
			
			super.initialize();
		}
		
		override protected function update():void
		{
			if (_closing && !_closed || !_closing && _closed)
			{
				_frameTime += time;
				
				if (_frameTime >= _frameDelay)
				{
					_frameTime -= _frameDelay;
					
					if (_closing && !_closed)
					{
						_currentFrame++;
						
						if (_currentFrame < _frameCount)
						{
							_frame.hide();
							_frame = _frames[_currentFrame];
							_frame.show();
						}
						else
						{
							_closed = true;
							_currentFrame--;
							_frameTime = 0;
							
							if (_callback)
							{
								_callback();
							}
						}
					}
					else if (!_closing && _closed)
					{
						_currentFrame--;
						_frame.hide();
						
						if (_currentFrame >= 0)
						{
							_frame = _frames[_currentFrame];
							_frame.show();
						}
						else
						{
							_closed = false;
							_currentFrame++;
							_frameTime = 0;
							die();
						}
					}
				}
			}
			
			super.update();
		}
		
		public function closeIris(callback:Function):void
		{
			_callback = callback;
			_closing = true;
			revive();
		}
		
		public function openIris():void
		{
			_closing = false;
		}
	}
}