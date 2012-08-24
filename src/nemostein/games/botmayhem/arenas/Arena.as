package nemostein.games.botmayhem.arenas
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import nemostein.color.Color;
	import nemostein.framework.dragonfly.Core;
	import nemostein.games.botmayhem.decals.Decals;
	import nemostein.games.botmayhem.decals.DecalSettings;
	
	public class Arena extends Core
	{
		public static const TOP_LAYER:int = -1;
		public static const BOTTOM_LAYER:int = 0;
		
		protected var _layers:Vector.<ArenaLayer>;
		
		override protected function initialize():void
		{
			super.initialize();
			
			_layers = new Vector.<ArenaLayer>();
		}
		
		public function mark(location:Point, settings:DecalSettings, layer:int = TOP_LAYER):void
		{
			var layerData:BitmapData = getLayer(layer).data;
			var brushData:BitmapData = Decals.getData(settings);
			
			if (layerData && brushData)
			{
				var brushWidth:int = brushData.width;
				var brushHeight:int = brushData.height;
				
				var brushHalfWidth:int = int(brushWidth / 2);
				var brushHalfHeight:int = int(brushHeight / 2);
				
				var layerColor:Color = new Color();
				var brushColor:Color = new Color();
				
				if (settings.erase)
				{
					layerData.lock();
					
					for (var brushX:int = 0; brushX < brushWidth; ++brushX)
					{
						for (var brushY:int = 0; brushY < brushHeight; ++brushY)
						{
							var layerX:int = location.x + brushX - brushHalfWidth;
							var layerY:int = location.y + brushY - brushHalfHeight;
							
							if(layerX >= 0 && layerX < layerData.width && layerY >= 0 && layerY < layerData.height)
							{
								layerColor.argb = layerData.getPixel32(layerX, layerY);
								brushColor.argb = brushData.getPixel32(brushX, brushY);
								
								layerData.setPixel32(layerX, layerY, Color.subtract(layerColor, brushColor, 1, true));
							}
						}
					}
					
					layerData.unlock();
				}
				else
				{
					var destination:Point = new Point();
					destination.x = location.x;
					destination.y = location.y;
					destination.offset(-brushHalfWidth, -brushHalfHeight);
					
					layerData.copyPixels(brushData, new Rectangle(0, 0, brushWidth, brushHeight), destination, null, null, true);
				}
			}
		}
		
		protected function addLayer(data:ArenaLayer):void
		{
			_layers.push(data);
			
			add(data);
		}
		
		protected function getLayer(layer:int):ArenaLayer
		{
			var layerCount:int = _layers.length;
			if (layerCount)
			{
				try
				{
					if (layer == TOP_LAYER)
					{
						return _layers[layerCount - 1];
					}
					else
					{
						return _layers[layer];
					}
				}
				catch (error:Error)
				{
					return null;
				}
			}
			
			return null;
		}
	}
}