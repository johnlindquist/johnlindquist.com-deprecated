/**
 * User: John Lindquist
 * Date: 12/20/10
 * Time: 4:07 AM
 */
package patterncraft.decorator
{
	public class Marauder implements Infantry
	{

		public function get damage():int
		{
			return 10;
		}

		public function get armor():int
		{
			return 1;
		}
	}
}