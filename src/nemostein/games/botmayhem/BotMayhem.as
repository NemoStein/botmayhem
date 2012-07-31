package nemostein.games.botmayhem
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.ui.Mouse;
	import flash.ui.MouseCursorData;
	import nemostein.controllers.Collidable;
	import nemostein.controllers.Collider;
	import nemostein.controllers.Controller;
	import nemostein.controllers.Seeker;
	import nemostein.games.botmayhem.arenas.ArenaManager;
	import nemostein.games.botmayhem.arenas.ArenaService;
	import nemostein.games.botmayhem.bots.BotsManager;
	import nemostein.games.botmayhem.bots.BotsService;
	import nemostein.games.botmayhem.bots.hero.Hero;
	import nemostein.games.botmayhem.bots.hero.HeroManager;
	import nemostein.games.botmayhem.bots.hero.HeroService;
	import nemostein.games.botmayhem.core.Entity;
	import nemostein.games.botmayhem.core.SystemManager;
	import nemostein.games.botmayhem.core.SystemService;
	import nemostein.games.botmayhem.intros.SponsorIntro;
	import nemostein.games.botmayhem.menu.Menu;
	import nemostein.games.botmayhem.weaponry.bullets.BulletsFactory;
	import nemostein.games.botmayhem.weaponry.bullets.BulletsManager;
	import nemostein.games.botmayhem.weaponry.bullets.BulletsService;
	import nemostein.games.botmayhem.weaponry.weapons.WeaponsFactory;
	import nemostein.games.botmayhem.weaponry.weapons.WeaponsService;
	import nemostein.intro.IntroSequence;
	
	public class BotMayhem extends Sprite
	{
		public static const CURSOR_AIM:String = "aim";
		
		private var _heroController:Controller;
		private var _heroSeeker:Seeker;
		private var _collider:Collider;
		
		private var _hero:Hero;
		private var _bots:Vector.<Collidable>;
		
		private var _bulletsLayer:Entity;
		private var _botsLayer:Entity;
		
		public function BotMayhem()
		{
			initialize();
		}
		
		private function initialize():void
		{
			_bots = new <Collidable>[];
			
			_bulletsLayer = new Entity();
			_botsLayer = new Entity();
			
			_hero = new Hero();
			_hero.x = 830;
			_hero.y = -25;
			
			WeaponsService.factory = new WeaponsFactory();
			BulletsService.factory = new BulletsFactory();
			HeroService.manager = new HeroManager(_hero);
			ArenaService.manager = new ArenaManager();
			BulletsService.manager = new BulletsManager(_bulletsLayer);
			BotsService.manager = new BotsManager(_botsLayer);
			SystemService.manager = new SystemManager();
			
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
			var introSequence:IntroSequence = new IntroSequence(onIntroSequenceComplete);
			
			//introSequence.addIntro(new SponsorIntro());
			//introSequence.addIntro(new DeveloperIntro());
			//introSequence.addIntro(new GameIntro());
			
			addChild(introSequence);
			
			introSequence.start();
		}
		
		private function onIntroSequenceComplete():void
		{
			SystemService.manager.addUpdatable(BulletsService.manager);
			
			var aimCursor:MouseCursorData = new MouseCursorData();
			aimCursor.data = new <BitmapData>[Bitmap(new Assets.ImageCursorsAimB()).bitmapData];
			aimCursor.hotSpot = new Point(15, 15);
			
			Mouse.registerCursor(CURSOR_AIM, aimCursor);
			Mouse.cursor = CURSOR_AIM;
			
			addChild(new Menu());
			addChild(_bulletsLayer);
			
			stage.addEventListener(Event.ENTER_FRAME, onStageEnterFrame);
		}
		
		private function onStageEnterFrame(event:Event):void
		{
			SystemService.manager.update();
		}
	}
}