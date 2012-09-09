package nemostein.games.botmayhem.bots.enemies
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import nemostein.framework.dragonfly.AnchorAlign;
	import nemostein.games.botmayhem.bots.enemies.behaviors.ExecuteOnHeroCollision;
	import nemostein.games.botmayhem.bots.enemies.behaviors.RandomRoam;
	import nemostein.games.botmayhem.bots.enemies.behaviors.StraightFollow;
	import nemostein.games.botmayhem.weaponry.DamageType;
	import nemostein.io.Keys;
	
	public class Suicider extends Enemy
	{
		private var _explosionStrenght:Number;
		private var _atackRange:Number;
		
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
			
			_atackRange = 200;
			
			addBehavior(ROAMING, new RandomRoam());
			
			addBehavior(ATACKING, new StraightFollow());
			addBehavior(ATACKING, new ExecuteOnHeroCollision(die));
			
			state = ROAMING;
			
			_explosionStrenght = 10;
		}
		
		override protected function update():void 
		{
			var distanceX:Number = hero.x - x;
			var distanceY:Number = hero.y - y;
			var distanceSquare:Number = distanceX * distanceX + distanceY * distanceY;
			
			if (state != ATACKING && distanceSquare < _atackRange * _atackRange)
			{
				state = ATACKING;
			}
			else if (state == ATACKING)
			{
				state = ROAMING;
			}
			
			super.update();
		}
		
		override public function die():void 
		{
			hero.hit(_explosionStrenght * 0.8, DamageType.FIRE);
			hero.hit(_explosionStrenght * 0.2, DamageType.IMPACT);
			
			super.die();
		}
	}
}