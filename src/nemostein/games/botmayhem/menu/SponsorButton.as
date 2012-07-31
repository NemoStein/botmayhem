package nemostein.games.botmayhem.menu
{
	import flash.display.Bitmap;
	import nemostein.games.botmayhem.Assets;
	import nemostein.games.botmayhem.core.Button;
	
	public class SponsorButton extends Button
	{
		
		public function SponsorButton()
		{
			initialize();
		}
		
		private function initialize():void
		{
			var imageMenuSponsorShadow:Bitmap = new Assets.ImageMenuSponsorShadow();
			var imageMenuSponsorButton:Bitmap = new Assets.ImageMenuSponsorButton();
			
			imageMenuSponsorButton.x = 21;
			imageMenuSponsorShadow.y = 3;
			
			addChild(imageMenuSponsorShadow);
			addChild(imageMenuSponsorButton);
		}
	}
}