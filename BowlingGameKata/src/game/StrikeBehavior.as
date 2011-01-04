/**
 * User: John Lindquist
 * Date: 1/3/11
 * Time: 10:33 PM
 */
package game
{
	public class StrikeBehavior extends NormalRollBehavior
	{

		override public function addPins(bowlingFrame:BowlingFrame, pins:int):void
		{
			this.bowlingFrame = bowlingFrame;
			numOfBonusRolls = 2;
			bowlingFrame.closeFrame();
		}

	}
}