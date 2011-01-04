/**
 * User: John Lindquist
 * Date: 1/3/11
 * Time: 10:33 PM
 */
package game
{
	public class StrikeBehavior extends NormalRollBehavior
	{
		public function StrikeBehavior(bowlingFrame:BowlingFrame)
		{
			super(bowlingFrame);
		}

		override public function addPins(pins:int):void
		{
			numOfBonusRolls = 2;
			bowlingFrame.closeFrame();
		}
	}
}