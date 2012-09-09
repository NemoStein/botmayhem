package nemostein.games.botmayhem.core
{
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import nemostein.framework.dragonfly.Entity;
	import nemostein.io.Keys;
	import nemostein.utils.MathUtils;
	
	public class Button extends Entity
	{
		private var _hitArea:Vector.<Point>;
		private var _relativeHitArea:Vector.<Point>;
		
		public var pressed:Boolean;
		public var hovered:Boolean;
		
		/**
		 * The position, width and height of the bounding box representing the hit area
		 */
		protected var hitAreaRect:Rectangle;
		
		/**
		 * A reference to a list of vertices (Points) that draws the hit area.
		 * MUST be ordered clockwise or counter-clockwise (not shuffled) AND convex
		 */
		override protected function initialize():void
		{
			super.initialize();
			
			_relativeHitArea = new Vector.<Point>();
			
			setCurrentDescendentsAsRelative();
		}
		
		protected function drawHitArea(... vertices:Array):void
		{
			_hitArea = new Vector.<Point>();
			
			var count:int = vertices.length;
			
			var areaTop:Number = Infinity;
			var areaBottom:Number = -Infinity;
			var areaLeft:Number = Infinity;
			var areaRight:Number = -Infinity;
			
			for (var i:int = 0; i < count; i++)
			{
				var vertex:Point = vertices[i];
				
				_hitArea.push(vertex.clone());
				_relativeHitArea.push(vertex.clone());
				
				if (vertex.y < areaTop)
				{
					areaTop = vertex.y;
				}
				
				if (vertex.y > areaBottom)
				{
					areaBottom = vertex.y;
				}
				
				if (vertex.x < areaLeft)
				{
					areaLeft = vertex.x;
				}
				
				if (vertex.x > areaRight)
				{
					areaRight = vertex.x;
				}
			}
			
			hitAreaRect = new Rectangle(areaLeft, areaTop, areaRight - areaLeft, areaBottom - areaTop);
		}
		
		public function onPress(point:Point = null):void
		{
			pressed = true;
		}
		
		public function onRelease(point:Point = null):void
		{
			pressed = false;
		}
		
		public function onEnter(point:Point = null):void
		{
			hovered = true;
		}
		
		public function onLeave(point:Point = null):void
		{
			hovered = false;
			pressed = false;
		}
		
		override protected function update():void
		{
			var mousePosition:Point = input.mouse;
			
			if (_hitArea)
			{
				var count:int = _hitArea.length;
				for (var i:int = 0; i < count; i++)
				{
					var areaVertex:Point = _hitArea[i];
					var relativeVertex:Point = _relativeHitArea[i];
					
					if (relativeVertex)
					{
						relativeVertex.x = areaVertex.x + x;
						relativeVertex.y = areaVertex.y + y;
					}
					else
					{
						relativeVertex.x = areaVertex.x;
						relativeVertex.y = areaVertex.y;
					}
				}
				
				if (!hovered && MathUtils.isInsidePolygon(_relativeHitArea, mousePosition))
				{
					onEnter(mousePosition);
				}
				else if (hovered)
				{
					if (!MathUtils.isInsidePolygon(_relativeHitArea, mousePosition))
					{
						onLeave(mousePosition);
					}
					else if (!pressed && input.justPressed(Keys.LEFT_MOUSE))
					{
						onPress(mousePosition);
					}
					else if (pressed && input.justReleased(Keys.LEFT_MOUSE))
					{
						onRelease(mousePosition);
					}
				}
			}
			else
			{
				if (!hovered && isInside(mousePosition))
				{
					onEnter(mousePosition);
				}
				else if (hovered)
				{
					if (!isInside(mousePosition))
					{
						onLeave(mousePosition);
					}
					else if (!pressed && input.justPressed(Keys.LEFT_MOUSE))
					{
						onPress(mousePosition);
					}
					else if (pressed && input.justReleased(Keys.LEFT_MOUSE))
					{
						onRelease(mousePosition);
					}
				}
			}
			
			super.update();
		}
	}
}