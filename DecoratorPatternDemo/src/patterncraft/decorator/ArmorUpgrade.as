/**
 * User: John Lindquist
 * Date: 12/20/10
 * Time: 4:05 AM
 */
package patterncraft.decorator
{
	public class ArmorUpgrade extends InfantryDecorator
	{

		public function ArmorUpgrade(infantry:Infantry)
		{
			super(infantry);
		}

		override public function get armor():int
		{
			return super.armor + 1;
		}
	}
}