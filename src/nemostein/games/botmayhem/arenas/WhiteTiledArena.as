package nemostein.games.botmayhem.arenas
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import nemostein.framework.dragonfly.Core;
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
			
			addLayer(new ArenaLayer(Bitmap(new Assets.ImageArenasWhiteTiled()).bitmapData));
			addLayer(new ArenaLayer(Bitmap(new Assets.ImageArenasWhiteTiledDirt()).bitmapData));
		}
	}
}