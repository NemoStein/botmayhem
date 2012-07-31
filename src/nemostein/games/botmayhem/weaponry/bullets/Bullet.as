package nemostein.games.botmayhem.weaponry.bullets
{
	import nemostein.controllers.Collidable;
	import nemostein.controllers.Controllable;
	import nemostein.games.botmayhem.core.Entity;
	import nemostein.Updatable;
	
	public class Bullet extends Entity implements Controllable, Collidable, Updatable
	{
		private var _angle:Number;
		private var _bulletSpeed:Number;
		
		public function Bullet()
		{
			_bulletSpeed = 200;
		}
		
		public function update():void
		{
			x += Math.cos(_angle) * _bulletSpeed * 0.02;
			y += Math.sin(_angle) * _bulletSpeed * 0.02;
		}
		
		public function get angle():Number
		{
			return _angle;
		}
		
		public function set angle(value:Number):void
		{
			_angle = value;
		}
		
		public function collide(angle:Number, against:Collidable):void
		{
			BulletsService.manager.remove(this);
		}
	}
}