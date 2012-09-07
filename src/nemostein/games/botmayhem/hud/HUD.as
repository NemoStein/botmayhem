package nemostein.games.botmayhem.hud
{
	import flash.display.Bitmap;
	import flash.geom.Point;
	import nemostein.framework.dragonfly.AnchorAlign;
	import nemostein.framework.dragonfly.Core;
	import nemostein.framework.dragonfly.Entity;
	import nemostein.games.botmayhem.assets.hud.AssetBars;
	import nemostein.games.botmayhem.assets.hud.AssetCash;
	import nemostein.games.botmayhem.assets.hud.AssetOptions;
	import nemostein.games.botmayhem.assets.hud.AssetPanel;
	import nemostein.games.botmayhem.assets.hud.AssetShop;
	import nemostein.games.botmayhem.hud.bars.Bar;
	
	public class HUD extends Entity
	{
		override protected function initialize():void
		{
			super.initialize();
			
			draw(Bitmap(new AssetPanel).bitmapData);
			alignAnchor(AnchorAlign.TOP, AnchorAlign.CUSTOM, new Point(141, 0));
			x = 900;
			
			var cash:Core = new Core(Bitmap(new AssetCash).bitmapData);
			var shop:Core = new Core(Bitmap(new AssetShop).bitmapData);
			var options:Core = new Core(Bitmap(new AssetOptions).bitmapData);
			var bars:Core = new Core(Bitmap(new AssetBars).bitmapData);
			var blueBar:Core = new Bar(Bar.BLUE);
			var redBar:Core = new Bar(Bar.RED);
			
			cash.x = 19;
			cash.y = 75;
			
			shop.x = 19;
			shop.y = 107;
			
			options.x = 19;
			options.y = 145;
			
			bars.x = 109;
			bars.y = 10;
			
			blueBar.x = 112;
			blueBar.y = 13;
			
			redBar.x = 125;
			redBar.y = 13;
			
			add(cash);
			add(shop);
			add(options);
			add(bars);
			add(blueBar);
			add(redBar);
			
			setCurrentDescendentsAsRelative();
		}
	}
}