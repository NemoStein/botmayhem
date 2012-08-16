package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.system.System;
	import flash.text.TextField;
	import nemostein.games.botmayhem.BotMayhem;
	import nemostein.intro.IntroSequence;
	
	[SWF(width=900,height=600,backgroundColor="#000000",frameRate="50")]
	[Frame(factoryClass="Preloader")]
	
	public class Main extends Sprite
	{
		private var _introSequence:IntroSequence;
		
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
			
			_introSequence = new IntroSequence(onIntroSequenceComplete);
			
			//_introSequence.addIntro(new SponsorIntro());
			//_introSequence.addIntro(new DeveloperIntro());
			//_introSequence.addIntro(new GameIntro());
			
			addChild(_introSequence);
			
			_introSequence.start();
		}
		
		private function onIntroSequenceComplete():void
		{
			removeChild(_introSequence);
			
			var game:BotMayhem = new BotMayhem();
			game.start(stage);
			game.showFps();
		}
	}
}