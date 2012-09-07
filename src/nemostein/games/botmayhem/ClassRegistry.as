package nemostein.games.botmayhem
{	
	import nemostein.games.botmayhem.bots.enemies.Suicider;
	import nemostein.games.botmayhem.waves.Alive;
	import nemostein.games.botmayhem.waves.HeroLife;
	import nemostein.games.botmayhem.waves.locations.RandomOutside;
	import nemostein.games.botmayhem.waves.Time;
	
	public class ClassRegistry
	{
		static public function register():void
		{
			Suicider;
			Alive;
			HeroLife;
			Time;
			RandomOutside;
		}
	}
}