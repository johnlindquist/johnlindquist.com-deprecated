package
{
	import characters.Hero;

	import commands.MoveHeroCommand;

	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;

	import map.CharacterMap;
	import map.MapRenderer;
	import map.TileMap;

	import tiles.Tile;
	import tiles.TileFactory;
	import tiles.Wall;

	public class DungeonCrawler extends Sprite
	{
		private var terrainBitmap:Bitmap;

		private var characterBitmap:Bitmap;

		private var hero:Hero;

		private var terrainMap:TileMap;

		private var characterMap:CharacterMap;

		private var mapRenderer:MapRenderer;

		public function DungeonCrawler()
		{
			var tileFactory:TileFactory = new TileFactory();
			var defaultTile:Tile = tileFactory.getTile("0");
			var wallTile:Wall = tileFactory.getWall("|");

			terrainMap = new TileMap(15, 15, defaultTile);
			terrainMap.populateTopRow(wallTile);
			terrainMap.populateLeftColumn(wallTile);
			terrainMap.populateRightColumn(wallTile);
			terrainMap.populateBottomRow(wallTile);

			characterMap = new CharacterMap(terrainMap.columns, terrainMap.rows, new Tile(Tile.BLANK_TILE));
			hero = new Hero("@");
			characterMap.addHero(hero);

			mapRenderer = new MapRenderer();

			terrainBitmap = new Bitmap(new BitmapData(500, 500, true, 0x00000000));
			characterBitmap = new Bitmap(new BitmapData(500, 500, true, 0x00000000));

			mapRenderer.render(terrainMap, terrainBitmap);
			mapRenderer.render(characterMap, characterBitmap);

			addChild(terrainBitmap);
			addChild(characterBitmap);

			stage.addEventListener(KeyboardEvent.KEY_DOWN, stage_keyDownHandler);
		}

		private function stage_keyDownHandler(event:KeyboardEvent):void
		{
			if (event.keyCode == Keyboard.UP || event.keyCode == Keyboard.DOWN || event.keyCode == Keyboard.LEFT || event.keyCode == Keyboard.RIGHT)
			{
				var moveHero:MoveHeroCommand = new MoveHeroCommand(hero, event.keyCode, characterMap, terrainMap);
				moveHero.execute();

				mapRenderer.render(characterMap, characterBitmap);
			}
		}
	}
}
