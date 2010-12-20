/**
 * User: John Lindquist
 * Date: 12/20/10
 * Time: 3:59 AM
 */
package patterncraft.decorator
{
	public class Marine implements Infantry
	{

		public function get damage():int
		{
			return 6;
		}

		public function get armor():int
		{
			return 0;
		}
	}
}