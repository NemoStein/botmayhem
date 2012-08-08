package nemostein.games.botmayhem.menu
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import nemostein.games.botmayhem.Assets;
	import nemostein.games.botmayhem.core.Button;
	
	public class DeveloperButton extends Button
	{
		
		public function DeveloperButton()
		{
			initialize();
		}
		
		private function initialize():void
		{
			var area:Sprite = new Sprite();
			
			area.graphics.beginFill(0, 0);
			area.graphics.moveTo(0, 7);
			area.graphics.lineTo(119, 0);
			area.graphics.lineTo(125, 120);
			area.graphics.lineTo(6, 127);
			area.graphics.endFill();
			
			var imageMenuDeveloperShadow:Bitmap = new Assets.ImageMenuDeveloperShadow();
			var imageMenuDeveloperButton:Bitmap = new Assets.ImageMenuDeveloperButton();
			
			imageMenuDeveloperButton.x = 25;
			imageMenuDeveloperButton.y = 1;
			area.x = 25;
			area.y = 1;
			
			mouseChildren = false;
			hitArea = area;
			
			addChild(imageMenuDeveloperShadow);
			addChild(imageMenuDeveloperButton);
			addChild(area);
		}
	}
}