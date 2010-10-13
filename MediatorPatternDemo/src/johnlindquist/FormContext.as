package johnlindquist
{
    import org.robotlegs.mvcs.Context

    public class FormContext extends Context
    {
        protected var submitButton:SubmitButton;

        protected var clearButton:ClearButton;

        protected var inputText:InputTextField;

        
        
        override public function startup():void
        {
            mediatorMap.mapView(InputTextField, InputTextFieldMediator);
            mediatorMap.mapView(ClearButton, ClearButtonMediator);
            mediatorMap.mapView(SubmitButton, SubmitButtonMediator);
            
            
            inputText = new InputTextField();
            clearButton = new ClearButton();
            submitButton = new SubmitButton();

            inputText.width = 225;
            
            clearButton.y = 125;
            
            submitButton.x = 125;
            submitButton.y = 125;
            
            contextView.addChild(submitButton);
            contextView.addChild(clearButton);
            contextView.addChild(inputText);
            
            super.startup();
        }
    }
}