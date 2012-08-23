package nemostein.games.botmayhem.menu
{
	import flash.geom.Point;
	import nemostein.games.botmayhem.arenas.Arena;
	import nemostein.games.botmayhem.arenas.ArenaService;
	import nemostein.games.botmayhem.core.Button;
	import nemostein.games.botmayhem.decals.Decals;
	import nemostein.games.botmayhem.decals.DecalSettings;
	
	internal class MenuButton extends Button
	{
		protected var scorchRadius:Number;
		
		override protected function initialize():void
		{
			super.initialize();
		}
		
		override public function hit(point:Point = null):void
		{
			// User has clicked
			if (point)
			{
				
			}
			
			// Missile has touched the button
			else
			{
				// TODO: Emit particles
				
				visible = false;
				
				var settings:DecalSettings = new DecalSettings(Decals.SCORCH_G);
				
				settings.erase = true;
				settings.size = scorchRadius;
				settings.sizeDeviation = 0.1;
				settings.angleDeviation = 1;
				
				var scorchX:Number = x + hitAreaRect.x + (hitAreaRect.width >> 1);
				var scorchY:Number = y + hitAreaRect.y + (hitAreaRect.height >> 1);
				
				// TODO: Find a way to improve performance
				//ArenaService.currentArena.mark(new Point(scorchX, scorchY), settings);
				
				settings.erase = false;
				settings.size *= 0.5;
				
				ArenaService.currentArena.mark(new Point(scorchX, scorchY), settings, Arena.BOTTOM_LAYER);
				
				// TODO: Exchange this for a particle system
				var count:int = Math.random() * 3 >> 0;
				if (count)
				{
					settings.size *= 0.75;
					
					for (var j:int = 0; j < count; j++)
					{
						var positionX:Number = Math.random() * (hitAreaRect.width >> 1) + scorchX - (hitAreaRect.width >> 2);
						var positionY:Number = Math.random() * (hitAreaRect.height >> 1) + scorchY - (hitAreaRect.height >> 2);
						
						ArenaService.currentArena.mark(new Point(positionX, positionY), settings, Arena.BOTTOM_LAYER);
					}
				}
				
				action();
				
				super.hit(point);
			}
		}
		
		protected function action():void
		{
			
		}
	}
}