/**
 * User: John Lindquist
 * Date: 1/3/11
 * Time: 10:33 PM
 */
package game
{
	public class SpareBehavior implements AddPinsBehavior
	{
		private var bowlingFrame:BowlingFrame;
		private var numOfBonusRolls:int;

		public function addPins(bowlingFrame:BowlingFrame, pins:int):void
		{
			this.bowlingFrame = bowlingFrame;
			
			bowlingFrame.addBonusPinsToPreviousFrame(pins);
			
			numOfBonusRolls = 1;
			
			bowlingFrame.nextRoll();
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