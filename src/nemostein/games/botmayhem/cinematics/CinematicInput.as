package nemostein.games.botmayhem.cinematics
{
	import flash.display.Stage;
	import flash.geom.Point;
	import nemostein.io.Input;
	import nemostein.io.UserInput;
	
	public class CinematicInput extends UserInput
	{
		private var _controller:HeroCinematicsController;
		
		public function CinematicInput(stage:Stage, controller:HeroCinematicsController)
		{
			super(stage);
			
			_controller = controller;
		}
		
		public override function press(key:int):void
		{
			if(key == UserInput.LEFT_MOUSE)
			{
				super.press(key);
			}
		}
		
		public function pressUp():void
		{
			super.press(_controller.keyUp);
		}
		
		public function pressDown():void
		{
			super.press(_controller.keyDown);
		}
		
		public function pressLeft():void
		{
			super.press(_controller.keyLeft);
		}
		
		public function pressRight():void
		{
			super.press(_controller.keyRight);
		}
		
		public function releaseKeys():void
		{
			super.release(_controller.keyUp);
			super.release(_controller.keyDown);
			super.release(_controller.keyLeft);
			super.release(_controller.keyRight);
		}
	}
}