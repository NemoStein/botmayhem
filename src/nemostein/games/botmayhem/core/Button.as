package nemostein.games.botmayhem.core
{
	import flash.display.Sprite;
	import flash.geom.Point;
	import nemostein.framework.dragonfly.Core;
	import nemostein.games.botmayhem.arenas.ArenaService;
	import nemostein.games.botmayhem.decals.Decals;
	import nemostein.games.botmayhem.decals.DecalSettings;
	
	public class Button extends Core
	{
		// TODO: Hit area?
		protected var hitArea:Core;
		
		public function Button()
		{
		
		}
		
		override protected function initialize():void
		{
			super.initialize();
			
			relativeChildren = true;
		}
		
		public function hit(point:Point = null):void
		{
			visible = false;
			
			var settings:DecalSettings = new DecalSettings(Decals.SCORCH_G);
			
			var areaWidth:Number = hitArea.width;
			var areaHeight:Number = hitArea.height;
			
			settings.size = (areaWidth + areaHeight) / 200;
			settings.sizeDeviation = 0.5;
			
			settings.angle = 0;
			settings.angleDeviation = 1;
			
			var scorchX:Number = x + hitArea.x + hitArea.width / 2;
			var scorchY:Number = y + hitArea.y + hitArea.height / 2;
			
			ArenaService.currentArena.mark(new Point(scorchX, scorchY), settings);
			
			var count:int = int(Math.random() * 5) + 1;
			settings.size *= 1 / count;
			settings.sizeDeviation /= count;
			
			for (var i:int = 0; i < count; i++)
			{
				var positionX:Number = Math.random() * areaWidth + scorchX - areaWidth / 2;
				var positionY:Number = Math.random() * areaHeight + scorchY - areaHeight / 2;
				
				ArenaService.currentArena.mark(new Point(positionX, positionY), settings);
			}
		}
		
		public function enter(point:Point = null):void
		{
		
		}
		
		public function leave(point:Point = null):void
		{
		
		}
		
		private function isInsideTriangle(a:Point, b:Point, c:Point, p:Point):Boolean
		{
			var planeAB:Number = (a.x - p.x) * (b.y - p.y) - (b.x - p.x) * (a.y - p.y);
			var planeBC:Number = (b.x - p.x) * (c.y - p.y) - (c.x - p.x) * (b.y - p.y);
			var planeCA:Number = (c.x - p.x) * (a.y - p.y) - (a.x - p.x) * (c.y - p.y);
			
			var signAB:int = planeAB > 0 ? 1 : planeAB < 0 ? -1 : 0;
			var signBC:int = planeBC > 0 ? 1 : planeBC < 0 ? -1 : 0;
			var signCA:int = planeCA > 0 ? 1 : planeCA < 0 ? -1 : 0;
			
			return signAB == signBC && signBC == signCA;
		}
	}
}