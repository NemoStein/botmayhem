package nemostein.games.botmayhem.menu
{
	import flash.display.Bitmap;
	import nemostein.games.botmayhem.Assets;
	import nemostein.games.botmayhem.core.Button;
	
	public class StartButton extends Button
	{
		
		public function StartButton()
		{
			initialize();
		}
		
		private function initialize():void
		{
			var imageMenuStartShadow:Bitmap = new Assets.ImageMenuStartShadow();
			var imageMenuStartButton:Bitmap = new Assets.ImageMenuStartButton();
			
			imageMenuStartButton.x = 30;
			imageMenuStartButton.y = 18;
			
			addChild(imageMenuStartShadow);
			addChild(imageMenuStartButton);
		}
	}
}