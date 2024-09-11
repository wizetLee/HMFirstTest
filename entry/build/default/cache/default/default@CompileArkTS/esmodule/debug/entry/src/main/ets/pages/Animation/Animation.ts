if (!("finalizeConstruction" in ViewPU.prototype)) {
    Reflect.set(ViewPU.prototype, "finalizeConstruction", () => { });
}
interface Animation_Params {
    componentName?;
    isAnimation?: boolean;
    translateX1?: number;
    translateX2?: number;
    translateX3?: number;
}
class Animation extends ViewPU {
    constructor(parent, params, __localStorage, elmtId = -1, paramsLambda = undefined, extraInfo) {
        super(parent, __localStorage, elmtId, extraInfo);
        if (typeof paramsLambda === "function") {
            this.paramsGenerator_ = paramsLambda;
        }
        this.componentName = "Animation";
        this.__isAnimation = new ObservedPropertySimplePU(false, this, "isAnimation");
        this.__translateX1 = new ObservedPropertySimplePU(-100, this, "translateX1");
        this.__translateX2 = new ObservedPropertySimplePU(-100, this, "translateX2");
        this.__translateX3 = new ObservedPropertySimplePU(-100, this, "translateX3");
        this.setInitiallyProvidedValue(params);
        this.finalizeConstruction();
    }
    setInitiallyProvidedValue(params: Animation_Params) {
        if (params.componentName !== undefined) {
            this.componentName = params.componentName;
        }
        if (params.isAnimation !== undefined) {
            this.isAnimation = params.isAnimation;
        }
        if (params.translateX1 !== undefined) {
            this.translateX1 = params.translateX1;
        }
        if (params.translateX2 !== undefined) {
            this.translateX2 = params.translateX2;
        }
        if (params.translateX3 !== undefined) {
            this.translateX3 = params.translateX3;
        }
    }
    updateStateVars(params: Animation_Params) {
    }
    purgeVariableDependenciesOnElmtId(rmElmtId) {
        this.__isAnimation.purgeDependencyOnElmtId(rmElmtId);
        this.__translateX1.purgeDependencyOnElmtId(rmElmtId);
        this.__translateX2.purgeDependencyOnElmtId(rmElmtId);
        this.__translateX3.purgeDependencyOnElmtId(rmElmtId);
    }
    aboutToBeDeleted() {
        this.__isAnimation.aboutToBeDeleted();
        this.__translateX1.aboutToBeDeleted();
        this.__translateX2.aboutToBeDeleted();
        this.__translateX3.aboutToBeDeleted();
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
    private __isAnimation: ObservedPropertySimplePU<boolean>;
    get isAnimation() {
        return this.__isAnimation.get();
    }
    set isAnimation(newValue: boolean) {
        this.__isAnimation.set(newValue);
    }
    private __translateX1: ObservedPropertySimplePU<number>;
    get translateX1() {
        return this.__translateX1.get();
    }
    set translateX1(newValue: number) {
        this.__translateX1.set(newValue);
    }
    private __translateX2: ObservedPropertySimplePU<number>;
    get translateX2() {
        return this.__translateX2.get();
    }
    set translateX2(newValue: number) {
        this.__translateX2.set(newValue);
    }
    private __translateX3: ObservedPropertySimplePU<number>;
    get translateX3() {
        return this.__translateX3.get();
    }
    set translateX3(newValue: number) {
        this.__translateX3.set(newValue);
    }
    initialRender() {
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create();
            Column.width('100%');
            Column.justifyContent(FlexAlign.Center);
            Column.shadow(ShadowStyle.OUTER_DEFAULT_SM);
            Column.layoutWeight(1);
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            // 设置动画部分 ---
            Row.create();
            // 设置动画部分 ---
            Row.height('20%');
        }, Row);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create('30');
            Text.fontWeight(FontWeight.Bold);
            Text.fontSize(16);
            Text.fontColor(Color.White);
            Text.textAlign(TextAlign.Center);
            Text.borderRadius(10);
            Text.backgroundColor(0xF56C6C);
            Text.width(80);
            Text.height(80);
            Text.translate({ x: this.translateX1 });
        }, Text);
        Text.pop();
        // 设置动画部分 ---
        Row.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Row.create();
            Row.height('20%');
        }, Row);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create('60');
            Context.animation({
                duration: 3000,
                iterations: 1,
                playMode: PlayMode.Normal,
                // expectedFrameRateRange: {
                //   // 设置属性动画的帧率范围
                //   expected: 60, // 设置动画的期望帧率为60hz
                //   min: 0, // 设置帧率范围
                //   max: 120, // 设置帧率范围
                // },
            });
            Text.fontWeight(FontWeight.Bold);
            Text.fontSize(16);
            Text.fontColor(Color.White);
            Text.textAlign(TextAlign.Center);
            Text.borderRadius(10);
            Text.backgroundColor(0x008B8B);
            Text.width(80);
            Text.height(80);
            Text.translate({ x: this.translateX3 });
            Context.animation(null);
        }, Text);
        Text.pop();
        Row.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Row.create();
            Row.width('100%');
            Row.justifyContent(FlexAlign.Center);
            Row.shadow(ShadowStyle.OUTER_DEFAULT_SM);
            Row.alignItems(VerticalAlign.Bottom);
            Row.layoutWeight(1);
        }, Row);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Button.createWithLabel('Start');
            Button.id('PropertyAnimationStart');
            Button.fontSize(14);
            Button.fontWeight(500);
            Button.margin({ bottom: 10, left: 5 });
            Button.fontColor(Color.White);
            Button.onClick(() => {
                this.isAnimation = !this.isAnimation;
                this.translateX3 = this.isAnimation ? 100 : -100;
                Context.animateTo({
                    duration: 3000,
                    iterations: 1,
                    playMode: PlayMode.Normal,
                    expectedFrameRateRange: {
                        // 设置显式动画的帧率范围
                        expected: 30,
                        min: 0,
                        max: 120, // 设置帧率范围
                    },
                }, () => {
                    this.translateX1 = this.isAnimation ? 100 : -100;
                });
            });
            Button.width('40%');
            Button.height(40);
            Button.shadow(ShadowStyle.OUTER_DEFAULT_LG);
        }, Button);
        Button.pop();
        Row.pop();
        Column.pop();
    }
    rerender() {
        this.updateDirtyElements();
    }
    static getEntryName(): string {
        return "Animation";
    }
}
{
    let routeNameNode = "Animation";
    registerNamedRoute(() => new Animation(undefined, {}), routeNameNode, { bundleName: "com.example.firsttest", moduleName: "entry", pagePath: "pages/Animation/Animation", pageFullPath: "entry/src/main/ets/pages/Animation/Animation", integratedHsp: "false" });
}
