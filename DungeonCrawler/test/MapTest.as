/**
 * User: John Lindquist
 * Date: 2/15/11
 * Time: 10:40 PM
 */
package
{
	import map.TileMap;

	import org.flexunit.assertThat;
	import org.flexunit.asserts.assertStrictlyEquals;
	import org.hamcrest.collection.array;
	import org.hamcrest.core.isA;
	import org.hamcrest.core.not;
	import org.hamcrest.object.strictlyEqualTo;

	import tiles.NullTile;
	import tiles.Tile;

	public class MapTest
	{

		[Test]
		public function populating_the_top_row_of_the_map_should_all_have_the_same():void
		{
			var tile0:Tile = new Tile("0", 20);
			var map:TileMap = new TileMap(3, 3, graphic);

			var tile1:Tile = new Tile("1", 20);
			map.populateTopRow(tile1);

			assertThat(map.source[0], array(tile1, tile1, tile1));
			assertThat(map.source[1], array(tile0, tile0, tile0));
			assertThat(map.source[2], array(tile0, tile0, tile0));
		}

		[Test]
		public function populating_the_left_column_should_all_have_the_same():void
		{
			var tile0:Tile = new Tile("0", 20);
			var map:TileMap = new TileMap(3, 3, graphic);

			var tile1:Tile = new Tile("1", 20);
			map.populateLeftColumn(tile1);

			assertThat(map.source[0], array(tile1, tile0, tile0));
			assertThat(map.source[1], array(tile1, tile0, tile0));
			assertThat(map.source[2], array(tile1, tile0, tile0));
		}

		[Test]
		public function populating_the_right_column_should_all_have_the_same():void
		{
			var tile0:Tile = new Tile("0", 20);
			var map:TileMap = new TileMap(3, 3, graphic);

			var tile1:Tile = new Tile("1", 20);
			map.populateRightColumn(tile1);

			assertThat(map.source[0], array(tile0, tile0, tile1));
			assertThat(map.source[1], array(tile0, tile0, tile1));
			assertThat(map.source[2], array(tile0, tile0, tile1));
		}

		[Test]
		public function populating_the_bottom_row_should_all_have_the_same():void
		{
			var tile0:Tile = new Tile("0", 20);
			var map:TileMap = new TileMap(3, 3, graphic);

			var tile1:Tile = new Tile("1", 20);
			map.populateBottomRow(tile1);

			assertThat(map.source[0], array(tile0, tile0, tile0));
			assertThat(map.source[1], array(tile0, tile0, tile0));
			assertThat(map.source[2], array(tile1, tile1, tile1));
		}

		[Test]
		public function getting_a_tile_should_return_the_right_tile():void
		{
			var tile0:Tile = new Tile("0", 20);
			var map:TileMap = new TileMap(3, 3, graphic);

			var tile1:Tile = new Tile("1", 20);
			map.source[1][1] = tile1;

			assertStrictlyEquals(map.getTile(1, 1), tile1);
			assertStrictlyEquals(map.getTile(0, 0), tile0);
			assertThat(map.getTile(1, 1), not(strictlyEqualTo(tile0)));
		}

		[Test]
		public function getting_a_null_tile_should_return_a_null_tile():void
		{
			var tile0:Tile = new Tile("0", 20);
			var map:TileMap = new TileMap(3, 3, graphic);

			var tile1:Tile = new Tile("1", 20);
			map.source[1][1] = tile1;

			assertThat(map.getTile(0, 0), not(isA(NullTile)));
			assertThat(map.getTile(0, 0), isA(Tile));
			assertThat(map.getTile(10, 10), isA(NullTile));
		}
	}
}