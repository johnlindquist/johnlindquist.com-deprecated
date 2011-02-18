package
{
	import characters.Hero;
	import characters.Monster;

	import com.greensock.TweenMax;
	import com.untoldentertainment.pathfinding.INode;
	import com.untoldentertainment.pathfinding.Pathfinder;

	import commands.MoveHeroCommand;

	import de.polygonal.ds.Itr;

	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;

	import map.CharacterMap;
	import map.MapRenderer;
	import map.TileMap;

	import tiles.GraphicFactory;
	import tiles.Tile;
	import tiles.Wall;

	[SWF(width="1000", height="1000", frameRate="31")]
	public class DungeonCrawler extends Sprite
	{
		private var terrainBitmap:Bitmap;

		private var hero:Hero;

		private var terrainMap:TileMap;

		private var characterMap:CharacterMap;

		private var mapRenderer:MapRenderer;

		public static const SIZE:int = 15;

		public static const WIDTH:int = 35;

		public static const HEIGHT:int = 35;

		public var graphicFactory:GraphicFactory;

		public function DungeonCrawler()
		{
			graphicFactory = new GraphicFactory(SIZE);
			var graphic:BitmapData = graphicFactory.getGraphic("■");
			
			terrainMap = new TileMap(WIDTH, HEIGHT, graphic);

			characterMap = new CharacterMap(terrainMap.getW(), terrainMap.getH(), SIZE);
			hero = new Hero("♘", SIZE);
			characterMap.addHero(hero, 1, 1);

			var monster:Monster = new Monster("☠", SIZE);

			characterMap.addMonster(monster, 10, 10);

			mapRenderer = new MapRenderer();

			terrainBitmap = new Bitmap(new BitmapData(1000, 1000, true, 0x00000000));

			mapRenderer.render(terrainMap, terrainBitmap, SIZE);

			addChild(terrainBitmap);
			addChild(hero);
			addChild(monster);

			stage.addEventListener(KeyboardEvent.KEY_DOWN, stage_keyDownHandler);
			stage.addEventListener(MouseEvent.CLICK, stage_clickHandler);

			generateTerrain();

			var start:INode = terrainMap.get(1,1) as INode;
			var end:INode = terrainMap.get(1, 2) as INode;
			findPath = Pathfinder.findPath(start, end, findConnectedNodes);
			if (findPath)
			{
				for (var i:int = 0; i < findPath.length; i++)
				{
					var node:INode = findPath[i];
					trace("Node: ", node.x, node.y);
				}

				tween();
			}
		}

		private var findPath:Array;
		private var currentTweenNode:int = 0;
		private var currentNode:INode;

		private function tween():void
		{
			currentNode = findPath[currentTweenNode];
			if(currentNode)
			{
				TweenMax.to(hero, .1, {x: currentNode.x * SIZE, y:currentNode.y * SIZE, onComplete:tween});
				currentTweenNode++;
			}
			else
			{
				currentNode = findPath[findPath.length - 1];
			}
		}

		public function findConnectedNodes(node:INode):Array
		{
			var connectedNodes:Array = [];
			var testNode:INode;
			
			var iterator:Itr = terrainMap.iterator();
			while(iterator.hasNext())
			{
				testNode = iterator.next() as INode;
				if (testNode.y < node.y - 1 || testNode.y > node.y + 1)
				{
					continue;
				}
				if (testNode.x < node.x - 1 || testNode.x > node.x + 1)
				{
					continue;
				}

				connectedNodes.push(testNode);
			}

			return connectedNodes;
		}

		private function generateTerrain():void
		{
//			var generateTerrainCommand:GenerateTerrainCommand = new GenerateTerrainCommand(terrainMap, defaultTile);
//			generateTerrainCommand.execute();

			var wallTile:Tile = new Wall(graphicFactory.getGraphic("0"));
			
//			terrainMap.populateTopRow(wallTile);
//			terrainMap.populateLeftColumn(wallTile);
//			terrainMap.populateRightColumn(wallTile);
//			terrainMap.populateBottomRow(wallTile);

			var tile:Tile = new Tile(graphicFactory.getGraphic("*"));
			terrainMap.generateRandomRoom(tile);

			mapRenderer.render(terrainMap, terrainBitmap, SIZE);
		}

		private function stage_keyDownHandler(event:KeyboardEvent):void
		{
			if (event.keyCode == Keyboard.UP || event.keyCode == Keyboard.DOWN || event.keyCode == Keyboard.LEFT || event.keyCode == Keyboard.RIGHT)
			{
				var moveHero:MoveHeroCommand = new MoveHeroCommand(hero, event.keyCode, characterMap, terrainMap);
				moveHero.execute();
			}
		}

		private function stage_clickHandler(event:MouseEvent):void
		{
			if(findPath) findPath.length = 0;
			TweenMax.killAll();
			var column:Number = Math.floor(event.stageX / SIZE);
			var row:Number = Math.floor(event.stageY / SIZE);
			var end:INode = terrainMap.get(column, row) as INode;
			findPath = Pathfinder.findPath(currentNode, end, findConnectedNodes);
			currentTweenNode = 0;
			if(findPath) tween();
		}
	}
}
