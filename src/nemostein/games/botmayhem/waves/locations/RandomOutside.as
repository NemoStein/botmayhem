package nemostein.games.botmayhem.waves.locations
{
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import nemostein.games.botmayhem.core.SystemService;
	
	public class RandomOutside implements SpawnLocation
	{
		public function getLocation():Point
		{
			var point:Point = new Point();
			var bounds:Rectangle = SystemService.gameBounds;
			
			if (Math.random() < 0.5)
			{
				point.x = Math.random() < 0.5 ? bounds.left : bounds.right;
				point.y = Math.random() * bounds.height;
			}
			else
			{
				point.x = Math.random() * bounds.width;
				point.y = Math.random() < 0.5 ? bounds.top : bounds.bottom;
			}
			
			// TODO: Remove-me!!
			//point.x = Math.random() * 900;
			//point.y = Math.random() * 600;
			
			return point;
		}
	}
}