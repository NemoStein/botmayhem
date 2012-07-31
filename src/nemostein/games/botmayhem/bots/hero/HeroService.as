package nemostein.games.botmayhem.bots.hero
{
	
	public class HeroService
	{
		private static var _manager:HeroManager
		
		public static function get manager():HeroManager
		{
			if (_manager == null)
			{
				throw new UninitializedError("No HeroManager available");
			}
			
			return _manager;
		}
		
		public static function set manager(value:HeroManager):void
		{
			_manager = value;
		}
	}
}