package nemostein.games.botmayhem.bots.enemies
{
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import nemostein.framework.dragonfly.AnchorAlign;
	import nemostein.games.botmayhem.bots.enemies.behaviors.ExecuteOnHeroCollision;
	import nemostein.games.botmayhem.bots.enemies.behaviors.RandomRoam;
	import nemostein.games.botmayhem.bots.enemies.behaviors.StraightFollow;
	import nemostein.games.botmayhem.weaponry.DamageType;
	
	public class Suicider extends Enemy
	{
		private var _explosionStrenght:Number;
		private var _atackRangeSquare:Number;
		private var _explosionRangeSquare:Number;
		
		private var _heroDistanceX:Number;
		private var _heroDistanceY:Number;
		private var _heroDistanceSquare:Number;
		
		override protected function initialize():void
		{
			super.initialize();
			
			var bitmapData:BitmapData = new BitmapData(35, 30, true, 0);
			bitmapData.fillRect(new Rectangle(0, 0, 30, 30), 0xff4f3b3f);
			bitmapData.fillRect(new Rectangle(2, 2, 26, 26), 0xffdfbbbf);
			bitmapData.fillRect(new Rectangle(30, 8, 15, 14), 0xff4f3b3f);
			bitmapData.fillRect(new Rectangle(22, 10, 11, 10), 0xffbf9b9f);
			bitmapData.fillRect(new Rectangle(14, 14, 2, 2), 0xff4f4bef);
			
			draw(bitmapData);
			
			alignAnchor(AnchorAlign.CENTER, AnchorAlign.CENTER);
			
			maxMoveSpeed *= Math.random() * 0.5 + 0.75;
			maxTurnSpeed *= Math.random() * 0.5 + 0.75;
			
			_atackRangeSquare = 250 * 250;
			_explosionRangeSquare = 75 * 75;
			
			addBehavior(ROAMING, new RandomRoam());
			
			addBehavior(ATACKING, new StraightFollow());
			addBehavior(ATACKING, new ExecuteOnHeroCollision(die));
			
			state = ROAMING;
			
			_explosionStrenght = 10;
		}
		
		override protected function update():void
		{
			_heroDistanceX = hero.x - x;
			_heroDistanceY = hero.y - y;
			_heroDistanceSquare = _heroDistanceX * _heroDistanceX + _heroDistanceY * _heroDistanceY;
			
			if (state != ATACKING && _heroDistanceSquare < _atackRangeSquare)
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
			if (_heroDistanceSquare < _explosionRangeSquare)
			{
				hero.hit(_explosionStrenght * 0.8, DamageType.FIRE);
				hero.hit(_explosionStrenght * 0.2, DamageType.IMPACT);
			}
			
			super.die();
		}
	}
}