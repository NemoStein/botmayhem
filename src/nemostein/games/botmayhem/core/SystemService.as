package nemostein.games.botmayhem.core
{
	
	public class SystemService
	{
		private static var _manager:SystemManager
		
		public static function get manager():SystemManager
		{
			if (_manager == null)
			{
				throw new UninitializedError("No SystemManager available");
			}
			
			return _manager;
		}
		
		public static function set manager(value:SystemManager):void
		{
			_manager = value;
		}
	}
}