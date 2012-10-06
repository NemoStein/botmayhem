package nemostein.games.botmayhem.weaponry.bullet
{
	import nemostein.framework.dragonfly.Core;
	import nemostein.framework.dragonfly.Entity;
	import nemostein.games.botmayhem.bots.enemies.Enemy;
	import nemostein.games.botmayhem.bots.hero.Hero;
	import nemostein.games.botmayhem.weaponry.weapon.Weapon;
	
	public class Bullet extends Entity
	{
		public var hero:Hero;
		public var weapon:Weapon;
		public var enemies:Vector.<Enemy>;
		
		protected var bulletSpeed:Number;
		
		override protected function initialize():void
		{
			super.initialize();
			
			relative = false;
			
			reset();
		}
		
		override protected function update():void
		{
			if (x < bounds.x || y < bounds.y || x > bounds.x + bounds.width || y > bounds.y + bounds.height)
			{
				die();
			}
			
			var moveSpeed:Number = bulletSpeed * time;
			
			x += Math.cos(angle) * moveSpeed;
			y += Math.sin(angle) * moveSpeed;
			
			super.update();
		}
		
		public function collide(angle:Number, against:Core):void
		{
			die();
		}
		
		public function reset():void 
		{
			bulletSpeed = 200;
			revive();
		}
	}
}