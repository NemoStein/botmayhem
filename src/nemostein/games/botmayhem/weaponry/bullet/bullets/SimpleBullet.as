package nemostein.games.botmayhem.weaponry.bullet.bullets
{
	import flash.display.BitmapData;
	import nemostein.framework.dragonfly.AnchorAlign;
	import nemostein.games.botmayhem.assets.weaponry.bullets.AssetSimpleBullet;
	import nemostein.games.botmayhem.weaponry.bullet.Bullet;
	
	public class SimpleBullet extends Bullet
	{
		public var onDeath:Function;
		
		override protected function initialize():void
		{
			super.initialize();
			
			draw(new AssetSimpleBullet().bitmapData);
			
			alignAnchor(AnchorAlign.CENTER, AnchorAlign.RIGHT);
		}
		
		override public function die():void 
		{
			onDeath(this);
			parent.remove(this);
			super.die();
		}
		
		//override public function revive():void 
		//{
			//super.revive();
		//}
	}
}