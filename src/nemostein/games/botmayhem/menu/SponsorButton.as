package nemostein.games.botmayhem.menu
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import nemostein.framework.dragonfly.Core;
	import nemostein.games.botmayhem.Assets;
	import nemostein.games.botmayhem.core.Button;
	
	public class SponsorButton extends Button
	{
		
		public function SponsorButton()
		{
			
		}
		
		override protected function initialize():void
		{
			super.initialize();
			
			//var area:Core = new Core();
			
			//area.graphics.beginFill(0, 0);
			//area.graphics.moveTo(0, 24);
			//area.graphics.lineTo(116, 0);
			//area.graphics.lineTo(139, 118);
			//area.graphics.lineTo(22, 142);
			//area.graphics.endFill();
			
			var shadow:Core = new Core(Bitmap(new Assets.ImageMenuSponsorShadow()).bitmapData);
			var button:Core = new Core(Bitmap(new Assets.ImageMenuSponsorButton()).bitmapData);
			
			shadow.y = 3;
			button.x = 21;
			
			//area.x = 21;
			//hitArea = area;
			
			add(shadow);
			add(button);
			//add(area);
		}
	}
}