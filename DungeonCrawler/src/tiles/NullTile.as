/**
 * User: John Lindquist
 * Date: 2/16/11
 * Time: 1:17 AM
 */
package
tiles
{
	import characters.Allowable;

	public class NullTile extends Tile
	{

		public function NullTile(defaultValue)
		{
			super(defaultValue);
		}


		override public function accept(visitor:Allowable):void
		{
			visitor.deny();
		}
	}
}