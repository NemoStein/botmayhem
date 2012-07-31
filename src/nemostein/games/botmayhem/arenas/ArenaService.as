package nemostein.games.botmayhem.arenas
{
	
	public class ArenaService
	{
		private static var _manager:ArenaManager
		
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