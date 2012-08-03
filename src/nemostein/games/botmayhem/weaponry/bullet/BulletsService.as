package nemostein.games.botmayhem.weaponry.bullet
{
	
	public class BulletsService
	{
		private static var _factory:BulletsFactory
		private static var _manager:BulletsManager
		
		public static function get factory():BulletsFactory
		{
			if (_factory == null)
			{
				throw new UninitializedError("No BulletsFactory available");
			}
			
			return _factory;
		}
		
		public static function set factory(value:BulletsFactory):void
		{
			_factory = value;
		}
		
		public static function get manager():BulletsManager
		{
			if (_manager == null)
			{
				throw new UninitializedError("No BulletsManager available");
			}
			
			return _manager;
		}
		
		public static function set manager(value:BulletsManager):void
		{
			_manager = value;
		}
	}
}