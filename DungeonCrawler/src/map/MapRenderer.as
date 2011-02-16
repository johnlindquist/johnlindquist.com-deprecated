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
		public function render(tileMap:TileMap, bitmap:Bitmap):void
		{
			bitmap.bitmapData.fillRect(bitmap.bitmapData.rect, 0xff0000);
			for (var i:int = 0; i < tileMap.source.length; i++)
			{
				var row:Array = tileMap.source[i];
				for (var j:int = 0; j < row.length; j++)
				{
					var tile:Tile = row[j] as Tile;
					var matrix:Matrix = new Matrix();
					matrix.translate(20 + i * 20, 20 + j * 20);
					if (!tile.isHidden)
					{
						bitmap.bitmapData.draw(tile.graphic, matrix);
					}
					trace(tile.ascii);
				}
			}
		}
	}
}