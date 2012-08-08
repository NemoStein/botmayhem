package nemostein.games.botmayhem.arenas
{
	
	public class ArenaService
	{
		private static var _factory:ArenaFactory
		private static var _manager:ArenaManager
		
		public static function get factory():ArenaFactory
		{
			if (_factory == null)
			{
				throw new UninitializedError("No ArenaFactory available");
			}
			
			return _factory;
		}
		
		public static function set factory(value:ArenaFactory):void
		{
			_factory = value;
		}
		
		public static function get manager():ArenaManager
		{
			if (_manager == null)
			{
				throw new UninitializedError("No ArenaManager available");
			}
			
			return _manager;
		}
		
		public static function set manager(value:ArenaManager):void
		{
			_manager = value;
		}
	}
}