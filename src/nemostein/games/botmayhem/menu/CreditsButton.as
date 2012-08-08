package nemostein.games.botmayhem.menu
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
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
			var area:Sprite = new Sprite();
			
			area.graphics.beginFill(0, 0);
			area.graphics.moveTo(0, 136);
			area.graphics.lineTo(36, 0);
			area.graphics.lineTo(171, 36);
			area.graphics.lineTo(136, 172);
			area.graphics.endFill();
			
			var imageMenuCreditsShadow:Bitmap = new Assets.ImageMenuCreditsShadow();
			var imageMenuCreditsButton:Bitmap = new Assets.ImageMenuCreditsButton();
			
			imageMenuCreditsButton.x = 5;
			imageMenuCreditsShadow.y = 2;
			area.x = 5;
			
			mouseChildren = false;
			hitArea = area;
			
			addChild(imageMenuCreditsShadow);
			addChild(imageMenuCreditsButton);
			addChild(area);
		}
	}
}