package nemostein.games.botmayhem.bots
{
	import nemostein.controllers.Collidable;
	import nemostein.games.botmayhem.core.Entity;
	
	public class BotsManager
	{
		private var _layer:Entity;
		private var _bots:Vector.<Bot>;
		private var _botCount:int;
		
		private var _i:int;
		private var _j:int;
		private var _check:Bot;
		
		public function BotsManager(layer:Entity)
		{
			_layer = layer;
			_bots = new Vector.<Bot>();
			_botCount = 0;
		}
		
		public function add(bot:Bot):void
		{
			_bots.push(bot);
			_layer.addChild(bot);
			
			++_botCount;
		}
		
		public function remove(bot:Bot):void
		{
			if (bot.parent == _layer)
			{
				_layer.removeChild(bot);
				
				_i = _j = 0;
				while (_i < _botCount)
				{
					_check = _bots[_j];
					
					if (_check != null)
					{
						if (_check == bot)
						{
							_bots[_j] = null;
							break;
						}
						
						++_i;
					}
					
					++_j;
				}
				
				--_botCount;
			}
		}
		
		public function botsAsCollidable():Vector.<Collidable>
		{
			var collidable:Vector.<Collidable> = new <Collidable>[];
			
			_i = _j = 0;
			while (_i < _botCount)
			{
				_check = _bots[_j];
				
				if (_check != null)
				{
					collidable.push(_check);
					
					++_i;
				}
				
				++_j;
			}
			
			return collidable;
		}
		
		public function kill(bot:Bot):void
		{
			bot.die();
			remove(bot);
		}
	}
}