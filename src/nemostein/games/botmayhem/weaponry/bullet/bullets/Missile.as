package nemostein.games.botmayhem.weaponry.bullet.bullets
{
	import flash.geom.Point;
	import nemostein.games.botmayhem.arenas.ArenaService;
	import nemostein.games.botmayhem.cinematics.CinematicsService;
	import nemostein.games.botmayhem.decals.Decals;
	import nemostein.games.botmayhem.decals.DecalSettings;
	import nemostein.games.botmayhem.weaponry.bullet.Bullet;
	import nemostein.games.botmayhem.weaponry.bullet.BulletsService;
	import nemostein.utils.MathUtils;
	
	public class Missile extends Bullet
	{
		private var _source:Point;
		private var _target:Point;
		private var _totalDistance:Number;
		private var _traveledDistance:Number;
		
		public function Missile(source:Point, target:Point)
		{
			_target = target;
			_source = source;
			
			initialize();
		}
		
		private function initialize():void
		{
			$bulletSpeed = 125;
			_totalDistance = Point.distance(_source, _target);
			
			// placeholder graphics
			graphics.beginFill(0xdf5f5b, 1);
			graphics.moveTo(-14, -2.25);
			graphics.lineTo(0, -0.5);
			graphics.lineTo(0, 0.5);
			graphics.lineTo(-14, 2.25);
			graphics.endFill();
		}
		
		override public function update():void
		{
			x += Math.cos($angle) * $bulletSpeed * 0.02;
			y += Math.sin($angle) * $bulletSpeed * 0.02;
			
			_traveledDistance = Point.distance(_source, new Point(x, y));
			
			if (_traveledDistance >= _totalDistance)
			{
				BulletsService.manager.kill(this);
			}
			
			var percent:Number = _traveledDistance / _totalDistance * 2;
			if (percent < 1)
			{
				scaleY += 0.025;
				scaleX = percent * scaleY + 0.5;
			}
			else
			{
				scaleY -= 0.025;
				scaleX = (1 - (percent - 1)) * scaleY + 0.5;
			}
			
			$bulletSpeed *= 1.015;
			
			rotation = MathUtils.deg($angle);
		}
		
		override public function die(outBounds:Boolean = false):void
		{
			var silently:Boolean = CinematicsService.manager.hit();
			
			if (!outBounds && !silently)
			{
				var settings:DecalSettings = new DecalSettings(Decals.SCORCH_B);
				
				settings.size = 0.5;
				settings.sizeDeviation = 0.1;
				
				settings.angle = 0;
				settings.angleDeviation = 1;
				
				ArenaService.manager.currentArena.mark(new Point(x, y), settings);
			}
			
			super.die(outBounds);
		}
	}
}