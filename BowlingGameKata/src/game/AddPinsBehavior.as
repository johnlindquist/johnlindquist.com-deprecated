/**
 * User: John Lindquist
 * Date: 1/3/11
 * Time: 10:32 PM
 */
package game
{
	public interface AddPinsBehavior
	{
		function addPins(bowlingFrame:BowlingFrame, pins:int):void;
		function addBonusPins(pins:int):void;
	}
}