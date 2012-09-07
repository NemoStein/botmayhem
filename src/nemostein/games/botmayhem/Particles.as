package nemostein.games.botmayhem
{
	import flash.display.Bitmap;
	import nemostein.framework.dragonfly.Core;
	import nemostein.framework.dragonfly.plugins.particles.Emitter;
	import nemostein.framework.dragonfly.plugins.particles.helpers.forces.AccelerationForce;
	import nemostein.framework.dragonfly.plugins.particles.helpers.forces.FadeForce;
	import nemostein.framework.dragonfly.plugins.particles.helpers.forces.GrowthForce;
	import nemostein.framework.dragonfly.plugins.particles.helpers.forces.StirForce;
	import nemostein.framework.dragonfly.plugins.particles.helpers.graphics.SpriteGraphic;
	import nemostein.framework.dragonfly.plugins.particles.helpers.locations.TargetLocation;
	import nemostein.framework.dragonfly.plugins.particles.helpers.numerics.NumericValue;
	import nemostein.framework.dragonfly.plugins.particles.helpers.numerics.NumericVariance;
	import nemostein.framework.dragonfly.plugins.particles.helpers.tests.AgeTest;
	import nemostein.framework.dragonfly.plugins.particles.Particle;
	import nemostein.games.botmayhem.assets.particles.AssetRoundDegradeGray;
	import nemostein.games.botmayhem.bots.hero.HeroService;
	
	public class Particles
	{
		private var _container:Core;
		
		public function Particles(container:Core)
		{
			_container = container;
			
			initialize();
		}
		
		private function initialize():void
		{
			var emitter:Emitter = new Emitter();
			
			_container.add(emitter);
			
			//emitter.emissionLocation = new FixedLocation(300, 500);
			emitter.emissionLocation = new TargetLocation(HeroService.hero);
			emitter.emissionCount = new NumericValue(100);
			emitter.emissionDuration = new NumericValue(1);
			
			emitter.particleGraphic = new SpriteGraphic(Bitmap(new AssetRoundDegradeGray()).bitmapData);
			//emitter.particleGraphic = new SquareGraphic(5, 0xff000000);
			
			emitter.particleLife = new NumericVariance(5, 1);
			emitter.particleDirection = new NumericVariance(-Math.PI / 2, 0.3);
			emitter.particleSpeed = new NumericVariance(150, 100);
			emitter.particleAngle = new NumericValue(0);
			emitter.particleScaleX = new NumericValue(1);
			emitter.particleScaleY = new NumericValue(1);
			
			emitter.addForce(new AccelerationForce(-0.5));
			emitter.addForce(new StirForce(0.4));
			emitter.addForce(new GrowthForce(0.125));
			emitter.addForce(new FadeForce(-0.175));
			
			emitter.addTest(new AgeTest(ifAgeGreaterThanHalfSecond).greaterThan(0.5));
			
			emitter.onParticleBirth = onParticleBirth;
			emitter.onParticleDeath = onParticleDeath;
			emitter.onParticleIterate = onParticleIterate;
			
			emitter.start();
		}
		
		public function ifAgeGreaterThanHalfSecond(particle:Particle):void
		{
		
		}
		
		private function onParticleBirth(particle:Particle):void
		{
		
		}
		
		private function onParticleDeath(particle:Particle):void
		{
		
		}
		
		private function onParticleIterate(particle:Particle):void
		{
		
		}
	}
}