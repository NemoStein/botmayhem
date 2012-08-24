package nemostein.games.botmayhem.core
{
	import nemostein.framework.dragonfly.Core;
	import nemostein.framework.dragonfly.Game;
	import nemostein.games.botmayhem.BotMayhem;
	import nemostein.games.botmayhem.bots.hero.HeroService;
	import nemostein.games.botmayhem.levels.Level;
	import nemostein.games.botmayhem.levels.menu.Menu;
	import nemostein.games.botmayhem.levels.red.LevelRedA;
	
	public class SystemService
	{
		static private var _game:Game;
		static private var _levels:Object;
		static private var _levelLayer:Core;
		
		static private var _nextLevel:Level;
		static private var _currentLevel:Level;
		static private var _nextLevelSwipeFinished:Boolean;
		static private var _currentLevelSwipeFinished:Boolean;
		
		static public function registerGame(game:Game):void
		{
			if (!_game)
			{
				_game = game;
				
				_levels = {};
				_levelLayer = new Core();
				
				_game.add(_levelLayer);
				_game.add(HeroService.hero);
				
				//_nextLevelSwipeFinished = true;
				//_currentLevelSwipeFinished = true;
			}
		}
		
		static public function changeLevel(level:String):void
		{
			_nextLevel = getLevel(level);
			_levelLayer.add(_nextLevel);
			
			if (_currentLevel)
			{
				var direction:int;
				
				if (_currentLevel is Menu)
				{
					direction = Level.SWIPE_DOWN;
				}
				else
				{
					direction = int(Math.random() * 4);
				}
				
				if (direction == Level.SWIPE_UP)
				{
					_nextLevel.y = 600;
				}
				else if (direction == Level.SWIPE_DOWN)
				{
					_nextLevel.y = -600;
				}
				else if (direction == Level.SWIPE_LEFT)
				{
					_nextLevel.x = 900;
				}
				else if (direction == Level.SWIPE_RIGHT)
				{
					_nextLevel.x = -900;
				}
				
				_nextLevel.swipeTo(direction);
				_currentLevel.swipeTo(direction);
			}
			else
			{
				_currentLevel = _nextLevel;
			}
		}
		
		static public function swipeFinished(level:Level):void 
		{	
			if (level == _nextLevel)
			{
				_nextLevelSwipeFinished = true;
			}
			else if(level == _currentLevel)
			{
				_currentLevelSwipeFinished = true;
			}
			
			if (_nextLevelSwipeFinished && _currentLevelSwipeFinished)
			{
				_nextLevelSwipeFinished = false;
				_currentLevelSwipeFinished = false;
				
				_levelLayer.remove(_currentLevel);
				_currentLevel = _nextLevel;
				_nextLevel = null;
			}
		}
		
		static private function getLevel(level:String):Level
		{
			if (!_levels[level])
			{
				if (level == Level.MENU)
				{
					_levels[level] = new Menu();
				}
				else if (level == Level.RED_A)
				{
					_levels[level] = new LevelRedA();
				}
				else
				{
					throw new ArgumentError("Level '" + level + "' not known.");
				}
			}
			
			return _levels[level];
		}
	}
}