/**
 * User: John Lindquist
 * Date: 2/16/11
 * Time: 12:56 AM
 */
package
tiles
{
	import characters.Allowable;

	import flash.display.BitmapData;

	public class Wall extends Tile
	{
		
		public function Wall(graphic:BitmapData)
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