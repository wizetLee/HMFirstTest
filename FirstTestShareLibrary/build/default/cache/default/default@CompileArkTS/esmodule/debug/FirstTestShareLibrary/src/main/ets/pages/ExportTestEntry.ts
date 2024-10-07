if (!("finalizeConstruction" in ViewPU.prototype)) {
    Reflect.set(ViewPU.prototype, "finalizeConstruction", () => { });
}
interface ExportTestEntry_Params {
}
class ExportTestEntry extends ViewPU {
    constructor(parent, params, __localStorage, elmtId = -1, paramsLambda = undefined, extraInfo) {
        super(parent, __localStorage, elmtId, extraInfo);
        if (typeof paramsLambda === "function") {
            this.paramsGenerator_ = paramsLambda;
        }
        this.setInitiallyProvidedValue(params);
        this.finalizeConstruction();
    }
    setInitiallyProvidedValue(params: ExportTestEntry_Params) {
    }
    updateStateVars(params: ExportTestEntry_Params) {
    }
    purgeVariableDependenciesOnElmtId(rmElmtId) {
    }
    aboutToBeDeleted() {
        SubscriberManager.Get().delete(this.id__());
        this.aboutToBeDeletedInternal();
    }
    initialRender() {
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create();
            Column.width(`100%`);
            Column.height(`100%`);
            Column.backgroundColor(Color.Orange);
        }, Column);
        Column.pop();
    }
    rerender() {
        this.updateDirtyElements();
    }
    static getEntryName(): string {
        return "ExportTestEntry";
    }
}
{
    let routeNameNode = "ExportTestEntry";
    registerNamedRoute(() => new ExportTestEntry(undefined, {}), routeNameNode, { bundleName: "com.example.firsttest", moduleName: "FirstTestShareLibrary", pagePath: "pages/ExportTestEntry", pageFullPath: "FirstTestShareLibrary/src/main/ets/pages/ExportTestEntry", integratedHsp: "false" });
}
