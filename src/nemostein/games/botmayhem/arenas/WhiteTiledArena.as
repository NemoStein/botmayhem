package nemostein.games.botmayhem.arenas
{
	import flash.display.Bitmap;
	import nemostein.games.botmayhem.Assets;
	
	public class WhiteTiledArena extends Arena
	{
		override protected function initialize():void
		{
			super.initialize();
			
			addLayer(new ArenaLayer(Bitmap(new Assets.ImageArenasWhiteTiled()).bitmapData));
			addLayer(new ArenaLayer(Bitmap(new Assets.ImageArenasWhiteTiledDirt()).bitmapData));
		}
	}
}