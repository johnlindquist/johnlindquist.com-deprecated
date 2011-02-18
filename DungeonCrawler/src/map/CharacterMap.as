/**
 * User: John Lindquist
 * Date: 2/16/11
 * Time: 2:04 AM
 */
package map
{
	import characters.Hero;

	import characters.Monster;

	import collections.Array2D;
	import collections.Position;

	import com.greensock.TweenMax;

	import com.greensock.easing.Linear;

	import flash.utils.Dictionary;

	import tiles.Tile;

	public class CharacterMap extends Array2D
	{
		private var heroLookup:Dictionary = new Dictionary();
		private var size:int;

		public function CharacterMap(columns:int, rows:int, size:int)
		{
			this.size = size;
			super(columns, rows, Monster.getNullMonster());
		}

		public function addHero(hero:Hero, column:int = 0, row:int = 0):void
		{
			source[column][row] = hero;
			heroLookup[hero] = new Position(column, row);
			hero.x = column * size;
			hero.y = row * size;
		}

		public function updateHero(hero:Hero, column:int, row:int):void
		{
			var position:Position = findHero(hero);
			source[position.column][position.row] = Monster.getNullMonster();

			source[column][row] = hero;
			heroLookup[hero] = new Position(column, row);

			TweenMax.to(hero, .1, {x: column * size, y: row * size, ease:Linear.easeNone});
		}

		public function findHero(hero:Hero):Position
		{
			var position:Position = heroLookup[hero] as Position;
			return position.clone();
		}

		public function addMonster(monster:Monster, column:int, row:int):void
		{
			source[column][row] = monster;
			monster.x = column * size;
			monster.y = row * size;
		}

		public function findMonster(column:uint, row:uint):Monster
		{
			var monster:Monster = Monster.getNullMonster();
			if(source[column])
			{
				if(source[column][row])
				{
					monster = source[column][row];
				}
			}
			return monster;
		}
	}
}