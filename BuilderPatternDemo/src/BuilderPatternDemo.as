package {

    import flash.display.Sprite;

    import patterncraft.builder.DesertBuilder;

    import patterncraft.builder.Director;
    import patterncraft.builder.GrasslandBuilder;
    import patterncraft.builder.Map;
    import patterncraft.builder.MapBuilder;

    public class BuilderPatternDemo extends Sprite {
        public function BuilderPatternDemo() {
            var director:Director = new Director();
            var grasslandBuilder:MapBuilder = new GrasslandBuilder();
            
            director.buildType1(grasslandBuilder)
            
            var map:Map = grasslandBuilder.getMap();

            var desertBuilder:MapBuilder = new DesertBuilder();
            director.buildType3(desertBuilder);
            
            var map2:Map = desertBuilder.getMap();
            
            trace(map.background, map.terrain, map.minerals);
            trace(map2.background, map2.terrain, map2.minerals, map2.sky);
        }
    }
}
