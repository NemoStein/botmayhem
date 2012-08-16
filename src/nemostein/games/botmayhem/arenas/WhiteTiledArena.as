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
			
		}
		
		override protected function initialize():void
		{
			super.initialize();
			
			addLayer(Bitmap(new Assets.ImageArenasWhiteTiled()).bitmapData);
			addLayer(new BitmapData(900, 600, true, 0x25808080));
		}
	}
}