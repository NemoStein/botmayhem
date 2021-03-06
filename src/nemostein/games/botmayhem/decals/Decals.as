package nemostein.games.botmayhem.decals
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import nemostein.games.botmayhem.assets.decals.AssetScorchA;
	import nemostein.games.botmayhem.assets.decals.AssetScorchB;
	import nemostein.games.botmayhem.assets.decals.AssetScorchC;
	import nemostein.games.botmayhem.assets.decals.AssetScorchD;
	import nemostein.games.botmayhem.assets.decals.AssetScorchE;
	import nemostein.games.botmayhem.assets.decals.AssetScorchF;
	import nemostein.games.botmayhem.assets.decals.AssetScorchG;
	import nemostein.games.botmayhem.assets.decals.AssetScorchH;
	
	public class Decals
	{
		public static const SCORCH_A:String = "scorchA";
		public static const SCORCH_B:String = "scorchB";
		public static const SCORCH_C:String = "scorchC";
		public static const SCORCH_D:String = "scorchD";
		public static const SCORCH_E:String = "scorchE";
		public static const SCORCH_F:String = "scorchF";
		public static const SCORCH_G:String = "scorchG";
		public static const SCORCH_H:String = "scorchH";
		
		private static var _data:Object = {};
		
		public static function getData(settings:DecalSettings):BitmapData
		{
			var originalData:BitmapData = findDecalData(settings.type);
			
			if (settings.angle != 0 || settings.angleDeviation != 0 || settings.size != 0 || settings.sizeDeviation != 0)
			{
				var matrix:Matrix = new Matrix();
				
				var halfWidth:Number = originalData.width >> 1;
				var halfHeight:Number = originalData.height >> 1;
				
				matrix.translate(-halfWidth, -halfHeight);
				matrix.rotate(settings.angle + (Math.random() * settings.angleDeviation * 2 - settings.angleDeviation));
				matrix.translate(halfWidth, halfHeight);
				
				var scale:Number = settings.size + (Math.random() * settings.sizeDeviation * 2 - settings.sizeDeviation);
				matrix.scale(scale, scale);
				
				var topLeft:Point = matrix.transformPoint(new Point(0, 0));
				var topRight:Point = matrix.transformPoint(new Point(originalData.width, 0));
				var bottomLeft:Point = matrix.transformPoint(new Point(0, originalData.height));
				var bottomRight:Point = matrix.transformPoint(new Point(originalData.width, originalData.height));
				
				var top:Number = Math.min(topLeft.y, topRight.y, bottomLeft.y, bottomRight.y);
				var bottom:Number = Math.max(topLeft.y, topRight.y, bottomLeft.y, bottomRight.y);
				var left:Number = Math.min(topLeft.x, topRight.x, bottomLeft.x, bottomRight.x);
				var right:Number = Math.max(topLeft.x, topRight.x, bottomLeft.x, bottomRight.x);
				
				matrix.translate(-left, -top);
				
				// Calculating the size of the new BitmapData
				var width:Number = bottom - top;
				var height:Number = right - left;
				
				var resultData:BitmapData = new BitmapData(width, height, true, 0);
				
				resultData.draw(originalData, matrix, null, null, null, true);
				
				return resultData;
			}
			else
			{
				return originalData.clone();
			}
		}
		
		private static function findDecalData(type:String):BitmapData
		{
			if (_data[type])
			{
				return _data[type];
			}
			
			switch (type)
			{
				case SCORCH_A:
				{
					return _data[type] = Bitmap(new AssetScorchA).bitmapData;
				}
				
				case SCORCH_B:
				{
					return _data[type] = Bitmap(new AssetScorchB).bitmapData;
				}
				
				case SCORCH_C:
				{
					return _data[type] = Bitmap(new AssetScorchC).bitmapData;
				}
				
				case SCORCH_D:
				{
					return _data[type] = Bitmap(new AssetScorchD).bitmapData;
				}
				
				case SCORCH_E:
				{
					return _data[type] = Bitmap(new AssetScorchE).bitmapData;
				}
				
				case SCORCH_F:
				{
					return _data[type] = Bitmap(new AssetScorchF).bitmapData;
				}
				
				case SCORCH_G:
				{
					return _data[type] = Bitmap(new AssetScorchG).bitmapData;
				}
				
				case SCORCH_H:
				{
					return _data[type] = Bitmap(new AssetScorchH).bitmapData;
				}
				
				default:
				{
					throw new ArgumentError("Decal '" + type + "' don't exists. Use the 'Decals' constants.");
				}
			}
		}
	}
}