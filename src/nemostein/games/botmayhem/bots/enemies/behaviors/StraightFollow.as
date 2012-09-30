package nemostein.games.botmayhem.bots.enemies.behaviors
{
	import nemostein.framework.dragonfly.Core;
	import nemostein.games.botmayhem.bots.enemies.Enemy;
	import nemostein.games.botmayhem.bots.hero.Hero;
	import nemostein.games.botmayhem.bots.hero.HeroService;
	import nemostein.utils.MathUtils;
	
	public class StraightFollow implements Behavior
	{
		private var _hero:Hero;
		
		public function StraightFollow()
		{
			_hero = HeroService.hero;
		}
		
		public function apply(enemy:Enemy):void
		{
			if (enemy.active && _hero.active)
			{
				var distanceX:Number = _hero.x - enemy.x;
				var distanceY:Number = _hero.y - enemy.y;
				
				if (distanceX || distanceY)
				{
					var time:Number = Core.time;
					var turnSpeed:Number = enemy.maxTurnSpeed * time;
					var moveSpeed:Number = enemy.maxMoveSpeed * time;
					
					var angle:Number = enemy.angle;
					var desiredAngle:Number = Math.atan2(distanceY, distanceX);
					var angleDifference:Number = MathUtils.piWrap(desiredAngle - angle);
					
					angle += angleDifference * turnSpeed;
					
					enemy.x += Math.cos(angle) * moveSpeed;
					enemy.y += Math.sin(angle) * moveSpeed;
					enemy.angle = angle;
				}
			}
		}
	}
}