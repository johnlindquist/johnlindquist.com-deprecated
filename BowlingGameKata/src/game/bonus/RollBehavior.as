/**
 * User: John Lindquist
 * Date: 1/4/11
 * Time: 12:08 PM
 */
package game.bonus
{
	import game.frames.BowlingFrame;

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
			bowlingFrame.nextRoll();
		}

		public function addBonusPins(pins:int):void
		{
			if (numOfBonusRolls > 0)
			{
				bowlingFrame.frameScore += pins;
				numOfBonusRolls--;
			}
		}
	}
}