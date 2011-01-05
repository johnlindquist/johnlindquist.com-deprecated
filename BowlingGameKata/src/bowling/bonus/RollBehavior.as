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
		protected var totalBonusRollsToBeAdded:int;
		
		public function RollBehavior(bowlingFrame:BowlingFrame)
		{
			this.bowlingFrame = bowlingFrame;
			init();
		}

		public function init():void
		{
			totalBonusRollsToBeAdded = 0;
			bowlingFrame.updateFrame();
		}

		public function addBonusPins(pins:int):void
		{
			if(totalBonusRollsToBeAdded > 0)
			{
				bowlingFrame.score += pins;
			}

			totalBonusRollsToBeAdded--;
		}
	}
}