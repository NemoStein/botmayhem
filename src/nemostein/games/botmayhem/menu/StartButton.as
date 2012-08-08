package nemostein.games.botmayhem.menu
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
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
			var area:Sprite = new Sprite();
			
			area.graphics.beginFill(0, 0);
			area.graphics.moveTo(0, 48);
			area.graphics.lineTo(179, 0);
			area.graphics.lineTo(227, 178);
			area.graphics.lineTo(47, 227);
			area.graphics.endFill();
			
			var imageMenuStartShadow:Bitmap = new Assets.ImageMenuStartShadow();
			var imageMenuStartButton:Bitmap = new Assets.ImageMenuStartButton();
			
			imageMenuStartButton.x = 30;
			imageMenuStartButton.y = 18;
			area.x = 30;
			area.y = 18;
			
			mouseChildren = false;
			hitArea = area;
			
			addChild(imageMenuStartShadow);
			addChild(imageMenuStartButton);
			addChild(area);
		}
	}
}