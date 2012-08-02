package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.utils.getTimer;
	import nemostein.games.botmayhem.BotMayhem;
	
	[SWF(width=900,height=600,backgroundColor="#000000",frameRate="50")]
	[Frame(factoryClass="Preloader")]
	
	public class Main extends Sprite
	{
		private var textField:TextField;
		private var now:int;
		private var early:int;
		private var elapsed:int;
		private var ticks:int;
		
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
			
			textField = new TextField();
			//textField.border = true;
			textField.background = true;
			textField.autoSize = TextFieldAutoSize.RIGHT;
			textField.defaultTextFormat = new TextFormat("Lead II", 8);
			textField.x = stage.stageWidth - 4;
			textField.y = 0;
			addChild(textField);
			
			now = getTimer();
			early = now;
			elapsed = 0;
			
			addEventListener(Event.ENTER_FRAME, onStageEnterFrame);
		}
		
		private function onStageEnterFrame(e:Event):void 
		{
			now = getTimer();
			
			elapsed += now - early;
			if (elapsed > 500)
			{
				textField.text = " " + (ticks / 500 * 1000).toFixed(2) + "fps";
				elapsed -= 500;
				ticks = 0;
			}
			
			early = now;
			ticks++;
		}
	}
}