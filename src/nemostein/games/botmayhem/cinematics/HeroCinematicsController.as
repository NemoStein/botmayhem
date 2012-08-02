package nemostein.games.botmayhem.cinematics
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import nemostein.controllers.SimpleHybridController;
	import nemostein.games.botmayhem.bots.hero.Hero;
	import nemostein.games.botmayhem.core.SystemService;
	import nemostein.io.UserInput;
	
	public class HeroCinematicsController extends SimpleHybridController
	{
		private var _animationState:int;
		private var _cinematicInput:CinematicInput;
		
		private var _animate:Boolean = true;
		private var _horizontalFinished:Boolean = true;
		private var _verticalFinished:Boolean = true;
		private var _targetX:int;
		private var _targetY:int;
		private var _toRight:Boolean;
		private var _toDown:Boolean;
		private var _timer:Timer;
		
		public function HeroCinematicsController(hero:Hero, stage:Stage)
		{
			_cinematicInput = new CinematicInput(stage, this);
			super(_cinematicInput, hero);
		}
		
		protected override function initialize():void
		{
			super.initialize();
			
			_moveSpeed = 60;
			
			_timer = new Timer(0, 1);
			_timer.addEventListener(TimerEvent.TIMER_COMPLETE, onTimerTimerComplete);
		}
		
		public override function update():void
		{
			super.update();
			
			runMenuScript();
			
			if (_input.justPressed(UserInput.LEFT_MOUSE))
			{
				Hero(_target).largeShoot();
			}
		}
		
		private function onTimerTimerComplete(event:TimerEvent):void
		{
			_animate = true;
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
						
						break;
					}
					
					default: 
					{
						_animationState = 3;
					}
				}
				
				_toRight = target.x < _targetX;
				_toDown = target.y < _targetY;
			}
			
			if (_animate)
			{
				if (!_horizontalFinished)
				{
					if (target.x < _targetX)
					{
						_cinematicInput.pressRight();
						_horizontalFinished = !_toRight;
					}
					else
					{
						_cinematicInput.pressLeft();
						_horizontalFinished = _toRight;
					}
					
					if (_horizontalFinished)
					{
						_cinematicInput.releaseRight();
						_cinematicInput.releaseLeft();
					}
				}
				
				if (!_verticalFinished)
				{
					if (target.y < _targetY)
					{
						_cinematicInput.pressDown();
						_verticalFinished = !_toDown;
					}
					else
					{
						_cinematicInput.pressUp();
						_verticalFinished = _toDown;
					}
					
					if (_verticalFinished)
					{
						_cinematicInput.releaseDown();
						_cinematicInput.releaseUp();
					}
				}
			}
		}
	}
}