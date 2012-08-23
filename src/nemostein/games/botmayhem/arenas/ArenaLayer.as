package nemostein.games.botmayhem.arenas 
{
	import flash.display.BitmapData;
	import nemostein.framework.dragonfly.Core;
	
	public class ArenaLayer extends Core 
	{
		
		public function ArenaLayer(contents:BitmapData) 
		{
			super(contents);
		}
		
		public function get data():BitmapData 
		{
			return sprite;
		}
	}
}