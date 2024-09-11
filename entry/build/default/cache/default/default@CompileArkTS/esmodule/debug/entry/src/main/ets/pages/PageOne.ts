if (!("finalizeConstruction" in ViewPU.prototype)) {
    Reflect.set(ViewPU.prototype, "finalizeConstruction", () => { });
}
interface pageOneTmp_Params {
    pageInfos?: NavPathStack;
}
export class pageOneTmp extends ViewPU {
    constructor(parent, params, __localStorage, elmtId = -1, paramsLambda = undefined, extraInfo) {
        super(parent, __localStorage, elmtId, extraInfo);
        if (typeof paramsLambda === "function") {
            this.paramsGenerator_ = paramsLambda;
        }
        this.__pageInfos = this.initializeConsume('pageInfos', "pageInfos");
        this.setInitiallyProvidedValue(params);
        this.finalizeConstruction();
    }
    setInitiallyProvidedValue(params: pageOneTmp_Params) {
    }
    updateStateVars(params: pageOneTmp_Params) {
    }
    purgeVariableDependenciesOnElmtId(rmElmtId) {
        this.__pageInfos.purgeDependencyOnElmtId(rmElmtId);
    }
    aboutToBeDeleted() {
        this.__pageInfos.aboutToBeDeleted();
        SubscriberManager.Get().delete(this.id__());
        this.aboutToBeDeletedInternal();
    }
    onPageShow(): void {
        console.info("pageOneTmp onPageShow");
    }
    onPageHide(): void {
        let pageInfo: RouterPageInfo | undefined = this.queryRouterPageInfo();
        console.info("pageOneTmp onPageHide");
    }
    // onPageHide(): void {
    //   let ie: emitter.InnerEvent = { eventId: 1};
    //   let innerEvent: emitter.InnerEvent = ie
    //   // 选中态：黑变红
    //   emitter.on(innerEvent, data => {
    //     let _data: emitter.EventData = data;
    //   // 监听变换
    //     let _data_data = _data.data;
    //     if (_data_data) {
    //       console.log(_data_data["colorTag"])
    //     }
    //   })
    //
    //
    //   // 事件发射
    //   let eventData: emitter.EventData = {
    //     data: {
    //       "colorTag": 0
    //     }
    //   }
    //   emitter.emit(innerEvent, eventData)
    //
    //
    //   {
    //     // Environment是ArkUI框架在应用程序启动时创建的单例对象。它为AppStorage提供了一系列描述应用程序运行状态的属性。
    //     // 设备环境到Component的更新链：Environment --> AppStorage -->Component。
    //     let keys = Environment.keys();
    //     Environment.envProp('languageCode', 'en');
    //
    //   }
    // }
    private __pageInfos: ObservedPropertyAbstractPU<NavPathStack>;
    get pageInfos() {
        return this.__pageInfos.get();
    }
    set pageInfos(newValue: NavPathStack) {
        this.__pageInfos.set(newValue);
    }
    initialRender() {
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            NavDestination.create(() => {
                this.observeComponentCreation2((elmtId, isInitialRender) => {
                    Column.create();
                    Column.width('100%');
                    Column.height('100%');
                }, Column);
                this.observeComponentCreation2((elmtId, isInitialRender) => {
                    Text.create("NavDestinationContent1");
                }, Text);
                Text.pop();
                Column.pop();
            }, { moduleName: "entry", pagePath: "entry/src/main/ets/pages/PageOne" });
            NavDestination.title("NavDestinationTitle1");
            NavDestination.onBackPressed(() => {
                const popDestinationInfo = this.pageInfos.pop(); // 弹出路由栈栈顶元素
                console.log('pop' + '返回值' + JSON.stringify(popDestinationInfo));
                return true;
            });
            NavDestination.onReady((context: NavDestinationContext) => {
                let navPathStack = context.pathStack;
                console.log("navPathStack");
                //this.pathStack = context.pathStack
            });
        }, NavDestination);
        NavDestination.pop();
    }
    rerender() {
        this.updateDirtyElements();
    }
    static getEntryName(): string {
        return "pageOneTmp";
    }
}
registerNamedRoute(() => new pageOneTmp(undefined, {}), "", { bundleName: "com.example.firsttest", moduleName: "entry", pagePath: "pages/PageOne", pageFullPath: "entry/src/main/ets/pages/PageOne", integratedHsp: "false" });
