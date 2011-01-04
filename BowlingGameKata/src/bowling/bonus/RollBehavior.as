/**
 * User: John Lindquist
 * Date: 1/4/11
 * Time: 12:08 PM
 */
package bowling.bonus
{
	import bowling.frames.BowlingFrame;

	public class RollBehavior implements BonusBehavior
	{
		protected var bowlingFrame:BowlingFrame;
		protected var numOfBonusRolls:int;

		public function RollBehavior(bowlingFrame:BowlingFrame)
		{
			this.bowlingFrame = bowlingFrame;
		}

		public function setupBonus(pins:int):void
		{
			bowlingFrame.updateRollIndex();
		}

		public function addBonusPins(pins:int):void
		{
			if (numOfBonusRolls > 0)
			{
				bowlingFrame.score += pins;
				numOfBonusRolls--;
			}
		}
	}
}