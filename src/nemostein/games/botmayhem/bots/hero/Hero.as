package nemostein.games.botmayhem.bots.hero
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import nemostein.framework.dragonfly.AnchorAlign;
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
			
		}
		
		override protected function initialize():void
		{
			super.initialize();
			
			frame.width = 35;
			frame.height = 30;
			
			alignAnchor(AnchorAlign.CENTER, AnchorAlign.CENTER);
			
			sprite = new BitmapData(frame.width, frame.height, true, 0);
			sprite.fillRect(new Rectangle(0, 0, 30, 30), 0xffbbbfdf);
			sprite.fillRect(new Rectangle(20, 10, 15, 10), 0xff9b9fbf);
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