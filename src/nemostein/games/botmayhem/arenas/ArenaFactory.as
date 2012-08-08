package nemostein.games.botmayhem.arenas
{
	
	public class ArenaFactory
	{
		private var _whiteTiledArena:WhiteTiledArena;
		
		public function ArenaFactory()
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