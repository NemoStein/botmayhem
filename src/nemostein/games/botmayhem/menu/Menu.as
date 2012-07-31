package nemostein.games.botmayhem.menu
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import nemostein.games.botmayhem.arenas.ArenaService;
	import nemostein.games.botmayhem.arenas.WhiteTiledArena;
	import nemostein.games.botmayhem.bots.hero.Hero;
	import nemostein.games.botmayhem.bots.hero.HeroService;
	import nemostein.games.botmayhem.cinematics.HeroCinematicsController;
	import nemostein.games.botmayhem.core.Button;
	import nemostein.games.botmayhem.core.SystemService;
	import nemostein.games.botmayhem.weaponry.weapons.WeaponsService;
	
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
			
			_arena = ArenaService.manager.whiteTiledArena;
			_hero = HeroService.manager.hero;
			
			WeaponsService.factory.putHugeWeapon(_hero);
			
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
				var button:Button = Button(target);
				
					//button.hit(new Point(event.localX, event.localY));
			}
			//else if (target is Arena)
			//{
			//var settings:DecalSettings = new DecalSettings([
			//Decals.SCORCH_A,
			//Decals.SCORCH_B,
			//Decals.SCORCH_C,
			//Decals.SCORCH_D,
			//Decals.SCORCH_E,
			//Decals.SCORCH_F,
			//Decals.SCORCH_G,
			//Decals.SCORCH_H,
			//][int(Math.random() * 8)]);
			//
			//settings.erase = true;
			//
			//settings.size = 0.75;
			//settings.sizeDeviation = 0.25;
			//
			//settings.angle = 0;
			//settings.angleDeviation = 1;
			//
			//_arena.mark(new Point(event.localX, event.localY), settings);
			//}
		}
	}
}