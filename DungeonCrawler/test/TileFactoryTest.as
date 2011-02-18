/**
 * User: John Lindquist
 * Date: 2/16/11
 * Time: 12:07 AM
 */
package
{
	import org.flexunit.asserts.assertStrictlyEquals;

	import tiles.Tile;
	import tiles.TileFactory;

	public class TileFactoryTest
	{
		[Test]
		public function getting_2_of_the_same_ascii_should_return_the_same_instance():void
		{
			var tileFactory:TileFactory = new TileFactory(20);
			var tile:Tile = tileFactory.getTile("@");
			var tile2:Tile = tileFactory.getTile("@");
			assertStrictlyEquals(tile, tile2);
		}
	}
}