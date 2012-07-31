package nemostein.games.botmayhem.arenas
{
	
	public class ArenaManager
	{
		private var _whiteTiledArena:WhiteTiledArena;
		
		public function ArenaManager()
		{
		
		}
		
		public function get whiteTiledArena():WhiteTiledArena
		{
			if (!_whiteTiledArena)
			{
				_whiteTiledArena = new WhiteTiledArena();
			}
			
			return _whiteTiledArena;
		}
	}
}