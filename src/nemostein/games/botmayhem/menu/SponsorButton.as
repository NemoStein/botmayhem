package nemostein.games.botmayhem.menu
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
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
			var area:Sprite = new Sprite();
			
			area.graphics.beginFill(0, 0);
			area.graphics.moveTo(0, 24);
			area.graphics.lineTo(116, 0);
			area.graphics.lineTo(139, 118);
			area.graphics.lineTo(22, 142);
			area.graphics.endFill();
			
			var imageMenuSponsorShadow:Bitmap = new Assets.ImageMenuSponsorShadow();
			var imageMenuSponsorButton:Bitmap = new Assets.ImageMenuSponsorButton();
			
			imageMenuSponsorButton.x = 21;
			imageMenuSponsorShadow.y = 3;
			area.x = 21;
			
			mouseChildren = false;
			hitArea = area;
			
			addChild(imageMenuSponsorShadow);
			addChild(imageMenuSponsorButton);
			addChild(area);
		}
	}
}