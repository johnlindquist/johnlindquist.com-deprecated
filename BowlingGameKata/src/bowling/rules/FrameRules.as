/**
 * User: John Lindquist
 * Date: 1/4/11
 * Time: 5:11 PM
 */
package bowling.rules
{
	import bowling.bonus.BonusBehavior;
	import bowling.frames.BowlingFrame;

	public interface FrameRules
	{
		function determineBehavior(bowlingFrame:BowlingFrame, pins:int):BonusBehavior;
		function updateRolls(bowlingFrame:BowlingFrame):void;
	}
}