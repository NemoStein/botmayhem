package nemostein.games.botmayhem.weaponry.bullet.bullets
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	import nemostein.framework.dragonfly.AnchorAlign;
	import nemostein.games.botmayhem.arenas.ArenaService;
	import nemostein.games.botmayhem.decals.Decals;
	import nemostein.games.botmayhem.decals.DecalSettings;
	import nemostein.games.botmayhem.weaponry.bullet.Bullet;
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
			
			super();
		}
		
		override protected function initialize():void
		{
			super.initialize();
			
			bulletSpeed = 125;
			_totalDistance = Point.distance(_source, _target);
			
			draw(new BitmapData(15, 5, true, 0xffdf5f5b), true);
			
			alignAnchor(AnchorAlign.CENTER, AnchorAlign.CENTER);
		}
		
		override protected function update():void
		{
			x += Math.cos(angle) * bulletSpeed * time;
			y += Math.sin(angle) * bulletSpeed * time;
			
			_traveledDistance = Point.distance(_source, new Point(x, y));
			
			if (_traveledDistance >= _totalDistance)
			{
				die();
			}
			
			var percent:Number = _traveledDistance / _totalDistance * 2;
			if (percent < 1)
			{
				//scaleY += 0.025;
				//scaleX = percent * scaleY + 0.5;
			}
			else
			{
				//scaleY -= 0.025;
				//scaleX = (1 - (percent - 1)) * scaleY + 0.5;
			}
			
			bulletSpeed *= 1.015;
			
			super.update();
		}
		
		override public function die(outBounds:Boolean = false):void
		{
			// TODO: CinematicsManager needs a new home
			//var silently:Boolean = CinematicsService.manager.hit();
			var silently:Boolean = false;
			
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