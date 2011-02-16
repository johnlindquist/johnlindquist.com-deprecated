/**
 * User: John Lindquist
 * Date: 2/16/11
 * Time: 12:01 AM
 */
package
tiles
{
	import flash.utils.Dictionary;

	public class TileFactory
	{
		private var tileDictionary:Dictionary = new Dictionary();

		public function getTile(ascii:String):Tile
		{
			var tile:Tile = tileDictionary[ascii];
			if (tile)
			{
				return tile;
			}

			tile = tileDictionary[ascii] = new Tile(ascii);
			return tile;
		}

		public function getWall(ascii:String):Wall
		{
			var tile:Wall = tileDictionary[ascii];
			if (tile)
			{
				return tile;
			}

			tile = tileDictionary[ascii] = new Wall(ascii);
			return tile;
		}
	}
}