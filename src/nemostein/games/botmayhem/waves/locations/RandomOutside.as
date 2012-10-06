package nemostein.games.botmayhem.waves.locations
{
	import flash.geom.Point;
	
	public class RandomOutside implements SpawnLocation
	{
		public function getLocation():Point
		{
			var point:Point = new Point();
			
			if (Math.random() < 0.666)
			{
				point.x = Math.random() * 900;
				point.y = Math.random() < 0.5 ? -25 - Math.random() * 75 : 625 + Math.random() * 75;
			}
			else
			{
				point.x = Math.random() < 0.5 ? -25 - Math.random() * 75 : 925 + Math.random() * 75;
				point.y = Math.random() * 600;
			}
			
			// TODO: Remove-me!!
			point.x = Math.random() * 900;
			point.y = Math.random() * 600;
			
			return point;
		}
	}
}