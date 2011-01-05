/**
 * User: John Lindquist
 * Date: 1/3/11
 * Time: 6:24 PM
 */
package bowling.frames
{
	import bowling.bonus.BonusBehavior;
	import bowling.rules.FrameRules;

	import flash.events.Event;
	import flash.events.EventDispatcher;

	public class BowlingFrame extends EventDispatcher
	{
		private var rules:FrameRules;
		private var bonusBehavior:BonusBehavior;
		private var previousFrame:BowlingFrame;
		
		public var score:int = 0;
		public var rollIndex:int = 0;

		public function BowlingFrame(rules:FrameRules)
		{
			this.rules = rules;
		}

		public function addPins(pins:int):void
		{
			score += pins;
			bonusBehavior = rules.determineBehavior(this, pins);
			
			addBonusPinsToPreviousFrame(pins);
		}

		public function addBonusPinsToPreviousFrame(pins:int):void
		{
			if (previousFrame)
			{
				previousFrame.addBonusPins(pins);
			}
		}

		public function addBonusPins(pins:int):void
		{
			bonusBehavior.addBonusPins(pins);
			
			addBonusPinsToPreviousFrame(pins);
		}

		public function setPreviousFrame(frame:BowlingFrame):void
		{
			previousFrame = frame;
		}

		public function updateFrame():void
		{
			rules.updateRolls(this);
		}

		public function closeFrame():void
		{
			dispatchEvent(new Event(Event.CLOSE));
		}
	}
}