package nemostein.games.botmayhem.menu
{
	import flash.display.Stage;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import nemostein.framework.dragonfly.Core;
	import nemostein.games.botmayhem.arenas.ArenaService;
	import nemostein.games.botmayhem.arenas.WhiteTiledArena;
	import nemostein.games.botmayhem.bots.hero.Hero;
	import nemostein.games.botmayhem.bots.hero.HeroService;
	import nemostein.games.botmayhem.core.Button;
	import nemostein.games.botmayhem.weaponry.weapon.WeaponsService;
	
	public class Menu extends Core
	{
		private var _arena:WhiteTiledArena;
		private var _hero:Hero;
		private var _stage:Stage;
		
		// Cinematics
		private var _timer:Timer;
		private var _animate:Boolean;
		private var _animationState:int;
		private var _targetX:int;
		private var _targetY:int;
		private var _horizontalFinished:Boolean;
		private var _verticalFinished:Boolean;
		private var _toRight:Boolean;
		private var _toDown:Boolean;
		
		public function Menu()
		{
			super();
		}
		
		override protected function initialize():void
		{
			super.initialize();
			
			_arena = ArenaService.whiteTiledArena;
			_hero = HeroService.hero;
			
			ArenaService.currentArena = _arena;
			
			WeaponsService.removeAreaWeapon(_hero);
			WeaponsService.removeDirectionWeapon(_hero);
			WeaponsService.removeTargetWeaponed(_hero);
			
			WeaponsService.putMenuCinematicCannon(_hero);
			
			add(_arena);
			add(_hero);
			
			var startButton:Button = new StartButton();
			var developerButton:Button = new DeveloperButton();
			var sponsorButton:Button = new SponsorButton();
			var creditsButton:Button = new CreditsButton();
			
			startButton.x = 11;
			startButton.y = 19;
			
			developerButton.x = 28;
			developerButton.y = 393;
			
			sponsorButton.x = 166;
			sponsorButton.y = 436;
			
			creditsButton.x = 670;
			creditsButton.y = 380;
			
			add(startButton);
			add(developerButton);
			add(sponsorButton);
			add(creditsButton);
			
			_timer = new Timer(0, 1);
			_timer.addEventListener(TimerEvent.TIMER_COMPLETE, onTimerTimerComplete);
			
			_animate = true;
			
			_horizontalFinished = true;
			_verticalFinished = true;
		}
		
		private function onTimerTimerComplete(e:TimerEvent):void
		{
			_animate = true;
		}
		
		override protected function update():void
		{
			if (_animate)
			{
				runMenuScript();
			}
			
			super.update();
		}
		
		public function runMenuScript():void
		{
			if (_horizontalFinished && _verticalFinished)
			{
				_horizontalFinished = false;
				_verticalFinished = false;
				
				switch (_animationState++)
				{
					case 0: 
					{
						_targetX = 805;
						_targetY = 75;
						
						break;
					}
					
					case 1: 
					{
						_targetX = 665;
						_targetY = 265;
						
						break;
					}
					
					case 2: 
					{
						_targetX = 475;
						_targetY = 315;
						
						break;
					}
					
					case 3: 
					{
						_targetX = int(Math.random() * 550 + 300);
						_targetY = int(Math.random() * 300 + 50);
						
						_animate = false;
						
						_timer.delay = Math.random() * 3000 + 250;
						_timer.start();
						
						--_animationState;
						
						break;
					}
				}
				
				_toRight = _hero.x < _targetX;
				_toDown = _hero.y < _targetY;
			}
			
			var distanceX:Number = _targetX - _hero.x;
			var distanceY:Number = _targetY - _hero.y;
			
			var moveAngle:Number = Math.atan2(distanceY, distanceX);
			var moveSpeed:Number = 100 * elapsed / 1000;
			
			_hero.x += Math.cos(moveAngle) * moveSpeed;
			_hero.y += Math.sin(moveAngle) * moveSpeed;
			
			if (!_horizontalFinished)
			{
				if (_hero.x < _targetX)
				{
					_horizontalFinished = !_toRight;
				}
				else
				{
					_horizontalFinished = _toRight;
				}
			}
			
			if (!_verticalFinished)
			{
				if (_hero.y < _targetY)
				{
					_verticalFinished = !_toDown;
				}
				else
				{
					_verticalFinished = _toDown;
				}
			}
		}
	}
}