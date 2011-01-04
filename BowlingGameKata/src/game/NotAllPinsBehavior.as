/**
 * User: John Lindquist
 * Date: 1/3/11
 * Time: 10:34 PM
 */
package game
{
	import flash.events.Event;

	public class NotAllPinsBehavior implements AddPinsBehavior
	{
		private var bowlingFrame:BowlingFrame;

		public function addPins(bowlingFrame:BowlingFrame, pins:int):void
		{
			this.bowlingFrame = bowlingFrame;
			
			if (bowlingFrame.rollLimitReached())
			{
				bowlingFrame.dispatchEvent(new Event(Event.CLOSE));
			}
			else
			{
				bowlingFrame.nextRoll();
			}
			bowlingFrame.addBonusPinsToPreviousFrame(pins);
		}

		public function addBonusPins(pins:int):void
		{
			//You don't get a bonus if you don't knock over all the pins!
		}
	}
}