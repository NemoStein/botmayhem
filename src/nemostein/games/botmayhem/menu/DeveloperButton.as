package nemostein.games.botmayhem.menu
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import nemostein.framework.dragonfly.Core;
	import nemostein.games.botmayhem.Assets;
	import nemostein.games.botmayhem.core.Button;
	
	public class DeveloperButton extends Button
	{
		
		public function DeveloperButton()
		{
			
		}
		
		override protected function initialize():void
		{
			super.initialize();
			
			//var area:Core = new Core();
			
			//area.graphics.beginFill(0, 0);
			//area.graphics.moveTo(0, 7);
			//area.graphics.lineTo(119, 0);
			//area.graphics.lineTo(125, 120);
			//area.graphics.lineTo(6, 127);
			//area.graphics.endFill();
			
			var shadow:Core = new Core(Bitmap(new Assets.ImageMenuDeveloperShadow()).bitmapData);
			var button:Core = new Core(Bitmap(new Assets.ImageMenuDeveloperButton()).bitmapData);
			
			button.x = 25;
			button.y = 1;
			
			//area.x = 25;
			//area.y = 1;
			//hitArea = area;
			
			add(shadow);
			add(button);
			//add(area);
		}
	}
}