package nemostein.games.botmayhem.arenas
{
	import flash.display.Bitmap;
	import nemostein.games.botmayhem.assets.arenas.AssetWhiteTiled;
	import nemostein.games.botmayhem.assets.arenas.AssetWhiteTiledDirt;
	
	public class WhiteTiledArena extends Arena
	{
		override protected function initialize():void
		{
			super.initialize();
			
			addLayer(new ArenaLayer(Bitmap(new AssetWhiteTiled()).bitmapData));
			addLayer(new ArenaLayer(Bitmap(new AssetWhiteTiledDirt()).bitmapData));
		}
	}
}