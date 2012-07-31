package nemostein.games.botmayhem.menu
{
	import flash.display.Bitmap;
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
			var imageMenuDeveloperShadow:Bitmap = new Assets.ImageMenuDeveloperShadow();
			var imageMenuDeveloperButton:Bitmap = new Assets.ImageMenuDeveloperButton();
			
			imageMenuDeveloperButton.x = 25;
			imageMenuDeveloperButton.y = 1;
			
			addChild(imageMenuDeveloperShadow);
			addChild(imageMenuDeveloperButton);
		}
	}
}