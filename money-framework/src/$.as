package
{
    public function $(type:Class = null, instance:Object = null):IMoney
    {
        Money.currentType = type;
        Money.currentInstance = instance;
        return Money.getInstance();
    }
}

import flash.display.DisplayObjectContainer;
import flash.utils.Dictionary;

class Money implements IMoney
{
    static var instance:Money;

    static var currentType:Class;
    static var currentInstance:Object;
    static var currentRest:Array;

    static function getInstance():Money
    {
        return instance ||= new Money();
    }

    //TODO: implement ids
    public function get(id:String = null):*
    {
        if (currentType)
        {
            return getValue(currentType);
        }

        return {};
    }

    //TODO: implement ids
    public function set(id:String = null, ...rest):void
    {
        if (currentInstance && currentType)
        {
            putValue(currentInstance, currentType);
        }
        else if (currentType)
        {
            putValue(newInstance(currentType, rest), currentType);
        }

    }

    public function run(...rest):void
    {
        var watchers:Array = watchMap[currentType];
        var instance:* = newInstance(currentType, rest);
        //TODO: consider ICommand
        if (instance.hasOwnProperty("execute"))
        {
            instance.execute();
            if(watchers)
            {
                for each (var watcher:Watcher in watchers)
                {
                    watcher.callback.apply(watcher.rest);                
                }
            }
        }
    }

    public function remove():void
    {
        deleteValue(currentType);        
    }

    public function watch(callback:Function, ...rest):void
    {
        //TODO: implement unwatch
        var watchers:Array = watchMap[currentType];
        if(watchers == null)
        {
            watchMap[currentType] = [new Watcher(callback, rest)];
        }
        else
        {
            watchers.push(new Watcher(callback, rest));
        }
    }

    public function mediate(mediator:Class):DisplayObjectContainer
    {
        //TODO: consider IMediator and waiting for ADDED_TO_STAGE
        var view:DisplayObjectContainer = new currentType;
        new mediator(view);
        
        return view;
    }
}

var valueMap:Dictionary = new Dictionary();
var watchMap:Dictionary = new Dictionary();

function putValue(instance:*, type:Class):void
{
    valueMap[type] = instance;
}

function getValue(type:Class)
{
    if (!valueMap[type])
    {
        putValue(new type(), type);
    }
    return valueMap[type];
}

function deleteValue(type:Class)
{
    valueMap[type] = null;
}

function newInstance(type:Class, args:Array = null):*
{
    var instance:*;
    var a:Array = (args == null) ? [] : args;

    switch (a.length)
    {
        case 1:
            instance = new type(a[0]);
            break;
        case 2:
            instance = new type(a[0], a[1]);
            break;
        case 3:
            instance = new type(a[0], a[1], a[2]);
            break;
        case 4:
            instance = new type(a[0], a[1], a[2], a[3]);
            break;
        case 5:
            instance = new type(a[0], a[1], a[2], a[3], a[4]);
            break;
        case 6:
            instance = new type(a[0], a[1], a[2], a[3], a[4], a[5]);
            break;
        case 7:
            instance = new type(a[0], a[1], a[2], a[3], a[4], a[5], a[6]);
            break;
        case 8:
            instance = new type(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7]);
            break;
        case 9:
            instance = new type(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8]);
            break;
        case 10:
            instance = new type(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9]);
            break;
        default:
            instance = new type();
    }

    return instance;
}

class Watcher
{
    var callback:Function;
    var rest:Array;

    public function Watcher(callback:Function, rest:Array)
    {
        this.callback = callback;
        this.rest = rest;
    }
}