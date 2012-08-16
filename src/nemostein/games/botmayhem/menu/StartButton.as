package nemostein.games.botmayhem.menu
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import nemostein.framework.dragonfly.Core;
	import nemostein.games.botmayhem.Assets;
	import nemostein.games.botmayhem.core.Button;
	
	public class StartButton extends Button
	{
		
		public function StartButton()
		{
			
		}
		
		override protected function initialize():void
		{
			super.initialize();
			
			//var area:Core = new Core();
			
			//area.graphics.beginFill(0, 0);
			//area.graphics.moveTo(0, 48);
			//area.graphics.lineTo(179, 0);
			//area.graphics.lineTo(227, 178);
			//area.graphics.lineTo(47, 227);
			//area.graphics.endFill();
			
			var shadow:Core = new Core(Bitmap(new Assets.ImageMenuStartShadow()).bitmapData);
			var button:Core = new Core(Bitmap(new Assets.ImageMenuStartButton()).bitmapData);
			
			button.x = 30;
			button.y = 18;
			
			//area.x = 30;
			//area.y = 18;
			//hitArea = area;
			
			add(shadow);
			add(button);
			//add(area);
		}
	}
}