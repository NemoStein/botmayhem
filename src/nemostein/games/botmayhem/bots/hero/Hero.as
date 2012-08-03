package nemostein.games.botmayhem.bots.hero
{
	import flash.geom.Point;
	import nemostein.games.botmayhem.bots.Bot;
	import nemostein.games.botmayhem.weaponry.AreaWeaponed;
	import nemostein.games.botmayhem.weaponry.DirectionWeaponed;
	import nemostein.games.botmayhem.weaponry.TargetWeaponed;
	import nemostein.games.botmayhem.weaponry.weapon.AreaWeapon;
	import nemostein.games.botmayhem.weaponry.weapon.DirectionWeapon;
	import nemostein.games.botmayhem.weaponry.weapon.TargetWeapon;
	
	public class Hero extends Bot implements AreaWeaponed, DirectionWeaponed, TargetWeaponed
	{
		private var _areaWeapon:AreaWeapon;
		private var _directionWeapon:DirectionWeapon;
		private var _targetWeapon:TargetWeapon;
		
		public function Hero()
		{
			initialize();
		}
		
		public function shootAreaWeapon():void
		{
			if (_areaWeapon)
			{
				_areaWeapon.shoot();
			}
		}
		
		public function shootDirectionWeapon():void
		{
			if (_directionWeapon)
			{
				_directionWeapon.shoot(angle);
			}
		}
		
		public function shootTargetWeapon(target:Point):void
		{
			if (_targetWeapon)
			{
				_targetWeapon.shoot(target);
			}
		}
		
		private function initialize():void
		{
			graphics.beginFill(0xbbbfdf, 1);
			graphics.drawCircle(0, 0, 15);
			graphics.beginFill(0x888fdf, 1);
			graphics.drawCircle(12.5, 0, 7.5);
			graphics.endFill();
		}
		
		public function get areaWeapon():AreaWeapon
		{
			return _areaWeapon;
		}
		
		public function set areaWeapon(value:AreaWeapon):void
		{
			_areaWeapon = value;
		}
		
		public function get directionWeapon():DirectionWeapon
		{
			return _directionWeapon;
		}
		
		public function set directionWeapon(value:DirectionWeapon):void
		{
			_directionWeapon = value;
		}
		
		public function get targetWeapon():TargetWeapon
		{
			return _targetWeapon;
		}
		
		public function set targetWeapon(value:TargetWeapon):void
		{
			_targetWeapon = value;
		}
	}
}