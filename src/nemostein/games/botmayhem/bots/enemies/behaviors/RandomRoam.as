package nemostein.games.botmayhem.bots.enemies.behaviors
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Shape;
	import flash.geom.Point;
	import nemostein.framework.dragonfly.AnchorAlign;
	import nemostein.framework.dragonfly.Core;
	import nemostein.games.botmayhem.bots.enemies.Enemy;
	import nemostein.utils.MathUtils;
	
	public class RandomRoam implements Behavior
	{
		private var _targetDistance:Number;
		private var _targetRadius:Number;
		private var _targetVariance:Number;
		private var _randomAngle:Number;
		
		public function RandomRoam() 
		{
			_targetDistance = Math.random() * 50 + 40;
			_targetRadius = Math.random() * 50 + 40;
			_targetVariance = Math.random() * 1 + 0.25;
		}
		
		public function apply(enemy:Enemy):void 
		{
			/*** Setup ******************************/
			var time:Number = Core.time;
			var turnSpeed:Number = enemy.maxTurnSpeed * time;
			var moveSpeed:Number = enemy.maxMoveSpeed * time;
			
			var angle:Number = enemy.angle;
			var enemyX:Number = enemy.x;
			var enemyY:Number = enemy.y;
			/****************************************/
			
			if (isNaN(_randomAngle))
			{
				_randomAngle = angle;
			}
			
			var areaX:Number = enemyX + Math.cos(angle) * _targetDistance;
			var areaY:Number = enemyY + Math.sin(angle) * _targetDistance;
			
			var targetX:Number = areaX + Math.cos(_randomAngle) * _targetRadius;
			var targetY:Number = areaY + Math.sin(_randomAngle) * _targetRadius;
			
			var desiredAngle:Number = Math.atan2(targetY - enemyY, targetX - enemyX);
			var angleDifference:Number = MathUtils.piWrap(desiredAngle - angle);
			
			_randomAngle = Math.atan2(targetY - areaY, targetX - areaX) + (Math.random() * _targetVariance - _targetVariance / 2);
			
			angle += angleDifference * turnSpeed;
			
			enemy.x += Math.cos(angle) * moveSpeed;
			enemy.y += Math.sin(angle) * moveSpeed;
			enemy.angle = angle;
		}
	}
}