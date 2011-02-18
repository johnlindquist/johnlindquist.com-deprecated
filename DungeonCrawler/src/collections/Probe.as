/**
 * User: John Lindquist
 * Date: 2/16/11
 * Time: 8:56 PM
 */
package collections
{
	import characters.Allowable;

	import map.TileMap;

	import tiles.Tile;

	public class Probe implements Allowable
	{
		private var terrainMap:TileMap;
		private var currentPosition:Position;
		
		private var possiblePositions:Array = new Array();
		
		public function Probe(terrainMap:TileMap)
		{
			this.terrainMap = terrainMap;
		}

		public function allow():void
		{
			possiblePositions.push(currentPosition);
		}

		public function deny():void
		{
		}

		public function visit(directions:Array):Array
		{
			for each (var position:Position in directions)
			{
				currentPosition = position;
				var tile:Tile = terrainMap.getTileByPosition(position);
				tile.accept(this);
			}
			
			return possiblePositions;
		}
	}
}