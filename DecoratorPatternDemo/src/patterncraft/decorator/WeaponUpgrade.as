/**
 * User: John Lindquist
 * Date: 12/20/10
 * Time: 4:02 AM
 */
package patterncraft.decorator
{
	public class WeaponUpgrade extends InfantryDecorator
	{

		public function WeaponUpgrade(infantry:Infantry)
		{
			super(infantry);
		}


		override public function get damage():int
		{
			return super.damage + 1;
		}
	}
}