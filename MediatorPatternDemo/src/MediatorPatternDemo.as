package
{
    import flash.display.Sprite;

    import johnlindquist.FormContext;

    public class MediatorPatternDemo extends Sprite
    {
        protected var formContext:FormContext;

        public function MediatorPatternDemo()
        {
            formContext = new FormContext();
            formContext.contextView = this;            
        }
    }
}
