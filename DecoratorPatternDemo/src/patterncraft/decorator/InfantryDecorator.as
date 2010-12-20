/**
 * User: John Lindquist
 * Date: 12/20/10
 * Time: 4:01 AM
 */
package patterncraft.decorator
{
	public class InfantryDecorator implements Infantry
	{
		protected var infantry:Infantry;

		public function InfantryDecorator(infantry:Infantry)
		{
			this.infantry = infantry;
		}

		public function get damage():int
		{
			return infantry.damage;
		}

		public function get armor():int
		{
			return infantry.armor;
		}
	}
}