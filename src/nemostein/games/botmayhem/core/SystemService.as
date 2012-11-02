package nemostein.games.botmayhem.core
{
	import flash.geom.Rectangle;
	import flash.utils.Dictionary;
	import flash.utils.setTimeout;
	import nemostein.framework.dragonfly.Core;
	import nemostein.framework.dragonfly.Game;
	import nemostein.games.botmayhem.bots.enemies.Enemy;
	import nemostein.games.botmayhem.bots.hero.HeroService;
	import nemostein.games.botmayhem.hud.HUD;
	import nemostein.games.botmayhem.iris.Iris;
	import nemostein.games.botmayhem.states.Level;
	import nemostein.games.botmayhem.states.menu.Menu;
	import nemostein.games.botmayhem.states.State;
	
	public class SystemService
	{
		static private var _game:Game;
		static private var _state:State;
		static private var _states:Dictionary;
		static private var _stateLayer:Core;
		
		static private var _iris:Iris;
		static private var _hud:HUD;
		static private var _nextState:Class;
		
		static public var gamePaused:Boolean;
		
		static public function registerGame(game:Game):void
		{
			if (!_game)
			{
				_game = game;
				
				_states = new Dictionary();
				_stateLayer = new Core();
				
				_hud = new HUD();
				_hud.die();
				
				_iris = new Iris();
				
				game.add(_stateLayer);
				game.add(_hud);
				game.add(_iris);
			}
		}
		
		static public function changeState(stateClass:Class, suppressIris:Boolean = false):void
		{
			_nextState = stateClass;
			
			if(!suppressIris)
			{
				_iris.closeIris(changeToNextState);
			}
			else
			{
				changeToNextState();
			}
		}
		
		static private function changeToNextState():void
		{
			if (_state)
			{
				_state.die();
				_stateLayer.remove(_state);
			}
			
			_state = getState(_nextState);
			
			if (_state is Level)
			{
				_hud.revive();
			}
			
			_state.add(HeroService.hero);
			_stateLayer.add(_state);
			
			_iris.openIris();
		}
		
		static public function showHud():void
		{
			_hud.revive();
		}
		
		static public function hideHud():void
		{
			_hud.die();
		}
		
		static public function pauseGame():void
		{
			_state.deactivate();
			HeroService.hero.deactivate();
			
			gamePaused = true;
		}
		
		static public function unpauseGame():void
		{
			_state.activate();
			HeroService.hero.activate();
			
			gamePaused = false;
		}
		
		static public function currentEnemies():Vector.<Enemy>
		{
			if (_state is Level)
			{
				return Level(_state).enemies;
			}
			
			return null;
		}
		
		static private function getState(stateClass:Class):State
		{
			if (!_states[stateClass])
			{
				_states[stateClass] = new stateClass();
			}
			
			return _states[stateClass];
		}
		
		static public function get gameBounds():Rectangle
		{
			return _game.gameBounds;
		}
	}
}