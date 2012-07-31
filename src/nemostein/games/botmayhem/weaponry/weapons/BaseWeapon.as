package nemostein.games.botmayhem.weaponry.weapons
{
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import flash.utils.Timer;
	import nemostein.games.botmayhem.weaponry.bullets.Bullet;
	import nemostein.games.botmayhem.weaponry.bullets.BulletsFactory;
	import nemostein.games.botmayhem.weaponry.bullets.BulletsManager;
	import nemostein.games.botmayhem.weaponry.bullets.BulletsService;
	
	public class BaseWeapon implements Weapon
	{
		private var _bulletsManager:BulletsManager;
		private var _bulletsFactory:BulletsFactory;
		
		private var _ready:Boolean;
		private var _timer:Timer;
		
		public function BaseWeapon()
		{
			initialize();
		}
		
		private function initialize():void
		{
			_bulletsManager = BulletsService.manager;
			_bulletsFactory = BulletsService.factory;
			
			_ready = true;
			_timer = new Timer(0, 1);
			_timer.addEventListener(TimerEvent.TIMER_COMPLETE, onTimerComplete);
		}
		
		private function onTimerComplete(event:TimerEvent):void
		{
			_timer.reset();
			_ready = true;
		}
		
		public function ready():Boolean
		{
			return _ready;
		}
		
		public function shoot(x:Number, y:Number, angle:Number):void
		{
			if (!_ready)
			{
				return;
			}
			
			_ready = false;
			_timer.start();
			
			_bulletsManager.add(_bulletsFactory.getSimpleBullet(x, y, angle));
		}
		
		public function set cooldown(value:Number):void
		{
			if (value < 0 || !isFinite(value) || isNaN(value))
			{
				value = 0;
			}
			
			_timer.delay = value;
		}
		
		public function get cooldown():Number
		{
			return _timer.delay;
		}
	}
}