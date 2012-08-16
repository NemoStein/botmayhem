package nemostein.games.botmayhem.arenas
{
	
	public class ArenaService
	{
		static private var _whiteTiledArena:WhiteTiledArena;
		static public var currentArena:Arena;
		
		static public function get whiteTiledArena():WhiteTiledArena
		{
			if (!_whiteTiledArena)
			{
				_whiteTiledArena = new WhiteTiledArena();
			}
			
			return _whiteTiledArena;
		}
	}
}