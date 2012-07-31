package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import nemostein.games.botmayhem.BotMayhem;
	
	[SWF(width=900,height=600,backgroundColor="#000000",frameRate="50")]
	[Frame(factoryClass="Preloader")]
	
	public class Main extends Sprite
	{
		
		public function Main():void
		{
			if (stage)
			{
				onAddedToStage();
			}
			else
			{
				addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			}
		}
		
		private function onAddedToStage(event:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
			var botMayhem:BotMayhem = new BotMayhem();
			
			addChild(botMayhem);
		}
	}
}