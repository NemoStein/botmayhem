package nemostein.games.botmayhem.waves
{
	import flash.utils.getDefinitionByName;
	import nemostein.games.botmayhem.levels.Level;
	
	public class Waves
	{
		private var _waves:Object;
		
		public function Waves()
		{
			_waves = {};
		}
		
		public function addWave(id:String, wave:Wave):void
		{
			if (_waves[id])
			{
				trace("Wave ID \"" + id + "\" is already in use. Wave with duplicated ID will be discarded.");
				return;
			}
			
			_waves[id] = wave;
		}
		
		public function findWave(id:String):Wave
		{
			return _waves[id];
		}
		
		public function removeWave(id:String):void
		{
			delete _waves[id];
		}
		
		public function startWaves(level:Level):void
		{
			for (var id:String in _waves)
			{
				var wave:Wave = _waves[id];
				wave.start(level);
			}
		}
		
		public function updateWaves(time:Number):void
		{
			for (var id:String in _waves)
			{
				var wave:Wave = _waves[id];
				var finished:Boolean = wave.update(time);
				
				if (finished)
				{
					removeWave(id);
				}
			}
		}
		
		static public function parse(string:String):Waves
		{
			var waves:Waves = new Waves();
			var waveCount:int = 0;
			
			var lines:Array = string.split("\n");
			
			for (var i:int = 0; i < lines.length; i++)
			{
				var line:String = lines[i].replace(/^(\s+)?(.*)(\s+)?$/gm, "$2");
				
				if (line.length > 0 && line.substr(0, 1) != "#")
				{
					var regex:RegExp = /^ ((\w+) \s+)? \s* (\w+) \( ( [^)]* ) \) \s+ (\w+) \s+ (\d+) \s+ (\w+) .*$/gix;
					var data:Array = regex.exec(line);
					
					if (data)
					{
						try
						{
							var id:String = data[2];
							var WaveClass:Class = Class(getDefinitionByName("nemostein.games.botmayhem.waves." + data[3]));
							var params:Array = data[4].split(/,\s*/);
							var EnemyClass:Class = Class(getDefinitionByName("nemostein.games.botmayhem.bots.enemies." + data[5]));
							var count:int = int(data[6]);
							var LocationClass:Class = Class(getDefinitionByName("nemostein.games.botmayhem.waves.locations." + data[7]));
						}
						catch (error:Error)
						{
							trace("Unable to build wave in line " + (i + 1));
							trace(error.message);
							continue;
						}
						
						if (!id)
						{
							id = "#Wave" + (++waveCount);
						}
						
						for (var j:int = 0; j < params.length; j++)
						{
							var registeredWave:Wave = waves.findWave(params[j]);
							if (registeredWave)
							{
								params[j] = registeredWave;
							}
						}
						
						var wave:Wave = new WaveClass();
						wave.construct(id, params, EnemyClass, count, LocationClass);
						waves.addWave(id, wave);
					}
					else
					{
						trace("Failed to read line " + (i + 1));
					}
				}
			}
			
			return waves;
		}
	}
}