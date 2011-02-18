/**
 * User: John Lindquist
 * Date: 2/15/11
 * Time: 10:41 PM
 */
package
map
{
	import collections.Position;

	import de.polygonal.ds.Array2;

	import flash.display.BitmapData;

	import tiles.Tile;

	public class TileMap extends Array2
	{
		private var defaultGraphic:BitmapData;

		public function TileMap(columns:int, rows:int, defaultGraphic:BitmapData)
		{
			this.defaultGraphic = defaultGraphic;
			super(columns, rows);
			walk(prepopulate);

			trace(toString());
		}

		private function prepopulate(val:*, x:int, y:int):Tile
		{
			var tile:Tile = new Tile(defaultGraphic);
			tile.traversable = false;
			tile.x = x;
			tile.y = y;
			
			return tile; 
		}

		public function populateTopRow(value:Tile):void
		{
			var w:int = getW();
			for (var i:int = 0; i < w; i++)
			{
				var tile:Tile = Tile(get(i, 0));
				tile.graphic = value.graphic;
				tile.traversable = value.traversable;
			}
		}

		public function populateLeftColumn(value:Tile):void
		{
			var h:int = getH();
			for (var i:int = 0; i < h; i++)
			{
				var tile:Tile = Tile(get(0, i));
				tile.graphic = value.graphic;
				tile.traversable = value.traversable;
			}
		}

		public function populateRightColumn(value:Tile):void
		{
			var w:int = getW() - 1;
			var h:int = getH();
			for (var i:int = 0; i < h; i++)
			{
				var tile:Tile = Tile(get(w, i));
				tile.graphic = value.graphic;
				tile.traversable = value.traversable;
			}
		}

		public function populateBottomRow(value:Tile):void
		{
			var w:int = getW();
			var h:int = getH() - 1;
			for (var i:int = 0; i < w; i++)
			{
				var tile:Tile = Tile(get(i, h));
				tile.graphic = value.graphic;
				tile.traversable = value.traversable;
			}

		}

		public function getTile(column:int, row:int):Tile
		{

			var tile:Tile = get(column, row) as Tile;
			if (tile)
			{
				return tile;
			}
			return Tile.getNullTile();
		}

		public function setTile(tile:Tile, column:int, row:int):void
		{
			set(column, row, tile);
		}

		public function getTileByPosition(position:Position):Tile
		{
			var tile:Tile = get(position.column, position.row) as Tile;
			if (tile)
			{
				return tile;
			}
			return Tile.getNullTile();
		}

		public function generateRandomRoom(tile:Tile):void
		{
			var offsetX:Number = Math.floor(Math.random() * 10);
			var offsetY:Number = Math.floor(Math.random() * 10);
			
			var width:Number = Math.floor(Math.random() * 20) + 5;
			var height:Number = Math.floor(Math.random() * 20) + 5;
			
			var roomTile:Tile;
			
			var room:Array2 = new Array2(width, height);
			for (var i:int = 0; i < width; i++)
			{
				for (var j:int = 0; j < height; j++)
				{
					roomTile = get(offsetX + i, offsetY + j) as Tile;
					roomTile.graphic = tile.graphic;
					roomTile.traversable = tile.traversable;
					
				}
			}
		}

	}
}