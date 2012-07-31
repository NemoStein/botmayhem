package nemostein.games.botmayhem.bots.hero
{
	import flash.geom.Point;
	import nemostein.games.botmayhem.bots.Bot;
	import nemostein.games.botmayhem.weaponry.HugeWeaponed;
	import nemostein.games.botmayhem.weaponry.LargeWeaponed;
	import nemostein.games.botmayhem.weaponry.SmallWeaponed;
	import nemostein.games.botmayhem.weaponry.weapons.HugeWeapon;
	import nemostein.games.botmayhem.weaponry.weapons.LargeWeapon;
	import nemostein.games.botmayhem.weaponry.weapons.SmallWeapon;
	
	public class Hero extends Bot implements SmallWeaponed, LargeWeaponed, HugeWeaponed
	{
		private var _smallWeapon:SmallWeapon;
		private var _largeWeapon:LargeWeapon;
		private var _hugeWeapon:HugeWeapon;
		
		public function Hero()
		{
			initialize();
		}
		
		private function initialize():void
		{
			graphics.beginFill(0xbbbfdf, 1);
			graphics.drawCircle(0, 0, 15);
			graphics.beginFill(0x888fdf, 1);
			graphics.drawCircle(12.5, 0, 7.5);
			graphics.endFill();
		}
		
		public function smallShoot():void
		{
			if (_smallWeapon)
			{
				_smallWeapon.shoot(x, y, angle);
			}
		}
		
		public function largeShoot():void
		{
			if (_largeWeapon)
			{
				_largeWeapon.shoot(x, y, angle);
			}
		}
		
		public function hugeShoot():void
		{
			if (_hugeWeapon)
			{
				_hugeWeapon.shoot(x, y, angle);
			}
		}
		
		public function get smallWeapon():SmallWeapon
		{
			return _smallWeapon;
		}
		
		public function set smallWeapon(value:SmallWeapon):void
		{
			_smallWeapon = value;
		}
		
		public function get largeWeapon():LargeWeapon
		{
			return _largeWeapon;
		}
		
		public function set largeWeapon(value:LargeWeapon):void
		{
			_largeWeapon = value;
		}
		
		public function get hugeWeapon():HugeWeapon
		{
			return _hugeWeapon;
		}
		
		public function set hugeWeapon(value:HugeWeapon):void
		{
			_hugeWeapon = value;
		}
	}
}