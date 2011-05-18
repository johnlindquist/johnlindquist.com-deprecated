/**
 * User: John Lindquist
 * Date: 5/18/11
 * Time: 12:04 PM
 */
package patterncraft.builder {
    public class MapBuilder {
        protected var map:Map;

        public function MapBuilder() {
        }

        public function init():void {
            map = new Map();
        }

        public function createBackground():void {
        }

        public function createTerrain():void {
        }

        public function createMinerals():void {
        }

        public function getMap():Map {
            return map;
        }

        public function createSky():void {
        }
    }
}
