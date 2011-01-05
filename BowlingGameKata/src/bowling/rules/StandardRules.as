/**
 * User: John Lindquist
 * Date: 1/4/11
 * Time: 9:50 AM
 */
package bowling.rules
{
	import bowling.bonus.BonusBehavior;
	import bowling.bonus.RollBehavior;
	import bowling.bonus.SpareBehavior;
	import bowling.bonus.StrikeBehavior;
	import bowling.frames.BowlingFrame;

	public class StandardRules implements FrameRules
	{
		private var pinsPerFrame:int;
		private var rollsPerFrame:int;

		public function StandardRules(pinsPerFrame:int, rollsPerFrame:int)
		{
			this.pinsPerFrame = pinsPerFrame;
			this.rollsPerFrame = rollsPerFrame;
		}

		public function determineBehavior(bowlingFrame:BowlingFrame, pins:int):BonusBehavior
		{
			var isStrike:Boolean = (pins == pinsPerFrame);
			if (isStrike)
			{
				return new StrikeBehavior(bowlingFrame);
			}

			var isSpare:Boolean = (bowlingFrame.score == pinsPerFrame);
			if (isSpare)
			{
				return new SpareBehavior(bowlingFrame);
			}

			return new RollBehavior(bowlingFrame);
		}

		public function updateRolls(bowlingFrame:BowlingFrame):void
		{
			if (bowlingFrame.rollIndex == rollsPerFrame)
			{
				bowlingFrame.closeFrame();
			}
			else
			{
				bowlingFrame.rollIndex++;
			}
		}
	}
}