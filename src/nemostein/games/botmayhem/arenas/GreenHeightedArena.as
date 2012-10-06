package nemostein.games.botmayhem.arenas
{
	import flash.display.Bitmap;
	import flash.geom.Rectangle;
	import nemostein.games.botmayhem.assets.arenas.greenish.AssetGreenish;
	
	public class GreenHeightedArena extends Arena
	{
		override protected function initialize():void
		{
			super.initialize();
			
			var bitmap:Bitmap = new AssetGreenish();
			
			bounds = new Rectangle(0, 0, bitmap.width, bitmap.height);
			addLayer(new ArenaLayer(bitmap.bitmapData));
		}
	}
}