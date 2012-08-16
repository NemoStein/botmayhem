package nemostein.games.botmayhem.weaponry.bullet
{
	import flash.display.BitmapData;
	import nemostein.framework.dragonfly.Core;
	import nemostein.utils.MathUtils;
	
	public class Bullet extends Core
	{	
		protected var bulletSpeed:Number;
		
		public function Bullet()
		{
			super(new BitmapData(15, 15, true, 0xffdf482f));
		}
		
		override protected function initialize():void
		{
			super.initialize();
			
			bulletSpeed = 200;
		}
		
		override protected function update():void
		{
			x += Math.cos(angle) * bulletSpeed * 0.02;
			y += Math.sin(angle) * bulletSpeed * 0.02;
			
			super.update();
		}
		
		public function die(outBounds:Boolean = false):void
		{
		
		}
		
		public function collide(angle:Number, against:Core):void
		{
			die();
		}
	}
}