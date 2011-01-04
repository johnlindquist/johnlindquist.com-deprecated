/**
 * User: John Lindquist
 * Date: 1/3/11
 * Time: 10:32 PM
 */
package bowling.bonus
{
	public interface BonusBehavior
	{
		function setupBonus(pins:int):void;
		function addBonusPins(pins:int):void;
	}
}