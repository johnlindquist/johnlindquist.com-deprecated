/**
 * User: John Lindquist
 * Date: 2/15/11
 * Time: 10:41 PM
 */
package
map
{
	import collections.Array2D;

	import tiles.*;

	public class TileMap extends Array2D
	{

		public function TileMap(columns:int, rows:int, defaultValue:Tile)
		{
			super(columns, rows, defaultValue);
		}

		public function populateTopRow(value:Tile):void
		{
			for (var i:int = 0; i < source[0].length; i++)
			{
				source[0][i] = value;
			}
		}

		public function populateLeftColumn(value:Tile):void
		{
			for (var i:int = 0; i < source.length; i++)
			{
				source[i][0] = value;
			}
		}

		public function populateRightColumn(value:Tile):void
		{
			var farRight:int = source[0].length - 1;
			for (var i:int = 0; i < source.length; i++)
			{
				source[i][farRight] = value;
			}
		}

		public function populateBottomRow(value:Tile):void
		{
			var bottomRow:int = source.length - 1;
			for (var i:int = 0; i < source[bottomRow].length; i++)
			{
				source[bottomRow][i] = value;
			}

		}

		public function getTile(column:int, row:int):Tile
		{
			if (source[column])
			{
				var tile:Tile = source[column][row] as Tile;
				if (tile)
				{
					return tile;
				}
			}
			return Tile.getNullTile();
		}

	}
}