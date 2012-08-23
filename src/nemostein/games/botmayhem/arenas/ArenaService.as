package nemostein.games.botmayhem.arenas
{
	
	public class ArenaService
	{
		static private var _whiteTiledArena:WhiteTiledArena;
		static private var _redTiledArena:RedTiledArena;
		
		static public var currentArena:Arena;
		
		static public function get whiteTiledArena():WhiteTiledArena
		{
			if (!_whiteTiledArena)
			{
				_whiteTiledArena = new WhiteTiledArena();
			}
			
			return _whiteTiledArena;
		}
		
		static public function get redTiledArena():RedTiledArena
		{
			if (!_redTiledArena)
			{
				_redTiledArena = new RedTiledArena();
			}
			
			return _redTiledArena;
		}
	}
}