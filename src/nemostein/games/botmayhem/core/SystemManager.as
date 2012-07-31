package nemostein.games.botmayhem.core
{
	import flash.utils.Dictionary;
	import nemostein.Updatable;
	
	public class SystemManager implements Updatable
	{
		private var _stack:Vector.<Updatable>;
		
		public function SystemManager()
		{
			initialize();
		}
		
		private function initialize():void
		{
			_stack = new Vector.<Updatable>();
		}
		
		public function addUpdatable(updatable:Updatable):void
		{
			if (updatable == null)
			{
				throw new ArgumentError("The updatable can't be null");
			}
			
			var inStack:Boolean = false;
			for (var i:int = 0; i < _stack.length; ++i)
			{
				if (_stack[i] == updatable)
				{
					inStack = true;
					break;
				}
			}
			
			if(!inStack)
			{
				_stack.push(updatable);
			}
		}
		
		public function removeUpdatable(updatable:Updatable):void
		{
			for (var i:int = 0; i < _stack.length; ++i)
			{
				if (_stack[i] == updatable)
				{
					_stack.splice(i, 1);
					break;
				}
			}
		}
		
		public function update():void
		{
			for (var i:int = 0; i < _stack.length; ++i)
			{
				_stack[i].update();
			}
		}
	}
}