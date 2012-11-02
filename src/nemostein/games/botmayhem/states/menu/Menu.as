package nemostein.games.botmayhem.states.menu
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import nemostein.framework.dragonfly.Button;
	import nemostein.games.botmayhem.arenas.ArenaService;
	import nemostein.games.botmayhem.arenas.WhiteTiledArena;
	import nemostein.games.botmayhem.bots.hero.Hero;
	import nemostein.games.botmayhem.bots.hero.HeroService;
	import nemostein.games.botmayhem.states.State;
	import nemostein.games.botmayhem.weaponry.weapon.WeaponsService;
	
	public class Menu extends State
	{
		private var _arena:WhiteTiledArena;
		private var _hero:Hero;
		
		// Cinematics
		private var _timer:Timer;
		private var _animate:Boolean;
		private var _animationState:int;
		private var _moveFinished:Boolean;
		
		override protected function initialize():void
		{
			super.initialize();
			
			_arena = ArenaService.whiteTiledArena;
			_hero = HeroService.hero;
			
			_hero.lookAtCursor = true;
			_hero.followTarget = true;
			
			ArenaService.currentArena = _arena;
			
			WeaponsService.removeAreaWeapon(_hero);
			WeaponsService.removeDirectionWeapon(_hero);
			WeaponsService.removeTargetWeaponed(_hero);
			
			WeaponsService.putMenuCinematicCannon(_hero);
			
			add(_arena);
			
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
			
			_moveFinished = true;
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
			if (_moveFinished)
			{
				_moveFinished = false;
				
				switch (_animationState++)
				{
					case 0: 
					{
						_hero.target.x = 805;
						_hero.target.y = 75;
						
						break;
					}
					
					case 1: 
					{
						_hero.target.x = 665;
						_hero.target.y = 265;
						
						break;
					}
					
					case 2: 
					{
						_hero.target.x = 475;
						_hero.target.y = 315;
						
						break;
					}
					
					case 3: 
					{
						_animate = false;
						
						_timer.delay = Math.random() * 3000 + 250;
						_timer.start();
						
						break;
					}
					
					case 4: 
					{
						_hero.target.x = int(Math.random() * 550 + 300);
						_hero.target.y = int(Math.random() * 300 + 50);
						
						_animationState = 3;
					}
				}
			}
			
			if (!_moveFinished)
			{
				_moveFinished = (_hero.x == _hero.target.x) && (_hero.y == _hero.target.y);
			}
		}
	}
}