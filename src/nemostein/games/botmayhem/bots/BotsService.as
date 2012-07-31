package nemostein.games.botmayhem.bots
{
	
	public class BotsService
	{
		private static var _manager:BotsManager
		
		public static function get manager():BotsManager
		{
			if (_manager == null)
			{
				throw new UninitializedError("No BotsManager available");
			}
			
			return _manager;
		}
		
		public static function set manager(value:BotsManager):void
		{
			_manager = value;
		}
	}
}