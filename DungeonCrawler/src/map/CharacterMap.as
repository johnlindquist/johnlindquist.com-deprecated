/**
 * User: John Lindquist
 * Date: 2/16/11
 * Time: 2:04 AM
 */
package map
{
	import characters.Hero;

	import collections.Position;

	import flash.utils.Dictionary;

	import tiles.Tile;

	public class CharacterMap extends TileMap
	{
		private var heroLookup:Dictionary = new Dictionary();
		private var defaultValue:Tile;

		public function CharacterMap(columns:int, rows:int, defaultValue:Tile)
		{
			this.defaultValue = defaultValue;
			super(columns, rows, defaultValue);
		}

		public function addHero(hero:Hero, column:int = 1, row:int = 1):void
		{
			source[column][row] = hero;
			heroLookup[hero] = new Position(column, row);
		}

		public function updateHero(hero:Hero, column:int, row:int):void
		{
			var position:Position = findHero(hero);
			source[position.column][position.row] = defaultValue;

			source[column][row] = hero;
			heroLookup[hero] = new Position(column, row);
		}

		public function findHero(hero:Hero):Position
		{
			var position:Position = heroLookup[hero] as Position;
			return position.clone();
		}
	}
}