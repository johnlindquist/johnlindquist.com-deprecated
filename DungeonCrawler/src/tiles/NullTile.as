/**
 * User: John Lindquist
 * Date: 2/16/11
 * Time: 1:17 AM
 */
package
tiles
{
	import characters.Allowable;

	import flash.display.BitmapData;

	public class NullTile extends Tile
	{

		public function NullTile(graphic:BitmapData)
		{
			super(graphic);
		}


		override public function accept(visitor:Allowable):void
		{
			visitor.deny();
		}


		override public function get traversable():Boolean
		{
			return false;
		}
	}
}