/**
 * User: John Lindquist
 * Date: 1/3/11
 * Time: 6:24 PM
 */
package bowling.frames
{
	import flash.events.Event;
	import flash.events.EventDispatcher;

	import bowling.bonus.BonusBehavior;
	import bowling.rules.FrameRules;

	public class BowlingFrame extends EventDispatcher
	{
		private var rules:FrameRules;
		private var bonusBehavior:BonusBehavior;
		private var previousFrame:BowlingFrame;

		private var maxRollIndex:int;
		private var rollIndex:int = 0;
		
		public var score:int = 0;

		public function BowlingFrame(rules:FrameRules, maxRollIndex:int = 1)
		{
			this.rules = rules;
			this.maxRollIndex = maxRollIndex;
		}

		public function addPins(pins:int):void
		{
			score += pins;
			bonusBehavior = rules.determineBehavior(this, pins);
			bonusBehavior.setupBonus(pins);
			
			addBonusPinsToPreviousFrame(pins);
		}

		public function addBonusPins(pins:int):void
		{
			bonusBehavior.addBonusPins(pins);
			
			addBonusPinsToPreviousFrame(pins);
		}

		public function addBonusPinsToPreviousFrame(pins:int):void
		{
			if (previousFrame)
			{
				previousFrame.addBonusPins(pins);
			}
		}

		public function setPreviousFrame(previousFrame:BowlingFrame):void
		{
			this.previousFrame = previousFrame;
		}

		public function updateRollIndex():void
		{
			if (rollIndex == maxRollIndex)
			{
				closeFrame();
			}
			else
			{
				rollIndex++;
			}
		}

		public function closeFrame():void
		{
			dispatchEvent(new Event(Event.CLOSE));
		}
	}
}