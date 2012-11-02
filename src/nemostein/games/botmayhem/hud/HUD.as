package nemostein.games.botmayhem.hud
{
	import flash.display.Bitmap;
	import flash.geom.Point;
	import nemostein.framework.dragonfly.AnchorAlign;
	import nemostein.framework.dragonfly.Core;
	import nemostein.framework.dragonfly.Entity;
	import nemostein.games.botmayhem.assets.hud.AssetHudBase;
	import nemostein.games.botmayhem.core.SystemService;
	import nemostein.games.botmayhem.hud.bars.Bar;
	import nemostein.games.botmayhem.hud.buttons.BGMButton;
	import nemostein.games.botmayhem.hud.buttons.PlayButton;
	import nemostein.games.botmayhem.hud.buttons.RecycleButton;
	import nemostein.games.botmayhem.hud.buttons.SFXButton;
	
	public class HUD extends Entity
	{
		private var _deckOpened:Boolean;
		private var _openingDeck:Boolean;
		private var _closingDeck:Boolean;
		
		private var _shopContent:Core;
		private var _optionsContent:Core;
		
		override protected function initialize():void
		{
			super.initialize();
			
			draw(Bitmap(new AssetHudBase).bitmapData);
			
			setParallax(0, 0);
			
			var recycleButton:RecycleButton = new RecycleButton();
			var shieldBar:Core = new Bar(Bar.SHIELD);
			var hullBar:Core = new Bar(Bar.HULL);
			var playButton:PlayButton = new PlayButton();
			var bgmButton:BGMButton = new BGMButton();
			var sfxButton:SFXButton = new SFXButton();
			
			recycleButton.x = 223;
			recycleButton.y = 10;
			
			shieldBar.x = 262;
			shieldBar.y = 12;
			
			hullBar.x = 262;
			hullBar.y = 28;
			
			playButton.x = 786;
			playButton.y = 10;
			
			bgmButton.x = 823;
			bgmButton.y = 10;
			
			sfxButton.x = 860;
			sfxButton.y = 10;
			
			add(recycleButton);
			add(shieldBar);
			add(hullBar);
			add(playButton);
			add(bgmButton);
			add(sfxButton);
			
			//recycleButton.onExecute = onRecycleButtonExecute;
			//playButton.onExecute = onPlayButtonExecute;
		}
		
		private function onRecycleButtonExecute(point:Point = null):void
		{
			_shopContent.revive();
			_optionsContent.die();
			
			openDeck();
		}
		
		private function onPlayButtonExecute(point:Point = null):void
		{
			_shopContent.die();
			_optionsContent.revive();
			
			openDeck();
		}
		
		private function openDeck():void
		{
			if (!_deckOpened)
			{
				SystemService.pauseGame();
				
				_openingDeck = true;
			}
		}
		
		private function closeDeck():void
		{
			if (_deckOpened)
			{
				SystemService.unpauseGame();
				
				_closingDeck = true;
			}
		}
		
		override protected function update():void
		{
			if (!_deckOpened && _openingDeck && x > 150)
			{
				x -= 25;
				
				if (x <= 150)
				{
					x = 150;
					
					_openingDeck = false;
					_deckOpened = true;
				}
			}
			else if (_deckOpened && _closingDeck && x < 900)
			{
				x += 25;
				
				if (x >= 900)
				{
					x = 900;
					
					_closingDeck = false;
					_deckOpened = false;
				}
			}
			
			super.update();
		}
	}
}