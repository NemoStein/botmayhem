package nemostein.games.botmayhem.hud
{
	import flash.display.Sprite;
	import nemostein.games.botmayhem.Assets;
	
	public class HUD extends Sprite
	{
		public function HUD()
		{
			addChild(new Assets.ImageHudMock());
		}
	}
}