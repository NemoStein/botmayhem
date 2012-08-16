package nemostein.games.botmayhem.menu
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import nemostein.framework.dragonfly.Core;
	import nemostein.games.botmayhem.Assets;
	import nemostein.games.botmayhem.core.Button;
	
	public class CreditsButton extends Button
	{
		
		public function CreditsButton()
		{
			
		}
		
		override protected function initialize():void
		{
			super.initialize();
			
			//var area:Core = new Core();
			
			//area.graphics.beginFill(0, 0);
			//area.graphics.moveTo(0, 136);
			//area.graphics.lineTo(36, 0);
			//area.graphics.lineTo(171, 36);
			//area.graphics.lineTo(136, 172);
			//area.graphics.endFill();
			
			var shadow:Core = new Core(Bitmap(new Assets.ImageMenuCreditsShadow()).bitmapData);
			var button:Core = new Core(Bitmap(new Assets.ImageMenuCreditsButton()).bitmapData);
			
			shadow.y = 2;
			button.x = 5;
			
			//area.x = 5;
			//hitArea = area;
			
			add(shadow);
			add(button);
			//add(area);
		}
	}
}