package nemostein.games.botmayhem.weaponry.bullets
{
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