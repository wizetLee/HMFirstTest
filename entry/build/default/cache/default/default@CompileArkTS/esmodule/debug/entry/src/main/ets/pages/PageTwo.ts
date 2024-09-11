if (!("finalizeConstruction" in ViewPU.prototype)) {
    Reflect.set(ViewPU.prototype, "finalizeConstruction", () => { });
}
interface pageTwoTmp_Params {
    pageInfos?: NavPathStack;
}
export class pageTwoTmp extends ViewPU {
    constructor(parent, params, __localStorage, elmtId = -1, paramsLambda = undefined, extraInfo) {
        super(parent, __localStorage, elmtId, extraInfo);
        if (typeof paramsLambda === "function") {
            this.paramsGenerator_ = paramsLambda;
        }
        this.__pageInfos = this.initializeConsume('pageInfos', "pageInfos");
        this.setInitiallyProvidedValue(params);
        this.finalizeConstruction();
    }
    setInitiallyProvidedValue(params: pageTwoTmp_Params) {
    }
    updateStateVars(params: pageTwoTmp_Params) {
    }
    purgeVariableDependenciesOnElmtId(rmElmtId) {
        this.__pageInfos.purgeDependencyOnElmtId(rmElmtId);
    }
    aboutToBeDeleted() {
        this.__pageInfos.aboutToBeDeleted();
        SubscriberManager.Get().delete(this.id__());
        this.aboutToBeDeletedInternal();
    }
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
                    Text.create("NavDestinationContent2");
                }, Text);
                Text.pop();
                Column.pop();
            }, { moduleName: "entry", pagePath: "entry/src/main/ets/pages/PageTwo" });
            NavDestination.title("NavDestinationTitle2");
            NavDestination.onBackPressed(() => {
                const popDestinationInfo = this.pageInfos.pop(); // 弹出路由栈栈顶元素
                console.log('pop' + '返回值' + JSON.stringify(popDestinationInfo));
                return true;
            });
        }, NavDestination);
        NavDestination.pop();
    }
    rerender() {
        this.updateDirtyElements();
    }
}
