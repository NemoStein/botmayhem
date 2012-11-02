package nemostein.games.botmayhem.states
{
	import nemostein.games.botmayhem.bots.enemies.Enemy;
	import nemostein.games.botmayhem.bots.hero.Hero;
	import nemostein.games.botmayhem.bots.hero.HeroService;
	
	public class Level extends State
	{
		public var enemies:Vector.<Enemy>;
		
		override protected function initialize():void
		{
			super.initialize();
			
			enemies = new Vector.<Enemy>();
		}
		
		public function addEnemy(enemy:Enemy):void
		{
			enemies.push(enemy);
			add(enemy);
		}
	}
}