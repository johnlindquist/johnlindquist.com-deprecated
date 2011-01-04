/**
 * User: John Lindquist
 * Date: 1/3/11
 * Time: 10:33 PM
 */
package game
{
	public class SpareBehavior extends NormalRollBehavior
	{
		override public function addPins(bowlingFrame:BowlingFrame, pins:int):void
		{
			this.bowlingFrame = bowlingFrame;
			numOfBonusRolls = 1;
			bowlingFrame.nextRoll();
		}
	}
}