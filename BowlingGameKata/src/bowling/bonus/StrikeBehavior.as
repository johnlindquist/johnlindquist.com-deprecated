/**
 * User: John Lindquist
 * Date: 1/3/11
 * Time: 10:33 PM
 */
package bowling.bonus
{
	import bowling.frames.BowlingFrame;

	public class StrikeBehavior extends RollBehavior
	{
		public function StrikeBehavior(bowlingFrame:BowlingFrame)
		{
			super(bowlingFrame);
		}

		override public function setupBonus(pins:int):void
		{
			numOfBonusRolls = 2;
			bowlingFrame.closeFrame();
		}
	}
}