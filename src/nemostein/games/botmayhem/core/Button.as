package nemostein.games.botmayhem.core
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import nemostein.framework.dragonfly.Core;
	import nemostein.framework.dragonfly.Game;
	import nemostein.games.botmayhem.arenas.Arena;
	import nemostein.games.botmayhem.arenas.ArenaService;
	import nemostein.games.botmayhem.decals.Decals;
	import nemostein.games.botmayhem.decals.DecalSettings;
	import nemostein.io.Keys;
	import nemostein.utils.MathUtils;
	
	public class Button extends Core
	{
		private var _hitArea:Vector.<Point>;
		private var _relativeHitArea:Vector.<Point>;
		
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
			
			_hitArea = new Vector.<Point>();
			_relativeHitArea = new Vector.<Point>();
			
			setCurrentDescendentsAsRelative();
		}
		
		protected function drawHitArea(... vertices:Array):void
		{
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
		
		public function hit(point:Point = null):void
		{
		
		}
		
		public function enter(point:Point = null):void
		{
			hovered = true;
		}
		
		public function leave(point:Point = null):void
		{
			hovered = false;
		}
		
		override protected function update():void
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
			
			if (!hovered && MathUtils.isInsidePolygon(_relativeHitArea, input.mouse))
			{
				enter(input.mouse.clone());
			}
			else if (hovered)
			{
				if (!MathUtils.isInsidePolygon(_relativeHitArea, input.mouse))
				{
					leave(input.mouse.clone());
				}
				else if (input.justPressed(Keys.LEFT_MOUSE))
				{
					hit(input.mouse.clone());
				}
			}
			
			super.update();
		}
	}
}