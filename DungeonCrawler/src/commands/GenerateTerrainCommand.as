/**
 * User: John Lindquist
 * Date: 2/16/11
 * Time: 9:48 AM
 */
package commands
{
	import map.TileMap;

	import tiles.Tile;

	public class GenerateTerrainCommand implements Command
	{
		private var terrainMap:TileMap;
		private var defaultTile:Tile;

		public function GenerateTerrainCommand(terrainMap:TileMap, defaultTile:Tile)
		{
			this.terrainMap = terrainMap;
			this.defaultTile = defaultTile;
		}


		public function execute():void
		{
			var tile:Tile = terrainMap.getTile(1, 1);
			for (var i:int = 0; i < terrainMap.columns; i++)
			{
				for (var j:int = 0; j < terrainMap.rows; j++)
				{
					if(Math.random() < .75)
					{
						terrainMap.setTile(defaultTile, i, j);
					}
				}
				
			}
		}
	}
}