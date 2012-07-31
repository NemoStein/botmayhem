package nemostein.games.botmayhem.decals
{

	public class DecalSettings
	{
		public var erase:Boolean;
		public var type:String;
		public var size:Number;
		public var sizeDeviation:Number;
		public var angle:Number;
		public var angleDeviation:Number;
		
		public function DecalSettings(decalType:String = null)
		{
			type = decalType;
			erase = false;
			size = 1;
			sizeDeviation = 0;
			angle = 0;
			angleDeviation = 0;
		}
	}
}