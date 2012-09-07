package nemostein.games.botmayhem.arenas
{
	import flash.display.Bitmap;
	import nemostein.games.botmayhem.assets.arenas.AssetRedTiled;
	
	public class RedTiledArena extends Arena
	{
		override protected function initialize():void
		{
			super.initialize();
			
			addLayer(new ArenaLayer(Bitmap(new AssetRedTiled()).bitmapData));
		}
	}
}