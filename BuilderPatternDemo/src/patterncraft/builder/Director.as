/**
 * User: John Lindquist
 * Date: 5/18/11
 * Time: 12:01 PM
 */
package patterncraft.builder {
    public class Director {
        public function Director() {
        }

        public function buildType1(builder:MapBuilder):void {
            builder.init()
            builder.createBackground()
            builder.createTerrain()
            builder.createTerrain()
            builder.createTerrain()
            builder.createMinerals()
        }

        public function buildType2(builder:MapBuilder):void {
            builder.init();
            builder.createTerrain();
            builder.createMinerals();
        }

        public function buildType3(builder:MapBuilder):void {
            builder.init()
            builder.createBackground()
            builder.createTerrain()
            builder.createMinerals()
            builder.createSky()
        }
    }
}
