package nemostein.games.botmayhem.menu
{
	import flash.display.Stage;
	import nemostein.framework.dragonfly.Core;
	import nemostein.games.botmayhem.arenas.ArenaService;
	import nemostein.games.botmayhem.arenas.WhiteTiledArena;
	import nemostein.games.botmayhem.bots.hero.Hero;
	import nemostein.games.botmayhem.bots.hero.HeroService;
	import nemostein.games.botmayhem.core.Button;
	import nemostein.games.botmayhem.weaponry.weapon.WeaponsService;
	
	public class Menu extends Core
	{
		private var _arena:WhiteTiledArena;
		private var _hero:Hero;
		private var _stage:Stage;
		
		public function Menu() 
		{
			super();
		}
		
		override protected function initialize():void
		{
			super.initialize();
			
			_arena = ArenaService.whiteTiledArena;
			_hero = HeroService.hero;
			
			ArenaService.currentArena = _arena;
			
			WeaponsService.removeAreaWeapon(_hero);
			WeaponsService.removeDirectionWeapon(_hero);
			WeaponsService.removeTargetWeaponed(_hero);
			
			WeaponsService.putMenuCinematicCannon(_hero);
			
			add(_arena);
			add(_hero);
			
 			var startButton:Button = new StartButton();
			var sponsorButton:Button = new SponsorButton();
			var developerButton:Button = new DeveloperButton();
			var creditsButton:Button = new CreditsButton();
			
			startButton.x = 11;
			startButton.y = 19;
			
			sponsorButton.x = 166;
			sponsorButton.y = 436;
			
			developerButton.x = 28;
			developerButton.y = 393;
			
			creditsButton.x = 670;
			creditsButton.y = 380;
			
			add(startButton);
			add(sponsorButton);
			add(developerButton);
			add(creditsButton);
		}
	}
}