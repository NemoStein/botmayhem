package nemostein.games.botmayhem.decals
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import nemostein.games.botmayhem.Assets;
	import nemostein.utils.MathUtils;
	
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
			var originalData:BitmapData = _data[settings.type];
			if (!originalData)
			{
				originalData = findDecalData(settings.type);
			}
			
			if (settings.angle != 0 || settings.angleDeviation != 0 || settings.size != 0 || settings.sizeDeviation != 0)
			{
				var matrix:Matrix = new Matrix();
				
				var halfWidth:Number = originalData.width / 2;
				var halfHeight:Number = originalData.height / 2;
				
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
			switch (type)
			{
				case SCORCH_A:
				{
					_data[type] = Bitmap(new Assets.ImageDecalsScorchA).bitmapData;
					break;
				}
				
				case SCORCH_B:
				{
					_data[type] = Bitmap(new Assets.ImageDecalsScorchB).bitmapData;
					break;
				}
				
				case SCORCH_C:
				{
					_data[type] = Bitmap(new Assets.ImageDecalsScorchC).bitmapData;
					break;
				}
				
				case SCORCH_D:
				{
					_data[type] = Bitmap(new Assets.ImageDecalsScorchD).bitmapData;
					break;
				}
				
				case SCORCH_E:
				{
					_data[type] = Bitmap(new Assets.ImageDecalsScorchE).bitmapData;
					break;
				}
				
				case SCORCH_F:
				{
					_data[type] = Bitmap(new Assets.ImageDecalsScorchF).bitmapData;
					break;
				}
				
				case SCORCH_G:
				{
					_data[type] = Bitmap(new Assets.ImageDecalsScorchG).bitmapData;
					break;
				}
				
				case SCORCH_H:
				{
					_data[type] = Bitmap(new Assets.ImageDecalsScorchH).bitmapData;
					break;
				}
				
				default:
				{
					throw new ArgumentError("Decal '" + type + "' don't exists. Use the 'Decals' constants.");
				}
			}
			
			return _data[type];
		}
	}
}