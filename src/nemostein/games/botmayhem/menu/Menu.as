package nemostein.games.botmayhem.menu
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import nemostein.controllers.SimpleCollider;
	import nemostein.controllers.SimpleSeeker;
	import nemostein.games.botmayhem.arenas.Arena;
	import nemostein.games.botmayhem.arenas.ArenaService;
	import nemostein.games.botmayhem.arenas.WhiteTiledArena;
	import nemostein.games.botmayhem.bots.BotsManager;
	import nemostein.games.botmayhem.bots.BotsService;
	import nemostein.games.botmayhem.bots.hero.Hero;
	import nemostein.games.botmayhem.bots.hero.HeroService;
	import nemostein.games.botmayhem.bots.SimpleBot;
	import nemostein.games.botmayhem.cinematics.CinematicsService;
	import nemostein.games.botmayhem.cinematics.HeroCinematicsController;
	import nemostein.games.botmayhem.core.Button;
	import nemostein.games.botmayhem.core.SystemService;
	import nemostein.games.botmayhem.decals.Decals;
	import nemostein.games.botmayhem.decals.DecalSettings;
	import nemostein.games.botmayhem.weaponry.weapon.WeaponsFactory;
	import nemostein.games.botmayhem.weaponry.weapon.WeaponsService;
	import nemostein.ui.RandomClicker;
	
	public class Menu extends Sprite
	{
		private var _arena:WhiteTiledArena;
		private var _hero:Hero;
		
		public function Menu()
		{
			initialize();
		}
		
		private function initialize():void
		{
			mouseEnabled = false;
			
			_arena = ArenaService.factory.whiteTiledArena;
			_hero = HeroService.manager.hero;
			
			ArenaService.manager.currentArena = _arena;
			
			var weaponsFactory:WeaponsFactory = WeaponsService.factory;
			
			weaponsFactory.removeAreaWeapon(_hero);
			weaponsFactory.removeDirectionWeapon(_hero);
			weaponsFactory.removeTargetWeaponed(_hero);
			
			weaponsFactory.putMenuCinematicCannon(_hero);
			
			addChild(_arena);
			addChild(_hero);
			
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
			createButtons();
			startCinematics();
			
			addEventListener(MouseEvent.CLICK, onClick);
			
			/**
			// ============================================================
			// === STRESS TEST ============================================
			var seeker:SimpleSeeker = new SimpleSeeker(_hero);
			var collider:StressCollider = new StressCollider(_hero);
			
			var botsManager:BotsManager = BotsService.manager;
			for (var i:int = 0; i < 25; i++) 
			{
				var bot:SimpleBot = new SimpleBot();
				botsManager.add(bot);
				seeker.addSource(bot);
				addChild(bot);
			}
			
			collider.bots = botsManager.botsAsCollidable();
			
			SystemService.manager.addUpdatable(seeker);
			SystemService.manager.addUpdatable(collider);
			
			var randomClicker:RandomClicker = new RandomClicker(_arena);
			randomClicker.start(5000);
			// === STRESS TEST ============================================
			// ============================================================
			/**/
		}
		
		private function startCinematics():void
		{
			var heroCinematicsController:HeroCinematicsController = new HeroCinematicsController(_hero, stage);
			
			SystemService.manager.addUpdatable(heroCinematicsController);
			
			heroCinematicsController.runMenuScript();
		}
		
		private function createButtons():void
		{
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
			
			addChild(startButton);
			addChild(sponsorButton);
			addChild(developerButton);
			addChild(creditsButton);
		}
		
		private function onClick(event:MouseEvent):void
		{
			var target:Object = event.target;
			
			if (target is Button)
			{
				CinematicsService.manager.targetButton(Button(target));
			}
		}
	}
}