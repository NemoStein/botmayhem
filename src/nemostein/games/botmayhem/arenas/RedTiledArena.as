package nemostein.games.botmayhem.arenas
{
	import nemostein.games.botmayhem.Assets;
	
	public class RedTiledArena extends Arena
	{
		
		public function RedTiledArena()
		{
			addChild(new Assets.ImageArenasRedTiled());
		}
	}
}