if (!("finalizeConstruction" in ViewPU.prototype)) {
    Reflect.set(ViewPU.prototype, "finalizeConstruction", () => { });
}
interface MyPage_Params {
    componentName?;
}
class MyPage extends ViewPU {
    constructor(parent, params, __localStorage, elmtId = -1, paramsLambda = undefined, extraInfo) {
        super(parent, __localStorage, elmtId, extraInfo);
        if (typeof paramsLambda === "function") {
            this.paramsGenerator_ = paramsLambda;
        }
        this.componentName = "MyPage";
        this.setInitiallyProvidedValue(params);
        this.finalizeConstruction();
    }
    setInitiallyProvidedValue(params: MyPage_Params) {
        if (params.componentName !== undefined) {
            this.componentName = params.componentName;
        }
    }
    updateStateVars(params: MyPage_Params) {
    }
    purgeVariableDependenciesOnElmtId(rmElmtId) {
    }
    aboutToBeDeleted() {
        SubscriberManager.Get().delete(this.id__());
        this.aboutToBeDeletedInternal();
    }
    private componentName;
    //Entry 生命周期
    onPageShow(): void {
        console.log(`${this.componentName} - onPageShow`);
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
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create("这是我");
        }, Text);
        Text.pop();
        Column.pop();
    }
    rerender() {
        this.updateDirtyElements();
    }
    static getEntryName(): string {
        return "MyPage";
    }
}
{
    let routeNameNode = "MyPage";
    registerNamedRoute(() => new MyPage(undefined, {}), routeNameNode, { bundleName: "com.example.firsttest", moduleName: "entry", pagePath: "pages/My/My", pageFullPath: "entry/src/main/ets/pages/My/My", integratedHsp: "false" });
}
