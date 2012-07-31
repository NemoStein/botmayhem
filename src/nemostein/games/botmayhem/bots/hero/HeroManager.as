package nemostein.games.botmayhem.bots.hero
{
	
	public class HeroManager
	{
		private var _hero:Hero;
		
		public function HeroManager(hero:Hero)
		{
			_hero = hero;
		}
		
		public function get hero():Hero
		{
			return _hero;
		}
	}
}