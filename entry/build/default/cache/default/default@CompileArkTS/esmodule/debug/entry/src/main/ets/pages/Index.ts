if (!("finalizeConstruction" in ViewPU.prototype)) {
    Reflect.set(ViewPU.prototype, "finalizeConstruction", () => { });
}
interface Index_Params {
    componentName?;
    isJZPageShowConsume?: boolean;
}
import sysRouter from "@ohos:router";
import "@bundle:com.example.firsttest/entry/ets/pages/Home/HomePage";
import { duplicationOfName as d } from "@bundle:com.example.firsttest/FirstTestShareLibrary/Index";
import { duplicationOfName as d2 } from "@bundle:com.example.firsttest/entry@FirstTestStaticLibrary/Index";
class Index extends ViewPU {
    constructor(parent, params, __localStorage, elmtId = -1, paramsLambda = undefined, extraInfo) {
        super(parent, __localStorage, elmtId, extraInfo);
        if (typeof paramsLambda === "function") {
            this.paramsGenerator_ = paramsLambda;
        }
        this.componentName = "Index";
        this.__isJZPageShowConsume = new ObservedPropertySimplePU(false
        //Entry 生命周期
        , this, "isJZPageShowConsume");
        this.addProvidedVar("isJZPageShowConsume", this.__isJZPageShowConsume, false);
        this.setInitiallyProvidedValue(params);
        this.finalizeConstruction();
    }
    setInitiallyProvidedValue(params: Index_Params) {
        if (params.componentName !== undefined) {
            this.componentName = params.componentName;
        }
        if (params.isJZPageShowConsume !== undefined) {
            this.isJZPageShowConsume = params.isJZPageShowConsume;
        }
    }
    updateStateVars(params: Index_Params) {
    }
    purgeVariableDependenciesOnElmtId(rmElmtId) {
        this.__isJZPageShowConsume.purgeDependencyOnElmtId(rmElmtId);
    }
    aboutToBeDeleted() {
        this.__isJZPageShowConsume.aboutToBeDeleted();
        SubscriberManager.Get().delete(this.id__());
        this.aboutToBeDeletedInternal();
    }
    private componentName;
    private __isJZPageShowConsume: ObservedPropertySimplePU<boolean>;
    get isJZPageShowConsume() {
        return this.__isJZPageShowConsume.get();
    }
    set isJZPageShowConsume(newValue: boolean) {
        this.__isJZPageShowConsume.set(newValue);
    }
    //Entry 生命周期
    onPageShow(): void {
        console.log(`${this.componentName} - onPageShow`);
        this.dynamicImpart();
        d();
        d2();
        // duplicationOfName()
        // duplicationOfName()
        //FTSLTool.haveFun();
        //let js = getInspectorByKey("onTap");
        //FIMXE: how about
        setTimeout(() => {
            let url = `pages/Swiper/Swiper`;
            //let url = '@bundle:com.example.firsttest/FirstTestShareLibrary/ets/pages/ExportTestEntry'
            sysRouter.pushUrl({ url: url, params: null }, sysRouter.RouterMode.Standard, (err) => {
                if (err) {
                    console.error(`Invoke pushUrl failed, code is ${err.code}, message is ${err.message}`);
                    return;
                }
                console.info('Invoke pushUrl succeeded.');
            });
        }, 500);
    }
    onPageHide(): void {
        console.log(`${this.componentName} - onPageHide`);
    }
    //Component 生命周期
    aboutToAppear(): void {
        console.log(`${this.componentName} - aboutToAppear`);
    }
    aboutToDisappear(): void {
        console.log(`${this.componentName} - aboutToDisappear`);
    }
    // aboutToReuse(params: { [key: string]: Any }): void {
    // }
    aboutToRecycle(): void {
        console.log(`${this.componentName} - aboutToRecycle`);
    }
    initialRender() {
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create();
            Column.justifyContent(FlexAlign.Center);
            Column.alignItems(HorizontalAlign.Center);
            Column.width(`100%`);
            Column.height(`100%`);
            Column.key("onTap");
            Column.id("onTap");
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Button.createWithLabel("开始路由");
            Button.onClick(() => {
                // import('ets/pages/Home/HomePage');
                // 1
                //FIXME:  为什么会失效?
                sysRouter.pushNamedRoute({ name: 'HomePage', params: null }, sysRouter.RouterMode.Standard, (err) => {
                    if (err) {
                        console.error(`Invoke pushUrl failed, code is ${err.code}, message is ${err.message}`);
                        return;
                    }
                    console.info('Invoke pushUrl succeeded.');
                });
                // 2
                // //打开“entry > src > main > resources > base > profile”，在main_pages.json文件中的“src”下配置第二个页面的路由
                // sysRouter.pushUrl({ url: `pages/Home/HomePage`, params: null }, sysRouter.RouterMode.Standard, (err) => {
                //   if (err) {
                //     console.error(`Invoke pushUrl failed, code is ${err.code}, message is ${err.message}`);
                //     return;
                //   }
                //   console.info('Invoke pushUrl succeeded.');
                // });
                // RouterOptions
                // let name = RouterOptions({ url: "", param: null} });
                // var options = sysRouter.RouterOptions({ });
                // sysRouter.pushUrl()
            });
        }, Button);
        Button.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Button.createWithLabel("路由到Animation");
            Button.onClick(() => {
                sysRouter.pushUrl({ url: `pages/Animation/Animation`, params: null }, sysRouter.RouterMode.Standard, (err) => {
                    if (err) {
                        console.error(`Invoke pushUrl failed, code is ${err.code}, message is ${err.message}`);
                        return;
                    }
                    console.info('Invoke pushUrl succeeded.');
                });
            });
        }, Button);
        Button.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Button.createWithLabel("路由到Canvas");
            Button.onClick(() => {
                sysRouter.pushUrl({ url: `pages/Canvas/Canvas`, params: null }, sysRouter.RouterMode.Standard, (err) => {
                    if (err) {
                        console.error(`Invoke pushUrl failed, code is ${err.code}, message is ${err.message}`);
                        return;
                    }
                    console.info('Invoke pushUrl succeeded.');
                });
            });
        }, Button);
        Button.pop();
        Column.pop();
    }
    /// 异步方法
    async ccc() {
    }
    /// 动态import根据入参是常量还是变量，分成动态import常量表达式和动态import变量表达式两大特性规格
    /// 动态import
    dynamicImpart() {
        import("@bundle:com.example.firsttest/FirstTestShareLibrary/Index").then((ns: any) => {
            ns.Calc.staticAdd(8, 9); // 调用静态成员函数staticAdd()
            let calc: any = new ns.Calc(); // 实例化类Calc
            calc.instanceAdd(10, 11); // 调用成员函数instanceAdd()
            ns.addHarlibrary(6, 7); // 调用全局方法addHarlibrary()
            // 使用类、成员函数和方法的字符串名字进行反射调用
            let className = 'Calc';
            let methodName = 'instanceAdd';
            let staticMethod = 'staticAdd';
            let functionName = 'addHarlibrary';
            ns[className][staticMethod](12, 13); // 调用静态成员函数staticAdd()
            let calc1: any = new ns[className](); // 实例化类Calc
            calc1[methodName](14, 15); // 调用成员函数instanceAdd()
            ns[functionName](16, 17); // 调用全局方法addHarlibrary()
        });
    }
    rerender() {
        this.updateDirtyElements();
    }
    static getEntryName(): string {
        return "Index";
    }
}
export declare type NamedRouterOptions = sysRouter.NamedRouterOptions;
export declare type RouterOptions = sysRouter.RouterOptions;
export declare type RouterMode = sysRouter.RouterMode;
export declare type RouterState = sysRouter.RouterState;
export declare type EnableAlertOptions = sysRouter.EnableAlertOptions;
registerNamedRoute(() => new Index(undefined, {}), "", { bundleName: "com.example.firsttest", moduleName: "entry", pagePath: "pages/Index", pageFullPath: "entry/src/main/ets/pages/Index", integratedHsp: "false" });
