package {

    import flash.display.Sprite;

    import patterncraft.strategy.BarStrategy;

    import patterncraft.strategy.Container;
    import patterncraft.strategy.FooStrategy;
    import patterncraft.strategy.IStrategy;

    public class Main extends Sprite {
        public function Main() {
            var container:Container = new Container();
            
            var strategy:IStrategy = new FooStrategy(container);
            container.engageBehavior = strategy;
            container.engage();
            
            container.engageBehavior = new BarStrategy(container)
            container.engage();
        }
    }
}
