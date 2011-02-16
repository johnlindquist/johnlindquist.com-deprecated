/**
 * User: John Lindquist
 * Date: 2/16/11
 * Time: 1:02 AM
 */
package characters
{
	import tiles.Tile;

	public class Hero extends Tile implements Allowable
	{

		public function Hero(ascii:String)
		{
			super(ascii);
		}

		public function allow():void
		{
		}

		public function deny():void
		{
		}
	}
}