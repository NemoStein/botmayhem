package nemostein.games.botmayhem.weaponry.bullet.bullets
{
	import nemostein.games.botmayhem.weaponry.bullet.Bullet;
	
	public class SimpleBullet extends Bullet
	{
		public function SimpleBullet()
		{
			graphics.beginFill(0xdf5f5b, 1);
			graphics.drawCircle(0, 0, 2);
			graphics.endFill();
		}
	}
}