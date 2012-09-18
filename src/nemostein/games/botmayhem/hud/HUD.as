package nemostein.games.botmayhem.hud
{
	import flash.display.Bitmap;
	import flash.geom.Point;
	import nemostein.framework.dragonfly.AnchorAlign;
	import nemostein.framework.dragonfly.Core;
	import nemostein.framework.dragonfly.Entity;
	import nemostein.games.botmayhem.assets.hud.AssetBars;
	import nemostein.games.botmayhem.assets.hud.AssetCash;
	import nemostein.games.botmayhem.assets.hud.AssetPanel;
	import nemostein.games.botmayhem.core.SystemService;
	import nemostein.games.botmayhem.hud.bars.Bar;
	import nemostein.games.botmayhem.hud.buttons.OptionsButton;
	import nemostein.games.botmayhem.hud.buttons.ShopButton;
	import nemostein.games.botmayhem.hud.contents.options.Options;
	import nemostein.games.botmayhem.hud.contents.shop.Shop;
	
	public class HUD extends Entity
	{
		private var _deckOpened:Boolean;
		private var _openingDeck:Boolean;
		
		private var _shopContent:Core;
		private var _optionsContent:Core;
		
		override protected function initialize():void
		{
			super.initialize();
			
			draw(Bitmap(new AssetPanel).bitmapData);
			alignAnchor(AnchorAlign.TOP, AnchorAlign.CUSTOM, new Point(141, 0));
			x = 900;
			
			var cash:Core = new Core(Bitmap(new AssetCash).bitmapData);
			var shopButton:ShopButton = new ShopButton();
			var optionsButton:OptionsButton = new OptionsButton();
			var bars:Core = new Core(Bitmap(new AssetBars).bitmapData);
			var blueBar:Core = new Bar(Bar.BLUE);
			var redBar:Core = new Bar(Bar.RED);
			
			_shopContent = new Shop();
			_optionsContent = new Options();
			
			cash.x = 19;
			cash.y = 75;
			
			shopButton.x = 19;
			shopButton.y = 107;
			
			optionsButton.x = 19;
			optionsButton.y = 145;
			
			bars.x = 109;
			bars.y = 10;
			
			blueBar.x = 112;
			blueBar.y = 13;
			
			redBar.x = 125;
			redBar.y = 13;
			
			add(cash);
			add(shopButton);
			add(optionsButton);
			add(bars);
			add(blueBar);
			add(redBar);
			
			add(_shopContent);
			add(_optionsContent);
			
			shopButton.onPress = openDeckAsShop;
			optionsButton.onPress = openDeckAsOptions;
		}
		
		private function openDeckAsShop(point:Point = null):void
		{
			_shopContent.revive();
			_optionsContent.die();
			
			openDeck();
		}
		
		private function openDeckAsOptions(point:Point = null):void
		{
			_shopContent.die();
			_optionsContent.revive();
			
			openDeck()
		}
		
		private function openDeck():void
		{
			if (!_deckOpened)
			{
				SystemService.pauseGame();
				
				_openingDeck = true;
			}
		}
		
		override protected function update():void
		{
			if (_openingDeck && x > 150)
			{
				x -= 25;
				
				if (x <= 150)
				{
					x = 150;
					
					_openingDeck = false;
					_deckOpened = true;
				}
			}
			
			super.update();
		}
	}
}