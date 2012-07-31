package nemostein.games.botmayhem.weaponry.bullets
{
	import nemostein.controllers.Collidable;
	import nemostein.games.botmayhem.core.Entity;
	import nemostein.Updatable;
	
	public class BulletsManager implements Updatable
	{
		private var _layer:Entity;
		private var _bullets:Vector.<Bullet>;
		private var _bulletCount:int;
		
		private var _i:int;
		private var _j:int;
		private var _check:Bullet;
		
		public function BulletsManager(layer:Entity)
		{
			_layer = layer;
			_bullets = new Vector.<Bullet>();
			_bulletCount = 0;
		}
		
		public function add(bullet:Bullet):void
		{
			_bullets.push(bullet);
			_layer.addChild(bullet);
			
			++_bulletCount;
		}
		
		public function remove(bullet:Bullet):void
		{
			if (bullet.parent == _layer)
			{
				_layer.removeChild(bullet);
				
				_i = _j = 0;
				while (_i < _bulletCount)
				{
					_check = _bullets[_j];
					
					if (_check != null)
					{
						if (_check == bullet)
						{
							_bullets[_j] = null;
							break;
						}
						
						++_i;
					}
					
					++_j;
				}
				
				--_bulletCount;
			}
		}
		
		public function update():void
		{
			_i = _j = 0;
			while (_i < _bulletCount)
			{
				_check = _bullets[_j];
				
				if (_check != null)
				{
					++_i;
					
					var bulletX:Number = _check.x;
					var bulletY:Number = _check.y;
					
					if (bulletX < 0 || bulletY < 0 || bulletX > 900 || bulletY > 600)
					{
						remove(_check);
						continue;
					}
					
					_check.update();
				}
				
				++_j;
			}
		}
		
		public function bulletsAsCollidable():Vector.<Collidable>
		{
			var collidable:Vector.<Collidable> = new Vector.<Collidable>();
			
			_i = _j = 0;
			while (_i < _bulletCount)
			{
				_check = _bullets[_j];
				
				if (_check != null)
				{
					collidable.push(_check);
					
					++_i;
				}
				
				++_j;
			}
			
			
			return collidable;
		}
	}
}