package nemostein.games.botmayhem.menu 
{
	import nemostein.controllers.Collidable;
	import nemostein.controllers.Collider;
	import nemostein.controllers.SimpleCollider;
	import nemostein.games.botmayhem.bots.hero.Hero;
	import nemostein.Updatable;
	
	public class StressCollider extends SimpleCollider implements Updatable 
	{
		private var _hero:Hero;
		public var bots:Vector.<Collidable>;
		
		public function StressCollider(hero:Hero) 
		{
			_hero = hero;
		}
		
		public function update():void 
		{
			collideAgainst(_hero, bots);
			//collideGroups(bots, bullets);
			collideAll(bots);
		}
	}
}