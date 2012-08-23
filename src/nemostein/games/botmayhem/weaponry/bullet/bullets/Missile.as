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
		private var _maxTurnSpeed:Number;
		
		public function Missile(source:Point, target:Point, angle:Number)
		{
			_target = target;
			_source = source;
			
			super();
			
			this.angle = angle;
		}
		
		override protected function initialize():void
		{
			super.initialize();
			
			x = _source.x;
			y = _source.y;
			
			bulletSpeed = 125;
			_totalDistance = Point.distance(_source, _target);
			
			_maxTurnSpeed = 2;
			
			draw(new BitmapData(15, 5, true, 0xff5f5bdf), true);
			
			alignAnchor(AnchorAlign.CENTER, AnchorAlign.CENTER);
		}
		
		override protected function update():void
		{
			var desiredTurn:Number = MathUtils.piWrap(Math.atan2(_target.y - y, _target.x - x) - angle);
			var turn:Number = desiredTurn;
			
			var turnSpeed:Number = _maxTurnSpeed * time;
			
			if (desiredTurn > turnSpeed)
			{
				turn = turnSpeed;
			}
			else if (desiredTurn < -turnSpeed)
			{
				turn = -turnSpeed;
			}
			
			angle += turn;
			
			//x += Math.cos(angle) * bulletSpeed * time;
			//y += Math.sin(angle) * bulletSpeed * time;
			
			_traveledDistance = Point.distance(_source, new Point(x, y));
			
			if (_traveledDistance >= _totalDistance)
			{
				die();
			}
			
			bulletSpeed *= 1.015;
			
			super.update();
		}
		
		override public function die(outBounds:Boolean = false):void
		{
			// TODO: CinematicsManager needs a new home
			//var silently:Boolean = CinematicService.manager.hit();
			var silently:Boolean = false;
			
			if (!outBounds && !silently)
			{
				var settings:DecalSettings = new DecalSettings(Decals.SCORCH_B);
				
				settings.size = 0.5;
				settings.sizeDeviation = 0.1;
				
				settings.angle = 0;
				settings.angleDeviation = 1;
				
				ArenaService.currentArena.mark(new Point(x, y), settings);
			}
			
			super.die(outBounds);
		}
	}
}