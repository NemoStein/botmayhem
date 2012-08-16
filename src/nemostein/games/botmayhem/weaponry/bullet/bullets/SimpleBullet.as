package nemostein.games.botmayhem.weaponry.bullet.bullets
{
	import nemostein.games.botmayhem.weaponry.bullet.Bullet;
	
	public class SimpleBullet extends Bullet
	{
		public function SimpleBullet()
		{
			
		}
		
		override protected function initialize():void
		{
			super.initialize();
			
			frame.width = 4;
			frame.height = 4;
			
			sprite.fillRect(frame, 0xdf5f5b);
		}
	}
}