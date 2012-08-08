package nemostein.games.botmayhem.weaponry.bullet
{
	import nemostein.controllers.Collidable;
	import nemostein.controllers.Controllable;
	import nemostein.games.botmayhem.core.Entity;
	import nemostein.Updatable;
	import nemostein.utils.MathUtils;
	
	public class Bullet extends Entity implements Controllable, Collidable, Updatable
	{
		protected var $angle:Number;
		protected var $bulletSpeed:Number;
		
		public function Bullet()
		{
			$bulletSpeed = 200;
		}
		
		public function update():void
		{
			x += Math.cos($angle) * $bulletSpeed * 0.02;
			y += Math.sin($angle) * $bulletSpeed * 0.02;
			
			rotation = MathUtils.deg($angle);
		}
		
		public function get angle():Number
		{
			return $angle;
		}
		
		public function set angle(value:Number):void
		{
			$angle = value;
			rotation = MathUtils.deg($angle);
		}
		
		public function die(outBounds:Boolean = false):void
		{
			
		}
		
		public function collide(angle:Number, against:Collidable):void
		{
			BulletsService.manager.kill(this);
		}
	}
}