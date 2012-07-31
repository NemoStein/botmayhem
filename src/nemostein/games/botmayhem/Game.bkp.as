package nemostein.games.botmayhem
{
	public class Game
	{
		
		public function Game()
		{
			var redTiledArena:RedTiledArena = new RedTiledArena();
			
			_hero = new Hero();
			_hero.x = Math.random() * 900;
			_hero.y = Math.random() * 600;
			
			_heroSeeker = new SimpleSeeker(_hero);
			var botsManager:BotsManager = BotsService.manager;
			
			for (var i:int = 0; i < 10; ++i)
			{
				var bot:SimpleBot = new SimpleBot();
				bot.x = Math.random() * 900;
				bot.y = Math.random() * 600;
				
				botsManager.add(bot);
				_heroSeeker.addSource(bot);
			}
			
			var weaponsFactory:WeaponsFactory = WeaponsService.factory;
			weaponsFactory.putSmallWeapon(_hero);
			weaponsFactory.putLargeWeapon(_hero);
			weaponsFactory.putHugeWeapon(_hero);
			
			var hud:HUD = new HUD();
			hud.x = 759;
			
			addChild(redTiledArena);
			addChild(new Assets.ImageOverlayScreen());
			addChild(_hero);
			
			addChild(_botsLayer);
			addChild(_bulletsLayer);
			
			addChild(hud);
			
			var input:Input = new Input(stage);
			
			_heroController = new HeroController(input, _hero);
			
			//_collider = new PixelPerfectCollider();
			_collider = new SimpleCollider();
			
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame(event:Event):void
		{
			_heroController.update();
			_heroSeeker.update();
			
			var bots:Vector.<Collidable> = BotsService.manager.botsAsCollidable();
			var bullets:Vector.<Collidable> = BulletsService.manager.bulletsAsCollidable();
			
			_collider.collideAgainst(_hero, bots);
			_collider.collideGroups(bots, bullets);
			_collider.collideAll(bots);
			
			BulletsService.manager.update();
		}
	}
}