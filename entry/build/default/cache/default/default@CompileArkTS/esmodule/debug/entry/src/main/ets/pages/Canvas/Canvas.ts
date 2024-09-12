if (!("finalizeConstruction" in ViewPU.prototype)) {
    Reflect.set(ViewPU.prototype, "finalizeConstruction", () => { });
}
interface CanvasPage_Params {
    settings?: RenderingContextSettings;
    context?: CanvasRenderingContext2D;
    img?: ImageBitmap;
    matrix?: Matrix2D;
    pattern?: CanvasPattern | null;
    offContext?: OffscreenCanvasRenderingContext2D;
}
class CanvasPage extends ViewPU {
    constructor(parent, params, __localStorage, elmtId = -1, paramsLambda = undefined, extraInfo) {
        super(parent, __localStorage, elmtId, extraInfo);
        if (typeof paramsLambda === "function") {
            this.paramsGenerator_ = paramsLambda;
        }
        this.settings = new RenderingContextSettings(true) // 抗锯齿启动！，还可以自定义像素单位，但最好别乱整
        ;
        this.context = new CanvasRenderingContext2D(this.settings);
        this.img = new ImageBitmap("resources/base/media/background.png");
        this.matrix = new Matrix2D();
        this.pattern = null;
        this.offContext = new OffscreenCanvasRenderingContext2D(600, 600, this.settings);
        this.setInitiallyProvidedValue(params);
        this.finalizeConstruction();
    }
    setInitiallyProvidedValue(params: CanvasPage_Params) {
        if (params.settings !== undefined) {
            this.settings = params.settings;
        }
        if (params.context !== undefined) {
            this.context = params.context;
        }
        if (params.img !== undefined) {
            this.img = params.img;
        }
        if (params.matrix !== undefined) {
            this.matrix = params.matrix;
        }
        if (params.pattern !== undefined) {
            this.pattern = params.pattern;
        }
        if (params.offContext !== undefined) {
            this.offContext = params.offContext;
        }
    }
    updateStateVars(params: CanvasPage_Params) {
    }
    purgeVariableDependenciesOnElmtId(rmElmtId) {
    }
    aboutToBeDeleted() {
        SubscriberManager.Get().delete(this.id__());
        this.aboutToBeDeletedInternal();
    }
    private settings: RenderingContextSettings; // 抗锯齿启动！，还可以自定义像素单位，但最好别乱整
    private context: CanvasRenderingContext2D;
    // 用于矩阵变化
    private img: ImageBitmap;
    private matrix: Matrix2D;
    private pattern: CanvasPattern | null;
    private offContext: OffscreenCanvasRenderingContext2D;
    //
    initialRender() {
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Flex.create({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center });
            Flex.width('100%');
            Flex.height('100%');
        }, Flex);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            // 图片是获取成功的
            // Image('resources/base/media/background.png')
            //   .width(200)
            Canvas.create(this.context);
            // 图片是获取成功的
            // Image('resources/base/media/background.png')
            //   .width(200)
            Canvas.width('100%');
            // 图片是获取成功的
            // Image('resources/base/media/background.png')
            //   .width(200)
            Canvas.height('100%');
            // 图片是获取成功的
            // Image('resources/base/media/background.png')
            //   .width(200)
            Canvas.backgroundColor('#ffff00');
            // 图片是获取成功的
            // Image('resources/base/media/background.png')
            //   .width(200)
            Canvas.onReady(() => {
                // 获取画布的尺寸
                // console.log(`画布尺寸 : ${this.context.width} ${this.context.height}`)
                // {
                //   // 线性渐变
                //   let grad: CanvasGradient =
                //     this.context.createLinearGradient(this.context.width / 4, this.context.width / 4, this.context.width / 2,
                //       this.context.width / 2)
                //this.context.createRadialGradient()
                //this.context.createConicGradient()
                //   grad.addColorStop(0.0, '#ff0000')
                //   grad.addColorStop(0.5, '#ffffff')
                //   grad.addColorStop(1.0, '#00ff00')
                //   this.context.fillStyle = grad
                //   this.context.fillRect(0, 0, this.context.width / 2, this.context.width / 2)
                //
                //
                //   // this.context.fillStyle = oldFillStyle
                //   // this.context.fillRect(0, 30, 100, 100)
                //
                //   this.context.fillRect(240, 0, 100, 100);
                // }
                // { // 矩阵变化
                //   this.pattern = this.context.createPattern(this.img, 'no-repeat')
                //   this.matrix.scaleY = 0.5
                //   this.matrix.scaleX = 0.5
                //   this.matrix.translateX = 50
                //   this.matrix.translateY = 50
                //   if (this.pattern) {
                //     this.context.fillStyle = this.pattern
                //     this.pattern.setTransform(this.matrix)
                //   }
                //   this.context.fillRect(0, 0, 480, 720)
                // }
                // { // 圆圈
                //   this.context.lineWidth = 8
                //   this.context.arc(this.context.width / 2, this.context.height / 2, 30, 0, 3.14 * 2)
                //   this.context.setLineDash([10, 20])
                //   this.context.lineDashOffset = 10.0
                //   this.context.shadowBlur = 15
                //   this.context.shadowColor = 'rgb(0,0,0)'
                //   this.context.stroke()
                // }
                { // lineCap lineMiter
                    this.context.beginPath();
                    this.context.shadowBlur = 0;
                    this.context.shadowColor = 'rgba(0,0,0,0)';
                    this.context.setLineDash([20, 3]);
                    this.context.lineDashOffset = 0;
                    this.context.lineWidth = 3;
                    this.context.arc(this.context.width / 2, this.context.height / 2, 30, 0, Math.PI * 2);
                    this.context.stroke();
                    this.context.beginPath();
                    this.context.shadowBlur = 0;
                    this.context.shadowColor = 'rgb(0,255,0)';
                    this.context.setLineDash([20, 3]);
                    this.context.lineDashOffset = 0; // 设置画布的虚线偏移量
                    this.context.lineWidth = 3;
                    this.context.strokeStyle = `rgba(1, 1, 255, 1)`;
                    this.context.arc(this.context.width / 2 + 70, this.context.height / 2, 30, 0, Math.PI * 2);
                    this.context.stroke();
                    this.context.beginPath();
                    this.context.lineWidth = 6;
                    this.context.lineJoin = 'miter';
                    this.context.miterLimit = 10;
                    this.context.moveTo(30, 130);
                    this.context.lineTo(120, 260);
                    this.context.lineTo(30, 210);
                    // this.context.strokeStyle = `rgba(1, 1, 255, 1)`;
                    // this.context.closePath() // 形成一个封闭路径 会补全path
                    this.context.stroke();
                }
                { // 叠加层级的设置
                    // this.context.globalCompositeOperation = 'source-over'
                }
                // {
                //   this.context.fillStyle // 颜色 图案 渐变色
                // }
                // {  //写字， 关于！的奇葩变动
                //   let ctx = this.context
                //   ctx.font = '48px serif';
                //   ctx.textAlign = 'start'
                //   ctx.fillText("你好!", 200, 50);
                //   ctx.direction = "rtl";
                //   ctx.fillText("你好!", 200, 100);
                // }
                {
                    //this.context.filter
                    //this.context.drawImage()
                }
                // {
                //   this.context.setLineDash([0, 0])
                //   this.context.lineDashOffset = 0
                //   let path2Da: Path2D = new Path2D()
                //   path2Da.moveTo(25, 25)
                //   path2Da.lineTo(25, 105)
                //   path2Da.lineTo(75, 105)
                //   path2Da.lineTo(75, 25)
                //   // path2Da.closePath()
                //   this.context.strokeStyle = 'rgb(0,0,255)'
                //   this.context.stroke(path2Da)
                // }
                {
                    // this.context.rect(0, 0, 100, 200)
                    // this.context.stroke()
                    // // this.context.clip()
                    // this.context.fillStyle = "rgb(255,0,0)"
                    // this.context.fillRect(0, 0, 200, 200)
                }
                // { // 重置为其默认状态，清除后台缓冲区、绘制状态栈、绘制路径和样式
                //   this.context.reset()
                // }
                // {
                //   // 创建一个图层
                //   this.context.saveLayer()
                //   // 恢复到saveLayer前的状态
                //   this.context.restore()
                // }
                // {
                //   this.context.setTransform(1,0.5, -0.5, 1, 10, 10)
                //   this.context.fillStyle = 'rgb(0,0,255)'
                //   this.context.fillRect(0, 0, 100, 100)
                //   this.context.resetTransform()
                //   this.context.fillStyle = 'rgb(255,0,0)'
                //   this.context.fillRect(0, 0, 100, 100)
                // }
                {
                    // this.context.reset()
                    // this.context.lineWidth = 3
                    // this.context.strokeRect(30, 30, 50, 50)
                    // this.context.scale(2, 2) // Scale to 200%
                    // this.context.strokeRect(30, 30, 50, 50)
                }
                // { // 通过OffscreenCanvasRenderingContext2D 独立渲染出一张ImageBitmap
                //   let imageData = this.offContext.createImageData(50, 50)
                //   for (let i = 0; i < imageData.data.length; i += 4) {
                //     imageData.data[i + 0] = 0
                //     imageData.data[i + 1] = 255
                //     imageData.data[i + 2] = 0
                //     imageData.data[i + 3] = 255
                //   }
                //   this.offContext.putImageData(imageData, 50, 50)
                //   let image = this.offContext.transferToImageBitmap()
                //   this.context.transferFromImageBitmap(image)
                // }
                {
                    //this.context.toDataURL()
                }
                // {
                //   this.context.save();
                //   this.context.restore()
                // }
                {
                }
            });
            Gesture.create(GesturePriority.Low);
            TapGesture.create({ count: 1 });
            TapGesture.onAction((event: GestureEvent) => {
                console.log(`gesture - TapGesture`);
            });
            TapGesture.pop();
            Gesture.pop();
            Gesture.create(GesturePriority.Low);
            PanGesture.create();
            PanGesture.onActionStart((event: GestureEvent) => {
                console.log(`gesture - PanGesture - onActionStart ${event.offsetX} ${event.offsetY}`);
            });
            PanGesture.onActionUpdate((event: GestureEvent) => {
                console.log(`gesture - PanGesture - onActionUpdate ${event.offsetX} ${event.offsetY}`);
                if (event.fingerList.length > 0) {
                    let finger = event.fingerList[0];
                    console.log(`gesture - PanGesture - onActionUpdate finger ${finger.localX} ${finger.localY}`);
                }
            });
            PanGesture.onActionEnd((event: GestureEvent) => {
                console.log(`gesture - PanGesture - onActionEnd`);
            });
            PanGesture.onActionCancel(() => {
                console.log(`gesture - PanGesture - onActionCancel`);
            });
            PanGesture.pop();
            Gesture.pop();
        }, Canvas);
        // 图片是获取成功的
        // Image('resources/base/media/background.png')
        //   .width(200)
        Canvas.pop();
        Flex.pop();
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
