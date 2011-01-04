/**
 * User: John Lindquist
 * Date: 1/3/11
 * Time: 10:34 PM
 */
package game
{
	public class NotAllPinsBehavior implements AddPinsBehavior
	{
		private var bowlingFrame:BowlingFrame;

		public function addPins(bowlingFrame:BowlingFrame, pins:int):void
		{
			this.bowlingFrame = bowlingFrame;
			
			bowlingFrame.addBonusPinsToPreviousFrame(pins);
			bowlingFrame.nextRoll();
		}

		public function addBonusPins(pins:int):void
		{
			//You don't get a bonus if you don't knock over all the pins!
		}
	}
}