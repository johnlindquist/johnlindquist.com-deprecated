/**
 * User: John Lindquist
 * Date: 1/3/11
 * Time: 10:33 PM
 */
package game
{
	import flash.events.Event;

	public class SpareBehavior implements AddPinsBehavior
	{
		private var bowlingFrame:BowlingFrame;
		private var numOfBonusRolls:int;

		public function addPins(bowlingFrame:BowlingFrame, pins:int):void
		{
			this.bowlingFrame = bowlingFrame;
			
			bowlingFrame.dispatchEvent(new Event(Event.CLOSE));
			bowlingFrame.addBonusPinsToPreviousFrame(pins);
			
			numOfBonusRolls = 1;
		}

		public function addBonusPins(pins:int):void
		{
			if (numOfBonusRolls > 0)
			{
				bowlingFrame.frameScore += pins;
				bowlingFrame.addBonusPinsToPreviousFrame(pins);
				numOfBonusRolls--;
			}
		}
	}
}