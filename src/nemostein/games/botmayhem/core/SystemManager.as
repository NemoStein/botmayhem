package nemostein.games.botmayhem.core
{
	import flash.utils.Dictionary;
	import nemostein.Updatable;
	
	public class SystemManager implements Updatable
	{
		private var _stack:Vector.<Updatable>;
		private var _count:int;
		private var i:int;
		
		public function SystemManager()
		{
			initialize();
		}
		
		private function initialize():void
		{
			_stack = new Vector.<Updatable>();
			_count = 0;
		}
		
		public function addUpdatable(updatable:Updatable):void
		{
			if (updatable == null)
			{
				throw new ArgumentError("The updatable can't be null");
			}
			
			var inStack:Boolean = false;
			for (i = 0; i < _count; ++i)
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
				_count++;
			}
			
			//trace("=======================================");
			//for (i = 0; i < _count; ++i)
			//{
				//trace(_stack[i])
			//}
			//trace("");
		}
		
		public function removeUpdatable(updatable:Updatable):void
		{
			for (i = 0; i < _count; ++i)
			{
				if (_stack[i] == updatable)
				{
					_stack.splice(i, 1);
					_count--;
					break;
				}
			}
		}
		
		public function update():void
		{
			for (i = 0; i < _count; ++i)
			{
				_stack[i].update();
			}
		}
	}
}