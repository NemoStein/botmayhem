package nemostein.games.botmayhem.arenas
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import nemostein.games.botmayhem.Assets;
	
	public class WhiteTiledArena extends Arena
	{
		private var _dirt:BitmapData;
		
		public function WhiteTiledArena()
		{
			initialize();
		}
		
		private function initialize():void
		{
			addLayer(Bitmap(new Assets.ImageArenasWhiteTiled()).bitmapData);
			addLayer(new BitmapData(width, height, true, 0x25000000));
		}
	}
}