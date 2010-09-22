package
{
    public function $(type:Class = null, instance:Object = null):IMoney
    {
        Money.currentType = type;
        Money.currentInstance = instance;
        return Money.getInstance();
    }
}

import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.utils.Dictionary;

//TODO: discuss benefits of ICommand and IMediator for run() and mediate()
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
        var instance:* = newInstance(currentType, rest);
        if (instance.hasOwnProperty("execute"))
        {
            instance.execute();
            var watchers:Array = watchMap[currentType];
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
        if(watchMap[currentType] == null)
        {
            watchMap[currentType] = [new Watcher(callback, rest)];
        }
        else
        {
            var watchers:Array = watchMap[currentType];
            watchers.push(new Watcher(callback, rest));
        }
    }

    public function mediate(mediator:Class):DisplayObjectContainer
    {
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
    trace(instance, " mapped to ", type);
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

function newInstance(clazz:Class, args:Array = null):*
{
    var result:*;
    var a:Array = (args == null) ? [] : args;

    switch (a.length)
    {
        case 1:
            result = new clazz(a[0]);
            break;
        case 2:
            result = new clazz(a[0], a[1]);
            break;
        case 3:
            result = new clazz(a[0], a[1], a[2]);
            break;
        case 4:
            result = new clazz(a[0], a[1], a[2], a[3]);
            break;
        case 5:
            result = new clazz(a[0], a[1], a[2], a[3], a[4]);
            break;
        case 6:
            result = new clazz(a[0], a[1], a[2], a[3], a[4], a[5]);
            break;
        case 7:
            result = new clazz(a[0], a[1], a[2], a[3], a[4], a[5], a[6]);
            break;
        case 8:
            result = new clazz(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7]);
            break;
        case 9:
            result = new clazz(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8]);
            break;
        case 10:
            result = new clazz(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9]);
            break;
        default:
            result = new clazz();
    }

    return result;
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