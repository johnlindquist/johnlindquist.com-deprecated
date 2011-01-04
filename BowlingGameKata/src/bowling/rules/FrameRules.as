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

	public class FrameRules
	{
		private var pinsPerFrame:int;

		public function FrameRules(pinsPerFrame:int)
		{
			this.pinsPerFrame = pinsPerFrame;
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
	}
}