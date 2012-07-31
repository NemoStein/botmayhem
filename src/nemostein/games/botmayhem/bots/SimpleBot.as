package nemostein.games.botmayhem.bots
{
	import flash.display.Sprite;
	
	public class SimpleBot extends Bot
	{
		
		public function SimpleBot()
		{
			graphics.beginFill(0xbbdfbf, 1);
			graphics.drawCircle(0, 0, 10);
			graphics.beginFill(0x88afbf, 1);
			graphics.drawCircle(7.5, 0, 5);
			graphics.endFill();
		}
	}
}