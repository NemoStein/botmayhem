package nemostein.games.botmayhem.arenas 
{
	import flash.display.BitmapData;
	import nemostein.framework.dragonfly.Entity;
	
	public class ArenaLayer extends Entity
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