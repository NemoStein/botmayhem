package nemostein.games.botmayhem.core
{
	import nemostein.framework.dragonfly.Core;
	import nemostein.framework.dragonfly.Game;
	import nemostein.games.botmayhem.BotMayhem;
	import nemostein.games.botmayhem.levels.red.LevelRedA;
	import nemostein.games.botmayhem.menu.Menu;
	
	public class SystemService
	{
		static private var _game:Game;
		static private var _levels:Object = {};
		static private var _currentLevel:Core;
		
		static public function registerGame(game:Game):void
		{
			_game = game;
		}
		
		static public function changeLevel(level:String):void
		{
			if (_currentLevel)
			{
				_game.remove(_currentLevel);
			}
			
			_currentLevel = getLevel(level);
			_game.add(_currentLevel);
		}
		
		static private function getLevel(level:String):Core
		{
			if (!_levels[level])
			{
				if (level == Levels.MENU)
				{
					_levels[level] = new Menu();
				}
				else if (level == Levels.RED_A)
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