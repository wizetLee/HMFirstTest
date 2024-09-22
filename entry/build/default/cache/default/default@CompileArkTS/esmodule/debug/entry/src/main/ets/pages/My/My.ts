if (!("finalizeConstruction" in ViewPU.prototype)) {
    Reflect.set(ViewPU.prototype, "finalizeConstruction", () => { });
}
interface TestComponent_Params {
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
class TestComponent extends ViewPU {
    constructor(parent, params, __localStorage, elmtId = -1, paramsLambda = undefined, extraInfo) {
        super(parent, __localStorage, elmtId, extraInfo);
        if (typeof paramsLambda === "function") {
            this.paramsGenerator_ = paramsLambda;
        }
        this.setInitiallyProvidedValue(params);
        this.finalizeConstruction();
    }
    setInitiallyProvidedValue(params: TestComponent_Params) {
    }
    updateStateVars(params: TestComponent_Params) {
    }
    purgeVariableDependenciesOnElmtId(rmElmtId) {
    }
    aboutToBeDeleted() {
        SubscriberManager.Get().delete(this.id__());
        this.aboutToBeDeletedInternal();
    }
    initialRender() {
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create("TestComponent");
        }, Text);
        Text.pop();
    }
    //2024年 9月22日 星期日 15时05分11秒 CST 没测出来
    /// 挂载卸载事件指组件从组件树上挂载、卸载时触发的事件。
    /// 系统能力： SystemCapability.ArkUI.ArkUI.Full
    //
    // 回调的调用时机一定在组件布局渲染之前。
    // 不允许在回调中对组件树进行变更，例如启动动画，或是使用if-else变更组件树结构。
    onAttach(callback: Callback<void, void>): CommonAttribute {
        console.log("TestComponent onAttach");
        return this;
    }
    /// 组件挂载至组件树时触发此回调。
    onDetach(callback: Callback<void, void>): CommonAttribute {
        console.log("TestComponent onAttach");
        return this;
    }
    rerender() {
        this.updateDirtyElements();
    }
}
{
    let routeNameNode = "MyPage";
    registerNamedRoute(() => new MyPage(undefined, {}), routeNameNode, { bundleName: "com.example.firsttest", moduleName: "entry", pagePath: "pages/My/My", pageFullPath: "entry/src/main/ets/pages/My/My", integratedHsp: "false" });
}
