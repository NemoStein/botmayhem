package nemostein.games.botmayhem.weaponry.weapon
{
	public class WeaponsService
	{
		private static var _factory:WeaponsFactory;
		
		public static function get factory():WeaponsFactory
		{
			if (_factory == null)
			{
				throw new UninitializedError("No WeaponsFactory available");
			}
			
			return _factory;
		}
		
		public static function set factory(value:WeaponsFactory):void
		{
			_factory = value;
		}
	}
}