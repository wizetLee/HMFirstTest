if (!("finalizeConstruction" in ViewPU.prototype)) {
    Reflect.set(ViewPU.prototype, "finalizeConstruction", () => { });
}
interface CanvasPage_Params {
    componentName?;
    settings?: RenderingContextSettings;
    model?: DataHistogramModel;
    linePointModel?;
}
import { DataHistogramElement, DataHistogramModel } from "@bundle:com.example.firsttest/entry/ets/pages/Canvas/DataHistogram";
import { LinePaintModel } from "@bundle:com.example.firsttest/entry/ets/pages/Canvas/LinePaintModel";
class CanvasPage extends ViewPU {
    constructor(parent, params, __localStorage, elmtId = -1, paramsLambda = undefined, extraInfo) {
        super(parent, __localStorage, elmtId, extraInfo);
        if (typeof paramsLambda === "function") {
            this.paramsGenerator_ = paramsLambda;
        }
        this.componentName = "CanvasPage";
        this.settings = new RenderingContextSettings(true) // 抗锯齿启动！，还可以自定义像素单位，但最好别乱整
        ;
        this.__model = new ObservedPropertyObjectPU(DataHistogramModel.defaultModel(), this, "model");
        this.linePointModel = new LinePaintModel();
        this.setInitiallyProvidedValue(params);
        this.finalizeConstruction();
    }
    setInitiallyProvidedValue(params: CanvasPage_Params) {
        if (params.componentName !== undefined) {
            this.componentName = params.componentName;
        }
        if (params.settings !== undefined) {
            this.settings = params.settings;
        }
        if (params.model !== undefined) {
            this.model = params.model;
        }
        if (params.linePointModel !== undefined) {
            this.linePointModel = params.linePointModel;
        }
    }
    updateStateVars(params: CanvasPage_Params) {
    }
    purgeVariableDependenciesOnElmtId(rmElmtId) {
        this.__model.purgeDependencyOnElmtId(rmElmtId);
    }
    aboutToBeDeleted() {
        this.__model.aboutToBeDeleted();
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
    private settings: RenderingContextSettings; // 抗锯齿启动！，还可以自定义像素单位，但最好别乱整
    // private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)
    // 用于矩阵变化
    // private img: ImageBitmap = new ImageBitmap("resources/base/media/background.png")
    // private matrix: Matrix2D = new Matrix2D()
    // private pattern: CanvasPattern | null = null
    // private offContext: OffscreenCanvasRenderingContext2D = new OffscreenCanvasRenderingContext2D(600, 600, this.settings)
    private __model: ObservedPropertyObjectPU<DataHistogramModel>;
    get model() {
        return this.__model.get();
    }
    set model(newValue: DataHistogramModel) {
        this.__model.set(newValue);
    }
    private linePointModel;
    initialRender() {
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create({});
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Blank.create();
            Blank.height(55);
        }, Blank);
        Blank.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Button.createWithLabel("数据变换");
            Button.onClick(() => {
                this.valueDidChange();
            });
        }, Button);
        Button.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Canvas.create(this.model.context);
            Canvas.width('100%');
            Canvas.height('40%');
            Canvas.onReady(() => {
                this.model.draw();
            });
            Canvas.backgroundColor(Color.Orange);
        }, Canvas);
        Canvas.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Canvas.create(this.linePointModel.context);
            Canvas.width('100%');
            Canvas.height('40%');
            Canvas.onReady(() => {
                this.linePointModel.draw();
            });
            Canvas.backgroundColor(Color.Grey);
        }, Canvas);
        Canvas.pop();
        Column.pop();
    }
    valueDidChange() {
        {
            let model = this.model;
            model.columnar = [
                new DataHistogramElement(Color.Green, "17", Math.random()),
                new DataHistogramElement(Color.Green, "28", Math.random()),
                new DataHistogramElement(Color.Green, "122", Math.random()),
                new DataHistogramElement(Color.Green, "875", Math.random()),
                new DataHistogramElement(Color.Green, "2878", Math.random()),
                new DataHistogramElement(Color.Gray, "207", Math.random()),
                new DataHistogramElement(Color.Red, "955", Math.random()),
                new DataHistogramElement(Color.Red, "166", Math.random()),
                new DataHistogramElement(Color.Red, "50", Math.random()),
                new DataHistogramElement(Color.Red, "23", Math.random()),
                new DataHistogramElement(Color.Red, "43", Math.random()), //43),
            ];
            model.columnarTopDesc = model.columnar;
            model.columnarBottomDesc = [
                new DataHistogramElement(Color.Green, "10-8", Math.random()),
                new DataHistogramElement(Color.Gray, "8-6", Math.random()),
                new DataHistogramElement(Color.Gray, "6-4", Math.random()),
                new DataHistogramElement(Color.Gray, "4-2", Math.random()),
                new DataHistogramElement(Color.Gray, "2-0", Math.random()),
                new DataHistogramElement(Color.Gray, "平", Math.random()),
                new DataHistogramElement(Color.Gray, "0-2", Math.random()),
                new DataHistogramElement(Color.Gray, "2-4", Math.random()),
                new DataHistogramElement(Color.Gray, "4-6", Math.random()),
                new DataHistogramElement(Color.Gray, "6-8", Math.random()),
                new DataHistogramElement(Color.Red, "8-10", Math.random()), //43),
            ];
            model.scale = [
                new DataHistogramElement(Color.Green, "跌123家", Math.random()),
                new DataHistogramElement(Color.Gray, "平555家", Math.random()),
                new DataHistogramElement(Color.Red, "涨4321家", Math.random()), //1),
            ];
            model.scaleDesc = model.scale;
            // this.model = model;
            model.draw();
        }
        {
            this.linePointModel.displayDataCount = 240;
            this.linePointModel.data = [];
            let i = 0;
            let limit = 240;
            for (; i < limit; i++) {
                this.linePointModel.data.push(Math.random());
            }
            this.linePointModel.padding = { left: 10, right: 10, top: 20, bottom: 20 };
            this.linePointModel.draw();
        }
    }
    rerender() {
        this.updateDirtyElements();
    }
    static getEntryName(): string {
        return "CanvasPage";
    }
}
{
    let routeNameNode = "Canvas";
    registerNamedRoute(() => new CanvasPage(undefined, {}), routeNameNode, { bundleName: "com.example.firsttest", moduleName: "entry", pagePath: "pages/Canvas/Canvas", pageFullPath: "entry/src/main/ets/pages/Canvas/Canvas", integratedHsp: "false" });
}
