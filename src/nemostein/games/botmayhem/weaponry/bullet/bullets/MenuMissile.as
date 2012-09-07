package nemostein.games.botmayhem.weaponry.bullet.bullets
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	import nemostein.framework.dragonfly.AnchorAlign;
	import nemostein.games.botmayhem.arenas.ArenaService;
	import nemostein.games.botmayhem.decals.Decals;
	import nemostein.games.botmayhem.decals.DecalSettings;
	import nemostein.games.botmayhem.levels.menu.CinematicService;
	import nemostein.games.botmayhem.weaponry.bullet.Bullet;
	import nemostein.utils.MathUtils;
	
	public class MenuMissile extends Bullet
	{
		private var _source:Point;
		private var _target:Point;
		private var _totalDistance:Number;
		private var _traveledDistance:Number;
		private var _maxTurnSpeed:Number;
		
		public function MenuMissile(source:Point, target:Point, angle:Number)
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
			
			bulletSpeed = 25;
			_totalDistance = Point.distance(_source, _target);
			
			_maxTurnSpeed = 2;
			
			draw(new BitmapData(15, 5, true, 0xff5f5bdf));
			
			alignAnchor(AnchorAlign.CENTER, AnchorAlign.CENTER);
		}
		
		override protected function update():void
		{
			var distanceX:Number = _target.x - x;
			var distanceY:Number = _target.y - y;
			
			var distanceSquare:Number = distanceX * distanceX + distanceY * distanceY;
			
			if (distanceSquare)
			{
				var moveSpeed:Number = bulletSpeed * time;
				var turnSpeed:Number = _maxTurnSpeed * time + moveSpeed * time;
				
				//angle = MathUtils.piWrap(angle);
				
				var targetAngle:Number = Math.atan2(distanceY, distanceX);
				var angleDifference:Number = MathUtils.piWrap(targetAngle - angle);
				
				angle += angleDifference * turnSpeed;
				
				if(moveSpeed * moveSpeed < distanceSquare)
				{
					x += Math.cos(angle) * moveSpeed;
					y += Math.sin(angle) * moveSpeed;
				}
				else
				{
					x = _target.x;
					y = _target.y;
					
					die();
				}
				
				bulletSpeed *= 1.0333;
			}
			else
			{
				die();
			}
			
			super.update();
		}
		
		override public function die():void
		{
			CinematicService.executeButtonAction();
			
			super.die();
		}
	}
}