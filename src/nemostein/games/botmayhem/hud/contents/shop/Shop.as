package nemostein.games.botmayhem.hud.contents.shop
{
	import com.bit101.components.Window;
	import flash.display.Sprite;
	import nemostein.framework.dragonfly.Entity;
	import nemostein.framework.dragonfly.Game;
	
	public class Shop extends Entity
	{
		private var _container:Sprite;
		
		override protected function initialize():void
		{
			super.initialize();
			
			_container = new Sprite();
			
			var window:Window = new Window(_container);
			window.draggable = false;
			window.width = 687;
			window.height = 580;
			window.y = 10;
			window.x = 151;
			
			
		}
		
		override public function show():void
		{
			Game.stage.addChild(_container);
			
			super.show();
		}
		
		override public function hide():void
		{
			Game.stage.removeChild(_container);
			
			super.hide();
		}
	}
}