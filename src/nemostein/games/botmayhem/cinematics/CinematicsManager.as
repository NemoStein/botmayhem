package nemostein.games.botmayhem.cinematics
{
	import flash.geom.Point;
	import nemostein.games.botmayhem.bots.hero.HeroService;
	import nemostein.games.botmayhem.core.Button;
	import nemostein.games.botmayhem.weaponry.bullet.bullets.Missile;
	import nemostein.games.botmayhem.weaponry.bullet.bullets.SimpleBullet;
	import nemostein.games.botmayhem.weaponry.bullet.BulletsService;
	
	public class CinematicsManager
	{
		private var _ready:Boolean = true;
		private var _button:Button;
		
		public function CinematicsManager()
		{
		
		}
		
		public function get shotReady():Boolean
		{
			return _ready;
		}
		
		public function shootAt(from:Point, to:Point):void
		{
			if (_ready)
			{
				var missile:Missile = BulletsService.factory.getMissile(from, to, Math.atan2(to.y - from.y, to.x - from.x));
				
				BulletsService.manager.add(missile);
				
				_ready = false;
			}
		}
		
		public function hit():Boolean 
		{
			_ready = true;
			
			if (_button)
			{
				_button.hit(null);
				_button = null;
				
				return true;
			}
			
			return false;
		}
		
		public function targetButton(button:Button):void 
		{
			if(!_button)
			{
				_button = button;
			}
		}
	}
}