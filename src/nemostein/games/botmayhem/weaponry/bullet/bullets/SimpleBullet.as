package nemostein.games.botmayhem.weaponry.bullet.bullets
{
	import flash.display.Bitmap;
	import nemostein.framework.dragonfly.AnchorAlign;
	import nemostein.games.botmayhem.assets.decals.AssetScorchA;
	import nemostein.games.botmayhem.assets.weaponry.bullets.AssetSimpleBullet;
	import nemostein.games.botmayhem.bots.enemies.Enemy;
	import nemostein.games.botmayhem.bots.hero.Hero;
	import nemostein.games.botmayhem.weaponry.bullet.Bullet;
	import nemostein.games.botmayhem.weaponry.DamageType;
	
	public class SimpleBullet extends Bullet
	{
		public var onDeath:Function;
		public var fromHero:Boolean;
		
		override protected function initialize():void
		{
			super.initialize();
			
			draw(new AssetSimpleBullet().bitmapData);
			
			alignAnchor(AnchorAlign.CENTER, AnchorAlign.RIGHT);
		}
		
		override protected function update():void
		{
			if (fromHero)
			{
				for each (var enemy:Enemy in enemies) 
				{
					if (isColliding(enemy))
					{
						enemy.hit(1, DamageType.IMPACT);
						die();
					}
				}
			}
			else if (isColliding(hero))
			{
				hero.hit(100, DamageType.IMPACT);
				die();
			}
			
			super.update();
		}
		
		override public function die():void
		{
			onDeath(this);
			if(parent)
			{
				parent.remove(this);
			}
			super.die();
		}
	}
}