/**
 * User: John Lindquist
 * Date: 2/16/11
 * Time: 1:07 AM
 */
package map
{
	import flash.display.Bitmap;
	import flash.geom.Matrix;

	import tiles.Tile;

	public class MapRenderer
	{
		private var _size:int;
		private var _bitmap:Bitmap;
		public function render(tileMap:TileMap, bitmap:Bitmap, size:int):void
		{
			_bitmap = bitmap;
			_size = size;

			_bitmap.bitmapData.fillRect(_bitmap.bitmapData.rect, 0xff0000);
			tileMap.walk(renderMap);
				
		}

		private function renderMap(tile:Tile, x:int, y:int):Tile
		{
			var matrix:Matrix = new Matrix();
			matrix.translate(x * _size, y * _size);
			if (!tile.isHidden)
			{
				_bitmap.bitmapData.draw(tile.graphic, matrix);
			}
			
			return tile;
		}
	}
}