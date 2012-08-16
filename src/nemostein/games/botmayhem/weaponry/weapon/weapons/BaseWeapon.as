package nemostein.games.botmayhem.weaponry.weapon.weapons
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import nemostein.games.botmayhem.weaponry.weapon.Weapon;
	
	public class BaseWeapon implements Weapon
	{
		protected var _ready:Boolean;
		protected var _cooldown:Number = 0;
		
		private var _timer:Timer;
		
		public function BaseWeapon()
		{
			initialize();
		}
		
		private function initialize():void
		{
			_ready = true;
			_timer = new Timer(cooldown, 1);
			_timer.addEventListener(TimerEvent.TIMER_COMPLETE, onTimerComplete);
		}
		
		private function onTimerComplete(event:TimerEvent):void
		{
			_timer.delay = cooldown;
			_timer.reset();
			_ready = true;
		}
		
		public function get ready():Boolean 
		{
			return _ready;
		}
		
		public function get cooldown():Number 
		{
			return _cooldown;
		}
	}
}