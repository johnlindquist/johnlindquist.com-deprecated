/**
 * User: John Lindquist
 * Date: 2/16/11
 * Time: 2:30 AM
 */
package commands
{
	import characters.Allowable;
	import characters.Hero;

	import characters.Monster;

	import characters.NullMonster;

	import collections.Position;

	import flash.ui.Keyboard;

	import map.CharacterMap;
	import map.MapRenderer;
	import map.TileMap;

	import tiles.Tile;

	public class MoveHeroCommand implements Command, Allowable
	{
		private var hero:Hero;
		private var direction:uint;
		private var characterMap:CharacterMap;
		private var terrainMap:TileMap;
		private var position:Position;
		private var mapRenderer:MapRenderer;

		public function MoveHeroCommand(hero:Hero, direction:uint, characterMap:CharacterMap, terrainMap:TileMap)
		{
			this.hero = hero;
			this.direction = direction;
			this.characterMap = characterMap;
			this.terrainMap = terrainMap;
			this.mapRenderer = mapRenderer;
		}

		public function execute():void
		{
			position = characterMap.findHero(hero);
			switch (direction)
			{
				case Keyboard.DOWN:
					position.row++;
					break;
				case Keyboard.UP:
					position.row--;
					break;
				case Keyboard.RIGHT:
					position.column++;
					break;
				case Keyboard.LEFT:
					position.column--;
					break;
			}

			var monster:Monster = characterMap.findMonster(position.column, position.row);
			monster.accept(hero);
			if(!(monster is NullMonster)) return;
			
			var tile:Tile = terrainMap.getTile(position.column, position.row);
			tile.accept(this);
		}

		public function allow():void
		{
			characterMap.updateHero(hero, position.column, position.row);
		}

		public function deny():void
		{
			//do nothing for now
		}
	}
}