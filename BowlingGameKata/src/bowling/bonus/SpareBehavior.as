/**
 * User: John Lindquist
 * Date: 1/3/11
 * Time: 10:33 PM
 */
package bowling.bonus
{
	import bowling.frames.BowlingFrame;

	public class SpareBehavior extends RollBehavior
	{
		public function SpareBehavior(bowlingFrame:BowlingFrame)
		{
			super(bowlingFrame);
		}

		override public function setupBonus(pins:int):void
		{
			numOfBonusRolls = 1;
			bowlingFrame.updateRollIndex();
		}
	}
}