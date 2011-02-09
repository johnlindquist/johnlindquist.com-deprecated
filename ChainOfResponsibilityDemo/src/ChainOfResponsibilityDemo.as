package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;

	import patterncraft.chain.Marine;
	import patterncraft.chain.MedivacLink;

	[SWF(backgroundColor="0xffffff", frameRate="60", width="600", height="600")]
	public class ChainOfResponsibilityDemo extends Sprite
	{
		private var marines:Array;
		private var medivacChain:MedivacLink;

		private static const TOTAL_MEDIVACS:int = 20;
		private static const MARINES_TOTAL:int = 400;

		public function ChainOfResponsibilityDemo()
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;

			createAndLayoutMarines();
			createMedivacs();
			startHealing();
		}

		private function createMedivacs():void
		{
			medivacChain = new MedivacLink();
			addChild(medivacChain);
			
			var currentMedivac:MedivacLink = medivacChain;
			for (var i:int = 1; i < TOTAL_MEDIVACS; i++)
			{
				var medivac:MedivacLink = new MedivacLink();
				addChild(medivac);

				currentMedivac.setNextMedivac(medivac);
				
				currentMedivac = medivac;
			}
		}

		private function createAndLayoutMarines():void
		{
			marines = new Array();
			
			//create marines and add event
			var i:int;
			var marine:Marine;
			for (i = 0; i < MARINES_TOTAL; i++)
			{
				marine = new Marine();
				marine.addEventListener(Event.CHANGE, onMarineHealed);
				addChild(marine);
				marines.push(marine);
			}

			//layout marines in a grid
			var padding:Number = 15;
			var spacing:Number = 30;
			
			var columns:int = 20;
			var currentRow:int = 0;
			var currentColumn:int = 0;

			for (i = 0; i < MARINES_TOTAL; i++)
			{
				currentColumn = i % columns;
				currentRow = Math.floor(i / columns);
				
				marine = marines[i];
				marine.x = currentColumn * spacing + padding;
				marine.y = currentRow * spacing + padding;
			}
		}

		private function startHealing():void
		{
			for (var i:int = 0; i < TOTAL_MEDIVACS; i++)
			{
				var hurtMarine:Marine = getHurtMarine();
				medivacChain.heal(hurtMarine);
			}
		}

		private function onMarineHealed(event:Event):void
		{
			var marine:Marine = getHurtMarine();
			if (marine != null)
			{
				medivacChain.heal(marine);
			}
		}

		private function getHurtMarine():Marine
		{
			return marines.shift();
		}
	}
}
