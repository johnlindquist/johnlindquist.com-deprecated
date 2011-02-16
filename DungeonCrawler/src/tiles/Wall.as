/**
 * User: John Lindquist
 * Date: 2/16/11
 * Time: 12:56 AM
 */
package
tiles
{
	import characters.Allowable;

	public class Wall extends Tile
	{

		public function Wall(ascii:String)
		{
			super(ascii);
		}


		override public function accept(visitor:Allowable):void
		{
			visitor.deny();
		}
	}
}