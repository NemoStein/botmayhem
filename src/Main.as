package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import nemostein.framework.dragonfly.Game;
	import nemostein.games.botmayhem.BotMayhem;
	import nemostein.games.botmayhem.ClassRegistry;
	import nemostein.games.botmayhem.waves.Wave;
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
			
			ClassRegistry.register();
			
			var game:BotMayhem = new BotMayhem();
			game.start(stage);
			game.showFps();
		}
	}
}