package nemostein.games.botmayhem.bots.enemies
{
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import nemostein.framework.dragonfly.AnchorAlign;
	import nemostein.games.botmayhem.bots.enemies.behaviors.ExecuteOnHeroCollision;
	import nemostein.games.botmayhem.bots.enemies.behaviors.StraightFollow;
	import nemostein.games.botmayhem.weaponry.DamageType;
	
	public class Suicider extends Enemy
	{
		private var _explosionStrenght:Number;
		
		override protected function initialize():void
		{
			super.initialize();
			
			frame.width = 35;
			frame.height = 30;
			
			sprite = new BitmapData(frame.width, frame.height, true, 0);
			sprite.fillRect(new Rectangle(0, 0, 30, 30), 0xff4f3b3f);
			sprite.fillRect(new Rectangle(2, 2, 26, 26), 0xffdfbbbf);
			sprite.fillRect(new Rectangle(30, 8, 15, 14), 0xff4f3b3f);
			sprite.fillRect(new Rectangle(22, 10, 11, 10), 0xffbf9b9f);
			sprite.fillRect(new Rectangle(14, 14, 2, 2), 0xff4f4bef);
			
			alignAnchor(AnchorAlign.CENTER, AnchorAlign.CENTER);
			
			maxMoveSpeed *= Math.random() * 0.5 + 0.75;
			maxTurnSpeed *= Math.random() * 0.5 + 0.75;
			
			addBehavior(new StraightFollow());
			addBehavior(new ExecuteOnHeroCollision(onHeroCollision));
			
			_explosionStrenght = 10;
		}
		
		public function onHeroCollision():void 
		{
			hero.hit(_explosionStrenght * 0.8, DamageType.FIRE);
			hero.hit(_explosionStrenght * 0.2, DamageType.IMPACT);
			die();
		}
	}
}