package nemostein.games.botmayhem.menu
{
	import flash.display.Bitmap;
	import nemostein.games.botmayhem.Assets;
	import nemostein.games.botmayhem.core.Button;
	
	public class CreditsButton extends Button
	{
		
		public function CreditsButton()
		{
			initialize();
		}
		
		private function initialize():void
		{
			var imageMenuCreditsShadow:Bitmap = new Assets.ImageMenuCreditsShadow();
			var imageMenuCreditsButton:Bitmap = new Assets.ImageMenuCreditsButton();
			
			imageMenuCreditsButton.x = 5;
			imageMenuCreditsShadow.y = 2;
			
			addChild(imageMenuCreditsShadow);
			addChild(imageMenuCreditsButton);
		}
	}
}