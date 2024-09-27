if (!("finalizeConstruction" in ViewPU.prototype)) {
    Reflect.set(ViewPU.prototype, "finalizeConstruction", () => { });
}
interface Index_Params {
    componentName?;
    isJZPageShowConsume?: boolean;
}
import sysRouter from "@ohos:router";
import "@bundle:com.example.firsttest/entry/ets/pages/Home/HomePage";
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
        // d()
        // d2()
        // duplicationOfName()
        // duplicationOfName()
        //FTSLTool.haveFun();
        //let js = getInspectorByKey("onTap");
        //FIMXE: how about
        setTimeout(() => {
            // let url = `pages/Swiper/Swiper`
            // let url = `pages/Resource/Resource`
            // let url = `pages/Layout/Layout`
            // let url =  `pages/PopUpWindow/PopUpWindow`
            // let url = `pages/State/State`
            let url = `pages/Componment/Componment`;
            //let url = '@bundle:com.example.firsttest/FirstTestShareLibrary/ets/pages/ExportTestEntry'
            let params: Record<string, string> = { "a_param": "哈哈😂" };
            sysRouter.pushUrl({ url: url, params: params }, sysRouter.RouterMode.Standard, (err) => {
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
            Column.id("onTap");
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Button.createWithLabel("开始路由");
            Button.onClick(() => {
                // import('ets/pages/Home/HomePage');
                // 1
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
