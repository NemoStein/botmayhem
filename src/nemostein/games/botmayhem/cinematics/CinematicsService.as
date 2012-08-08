package nemostein.games.botmayhem.cinematics 
{
	
	public class CinematicsService 
	{
		private static var _manager:CinematicsManager
		
		public static function get manager():CinematicsManager
		{
			if (_manager == null)
			{
				throw new UninitializedError("No CinematicsManager available");
			}
			
			return _manager;
		}
		
		public static function set manager(value:CinematicsManager):void
		{
			_manager = value;
		}
	}
}